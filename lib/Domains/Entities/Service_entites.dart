class ServiceEntity {
  final String title;
  final String description;
  final int price;
  int quantity;

  ServiceEntity({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 0,
  });
}
