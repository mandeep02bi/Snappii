import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Domains/controllers/currencycontrollersetting.dart';

class Currencysetting extends StatefulWidget {
  const Currencysetting({super.key});

  @override
  State<Currencysetting> createState() => _CurrencysettingState();
}

class _CurrencysettingState extends State<Currencysetting> {
@override
Widget build(BuildContext context) {
  final ctrl = Get.find<CurrencySettingsController>();

  return Scaffold(
    backgroundColor: const Color(0xFFF9FAFB),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Obx(() => SingleChildScrollView(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Currency Settings",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                          "Configure how currency values are displayed throughout the application",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF59B981),
                      ),
                      onPressed: () {
                        print("Currency: ${ctrl.currencyCode.value}");
                        print("Decimals: ${ctrl.decimalPlaces.value}");
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Save Changes"),
                    )
                  ],
                ),
        
                const SizedBox(height: 24),
        
                /// CARD
                SingleChildScrollView(
                  child: _settingCard(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                          Text(
                            "₹1,234.56",
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                      
                          const SizedBox(height: 24),
                      
                          Row(
                            children: [
                              _dropdown(
                                label: "Default Currency",
                                value: ctrl.currencyCode.value,
                                items: const ['INR', 'USD', 'EUR'],
                                onChanged: ctrl.setCurrency,
                              ),
                              const SizedBox(width: 16),
                              _dropdown(
                                label: "Decimal Places",
                                value: ctrl.decimalPlaces.value.toString(),
                                items: const ['0', '1', '2', '3'],
                                onChanged: (v) =>
                                    ctrl.setDecimals(int.parse(v)),
                              ),
                            ],
                          ),
                      
                          const SizedBox(height: 24),
                      
                          Row(
                            children: [
                              _optionChip(
                                selected: ctrl.symbolBefore.value,
                                label: "\$ 100",
                                onTap: () => ctrl.toggleSymbolPosition(true),
                              ),
                              const SizedBox(width: 12),
                              _optionChip(
                                selected: !ctrl.symbolBefore.value,
                                label: "100 \$",
                                onTap: () => ctrl.toggleSymbolPosition(false),
                              ),
                            ],
                          ),
                      
                          const SizedBox(height: 24),
                      
                          Row(
                            children: [
                              _optionChip(
                                selected:
                                    ctrl.decimalSeparator.value == 'dot',
                                label: "Dot (123.45)",
                                onTap: () =>
                                    ctrl.setDecimalSeparator('dot'),
                              ),
                              const SizedBox(width: 12),
                              _optionChip(
                                selected:
                                    ctrl.decimalSeparator.value == 'comma',
                                label: "Comma (123,45)",
                                onTap: () =>
                                    ctrl.setDecimalSeparator('comma'),
                              ),
                            ],
                          ),
                      
                          const SizedBox(height: 24),
                      
                          SwitchListTile(
                            title: const Text("Show Decimals"),
                            value: ctrl.showDecimals.value,
                            onChanged: ctrl.toggleShowDecimals,
                          ),
                      
                          SwitchListTile(
                            title: const Text("Add Space"),
                            value: ctrl.addSpace.value,
                            onChanged: ctrl.toggleAddSpace,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
      )),
    ),
  );
}

  Widget _optionChip({
  required bool selected,
  required String label,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF59B981) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: selected
                ? const Color(0xFF59B981)
                : const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Text(label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
              )),
          if (selected)
            const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(Icons.check, color: Colors.white, size: 16),
            )
        ],
      ),
    ),
  );
}
Widget _dropdown({
  required String label,
  required String value,
  required List<String> items,
  required ValueChanged<String> onChanged,
}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => onChanged(v!),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    ),
  );
}
Widget _settingCard({required Widget child}) {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFE5E7EB)),
    ),
    child: child,
  );
}

}