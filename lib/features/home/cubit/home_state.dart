part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  favoriteLoading,
  loading,
  success,
  failure,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final RepositoryListModel? repositoryListModel;
  final List<Items> repoList; // Changed to non-nullable with empty list default
  final bool hasReachedMax;
  final String? message;

  const HomeState({
    this.status = HomeStatus.initial,
    this.message,
    this.repositoryListModel,
    this.repoList = const [], // Default empty list instead of null
    this.hasReachedMax = false,
  });

  HomeState copyWith({
    HomeStatus? status,
    bool? hasReachedMax, // Made nullable to properly handle false values
    RepositoryListModel? repositoryListModel,
    List<Items>? repoList,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      repositoryListModel: repositoryListModel ?? this.repositoryListModel,
      repoList: repoList ?? this.repoList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        hasReachedMax,
        repositoryListModel,
        repoList, // No need for null check with default value
      ];
}
