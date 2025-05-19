import 'package:flutter/material.dart';
import 'package:portfolio/core/config/style.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/domain/model/project_model.dart';
import '../../../../core/util/static_dialog.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  Future<void> _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    try {
      final success = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!success) {
        errorDialog(context, '링크를 열 수 없습니다: $url', () {});
      }
    } catch (e) {
      errorDialog(context, '오류 발생: $e', () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (project.imagePaths.isNotEmpty)
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: project.imagePaths.map((imagePath) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                backgroundColor: Colors.transparent,
                                child: InteractiveViewer(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(imagePath),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

            const SizedBox(height: 20),


            Text(
              project.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              "주요 역할 및 작업 내역",
              style: context.textTheme.krBody1.copyWith(
                color: blue1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            ...project.description
                .split('\n')
                .map((line) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                line,
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15, height: 1.5),
              ),
            )),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: project.techStack
                  .map((tech) => Chip(
                label: Text(
                  tech,
                  style: const TextStyle(fontSize: 13),
                ),
              ))
                  .toList(),
            ),

            if (project.links.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(
                '🔗 관련 링크',
                style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: project.links.entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _launchURL(context, entry.value),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.link, size: 16, color: Colors.blue),
                        const SizedBox(width: 4),
                        Text(
                          entry.key,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue.shade700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
