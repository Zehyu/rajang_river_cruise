
class CruiseDestination {
  final String name;
  final String location;
  final String description;
  final String imagePath;
  final List<String> packages;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.description,
    required this.imagePath,
    required this.packages,
  });
}
