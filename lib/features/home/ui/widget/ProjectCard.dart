import 'package:flutter/material.dart';

import '../../../../core/domain/model/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(project.description),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: project.techStack.map((tech) => Chip(label: Text(tech))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}