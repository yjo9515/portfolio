class Project {
  final String title;
  final String description;
  final List<String> imagePaths;
  final List<String> techStack;
  final Map<String, String> links;

  Project({
    required this.title,
    required this.description,
    required this.imagePaths,
    required this.techStack,
    required this.links,
  });
}
