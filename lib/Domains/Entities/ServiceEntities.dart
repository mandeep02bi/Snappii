class ServiceEntity1 {
  final String title;
  final String description;
  final int price;
  int quantity;

  ServiceEntity1({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}