import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:readback/core/app/app_preference.dart';
import 'package:readback/core/components/custom_progress_loader.dart';
import 'package:readback/core/components/custom_refresh/src/smart_refresher.dart';
import 'package:readback/features/home/model/repository_list_model.dart';
import 'package:readback/features/home/repository/home_repo.dart';

import '../../../core/app/app_dependency.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(const HomeState());

  late RefreshController refreshController;
  final HomeRepository homeRepository;
  final TextEditingController searchController = TextEditingController();
  int page = 1;
  String? message;
  final _appPreferences = instance.get<AppPreferences>();

  Future<void> getRepoList({
    String? sort,
    int? perPage,
    String? text,
    bool isSearch = false,
    bool isLoader = true
  }) async {
    if (isLoader) {
      showProgressDialog();
    }

    try {
      // Handle refresh case
      if (page == 1 || refreshController.isRefresh || isSearch) {
        page = 1;
        emit(state.copyWith(
          status: HomeStatus.loading,
          repoList: [], // Clear existing list on refresh
          repositoryListModel: null, // Reset model
          hasReachedMax: false,
        ));
      }

      // Check if we've reached the maximum
      if (state.hasReachedMax) {
        refreshController.loadNoData();
        return;
      }

      // Make API call
      final response = await homeRepository.getRepoList({
        "page": page,
        "sort": sort ?? "star", // Use provided sort or default
        "per_page": perPage ?? 10,
        "q": searchController.text.isNotEmpty?searchController.text:"flutter"
      });

      response.fold(
            (failure) {
          emit(state.copyWith(
            status: HomeStatus.failure,
            message: failure.message,
          ));
          refreshController.refreshFailed();
          refreshController.loadFailed();
          dismissProgressDialog();
        },
            (data) {
          final newItems = data.items ?? [];
          final currentItems = state.repoList;

          // Combine old and new items
          List<Items> combinedItems = [
            ...(page == 1 ? [] : currentItems),
            ...newItems
          ];

          // Determine if we've reached the end
          final hasReachedMax = newItems.isEmpty || newItems.length < (perPage ?? 10);

          emit(state.copyWith(
            status: HomeStatus.success,
            repoList: combinedItems,
            repositoryListModel: RepositoryListModel(items: combinedItems),
            hasReachedMax: hasReachedMax,
          ));
          _appPreferences.saveRepoList(combinedItems);
          // Update page only if we got new items
          if (newItems.isNotEmpty) {
            page++;
          }

          // Handle refresh controller states
          if (refreshController.isRefresh) {
            refreshController.refreshCompleted();
          } else {
            if (hasReachedMax) {
              refreshController.loadNoData();
            } else {
              refreshController.loadComplete();
            }
          }
          dismissProgressDialog();
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        message: e.toString(),
      ));
      refreshController.refreshFailed();
      refreshController.loadFailed();
      dismissProgressDialog();
    }
  }
}
