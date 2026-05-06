import 'package:flutter/material.dart';
import 'package:snappis/Domains/Entities/Inbox_entities.dart';

class InboxController extends ChangeNotifier {
  String selectedFilter = "All";

  final List<String> filters = [
    "All",
    "Active",
    "Campaign",
    "Book",
    "Unread",
    "Payment",
    "Complete"
  ];

  final List<InboxEntity> allMessages = [
    InboxEntity(
      title: "Food Shop",
      subtitle: "Brand is Offering: ₹10000",
      time: "12:45 AM",
      unread: 1,
      category: "Campaign",
    ),
    InboxEntity(
      title: "Vishal Mega Mart",
      subtitle: "Brand is Offering: ₹6000",
      time: "12:45 AM",
      unread: 3,
      category: "Campaign",
    ),
    InboxEntity(
      title: "Payment Credited",
      subtitle: "₹6000 Added to your wallet",
      time: "12:45 AM",
      unread: 1,
      category: "Payment",
    ),
  ];

  List<InboxEntity> get filteredMessages {
    if (selectedFilter == "All") return allMessages;
    return allMessages
        .where((e) => e.category == selectedFilter)
        .toList();
  }

  void changeFilter(String value) {
    selectedFilter = value;
    notifyListeners();
  }
}
