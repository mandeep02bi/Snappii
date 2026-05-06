import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snappis/Presentation/Controllers/Inbox_controller.dart';
import 'package:snappis/Presentation/Widgets/Flutter_chip_widget.dart';
import 'package:snappis/Presentation/Widgets/Inbox_tile.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InboxController(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text("Inbox",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),

              // FILTER GRID
              Consumer<InboxController>(
                builder: (_, c, __) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: c.filters.map((f) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChipWidget(
                          label: f,
                          selected: c.selectedFilter == f,
                          onTap: () => c.changeFilter(f),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // LIST
              Expanded(
                child: Consumer<InboxController>(
                  builder: (_, c, __) => ListView.builder(
                    itemCount: c.filteredMessages.length,
                    itemBuilder: (_, i) =>
                        InboxTile(item: c.filteredMessages[i]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}