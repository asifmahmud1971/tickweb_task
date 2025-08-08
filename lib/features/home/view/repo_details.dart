import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:readback/core/constants/app_text_style.dart';
import 'package:readback/core/constants/theme_color.dart';
import 'package:readback/features/home/model/repository_list_model.dart';
import 'package:readback/features/theme/cubit/theme_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryDetailsPage extends StatelessWidget {
  final Items repository;

  const RepositoryDetailsPage({Key? key, required this.repository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final theme = ThemeColor(state.themeMode);
        return Scaffold(
          appBar: AppBar(
            title: Text('Details'),
            centerTitle: false,
            actions: [
              Row(
                children: [
                  Text('Dark mode', style: TextStyle(fontSize: 14)),
                  CupertinoSwitch(
                    value: state.themeMode == ThemeModeStatus.dark,
                    onChanged: (bool val) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderSection(),
                const SizedBox(height: 24),
                _buildDescriptionSection(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                repository.fullName ?? 'No name',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildStatsSection()
          ],
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final theme = ThemeColor(state.themeMode);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              width: 1.sw,
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(repository.owner?.avatarUrl ?? ''),
                  ),
                  5.verticalSpace,
                  Text(repository.name ?? ""),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Remove default padding
                      alignment:
                          Alignment.center, // Center content horizontally
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Take minimum width
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Center vertically
                      children: [
                        FaIcon(
                          FontAwesomeIcons.github,
                          size: 16.r,
                        ),
                        SizedBox(width: 8), // Add spacing between icon and text
                        Flexible(
                          child: AutoSizeText(
                            repository.gitUrl ?? "",
                            textAlign: TextAlign
                                .center, // Center text within its space
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Text(
              repository.description ?? 'No description provided',
              style: kBodyRegularRegular,
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatsSection() {
    return Row(
      children: [
        _buildStatItem(Icons.star, '', repository.stargazersCount),
        6.horizontalSpace,
        _buildStatItem(Icons.call_split, 'Forks', repository.forksCount),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String label, dynamic value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12.sp),
        label.isNotEmpty
            ? Text(
                '$label: ${value ?? 'N/A'}',
                style: kBodyRegularMedium.copyWith(fontSize: 12.sp),
              )
            : Text(
                '${value ?? 'N/A'}',
                style: kBodyRegularMedium.copyWith(fontSize: 12.sp),
              ),
      ],
    );
  }

  Widget _buildTopicsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Topics',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: (repository.topics ?? [])
              .map((topic) => Chip(
                    label: Text(topic),
                    backgroundColor: Colors.blue[50],
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Links',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            if (repository.homepage?.isNotEmpty ?? false)
              ActionChip(
                label: const Text('Homepage'),
                avatar: const Icon(Icons.home, size: 18),
                onPressed: () => _launchUrl(repository.homepage!),
              ),
            ActionChip(
              label: const Text('Issues'),
              avatar: const Icon(Icons.bug_report, size: 18),
              onPressed: () => _launchUrl(repository.issuesUrl ?? ''),
            ),
            ActionChip(
              label: const Text('Pull Requests'),
              avatar: const Icon(Icons.code, size: 18),
              onPressed: () => _launchUrl(repository.pullsUrl ?? ''),
            ),
            ActionChip(
              label: const Text('Releases'),
              avatar: const Icon(Icons.new_releases, size: 18),
              onPressed: () => _launchUrl(repository.releasesUrl ?? ''),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetadataSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Metadata',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: [
            _buildMetadataRow('Created', _formatDate(repository.createdAt)),
            _buildMetadataRow('Last pushed', _formatDate(repository.pushedAt)),
            _buildMetadataRow('Default branch', repository.defaultBranch),
            _buildMetadataRow('License', repository.license?.name),
            _buildMetadataRow('Visibility', repository.visibility),
            _buildMetadataRow('Archived', repository.archived?.toString()),
            _buildMetadataRow('Template', repository.isTemplate?.toString()),
          ],
        ),
      ],
    );
  }

  TableRow _buildMetadataRow(String label, String? value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(value ?? 'N/A'),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return 'N/A';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }

  Color _getLanguageColor(String language) {
    final colors = {
      'Dart': Colors.blue,
      'JavaScript': Colors.yellow,
      'TypeScript': Colors.blueAccent,
      'Python': Colors.green,
      'Java': Colors.orange,
      'Kotlin': Colors.purple,
      'Swift': Colors.red,
      'C++': Colors.pink,
      'Go': Colors.cyan,
      'Rust': Colors.orange,
      'Ruby': Colors.red,
      'PHP': Colors.purple,
      'C#': Colors.green,
    };
    return colors[language] ?? Colors.grey;
  }
}
