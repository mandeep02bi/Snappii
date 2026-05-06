import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/Serviceentity.dart';
import 'package:snappis/Presentation/Widgets/Admin/Status_badage.dart';


class ServiceTable extends StatelessWidget {
  final List<ServiceEntity> services;
    final Function(ServiceEntity)? onRowTap; // 👈 ADD THIS


  const ServiceTable({super.key, required this.services, this.onRowTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            _header(),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: services.map((service) {
                    return InkWell(
                      onTap: () {
                        if (onRowTap != null) {
                          onRowTap!(service);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: AppColors.border),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(child: Text(service.id)),
                            Expanded(child: Text(service.name)),
                            Expanded(child: Text(service.company)),
                            Expanded(child: Text(service.amount)),
                            Expanded(
                                child: StatusBadge(
                                    status:
                                        service.status)),
                            const Expanded(
                                child: Text(
                                    "View Details")),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: const Row(
        children: [
          Expanded(child: Text("Transaction ID")),
          Expanded(child: Text("Date & Name")),
          Expanded(child: Text("Amount")),
          Expanded(child: Text("Status")),
          Expanded(child: Text("Action")),
        ],
      ),
    );
  }
}
