class TransactionEntity {
  final String id;
  final String company;
  final String date;
  final double amount;
  final String status;

  TransactionEntity({
    required this.id,
    required this.company,
    required this.date,
    required this.amount,
    required this.status,
  });
}
