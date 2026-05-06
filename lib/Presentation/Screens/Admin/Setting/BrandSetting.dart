import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Widgets/Admin/livePreview.dart';
import 'package:snappis/Presentation/Widgets/Admin/logopicker.dart';

class Brandsetting extends StatefulWidget {
  const Brandsetting({super.key});

  @override
  State<Brandsetting> createState() => _BrandsettingState();
}

class _BrandsettingState extends State<Brandsetting> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: const Color(0xFFF9FAFB),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: SingleChildScrollView(
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
                            Text("Brand Settings",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("Customize your application's branding and appearance",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.save),
                          label: const Text("Save Changes"),
                        ),
                      ],
                    ),
                
                    const SizedBox(height: 24),
                
                    /// TABS
                    Row(
                      children: [
                        _tab("Logos", true),
                        _tab("Text", false),
                        _tab("Theme", false),
                      ],
                    ),
                
                    const SizedBox(height: 24),
                
                    /// LOGOS
                    Row(
                      children:  [
                        Expanded(
                          child: BrandLogoPicker(
                            title: "Logo Dark",
                            background: Colors.white,
                            onPicked: (bytes) {
                              // bytes is Uint8List?
                              if (bytes != null) {
                                print("Logo picked: ${bytes.length} bytes");
                              }
                            },
                          ),
                
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: BrandLogoPicker(
                            title: "Logo Light",
                            background: Colors.black,
                            onPicked: (bytes) {
                              // bytes is Uint8List?
                              if (bytes != null) {
                                print("Logo picked: ${bytes.length} bytes");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                
                    const SizedBox(height: 24),
                
                     BrandLogoPicker(
                      title: "Favicon",
                      background: Colors.white,
                      onPicked: (bytes) {
                              // bytes is Uint8List?
                              if (bytes != null) {
                                print("Logo picked: ${bytes.length} bytes");
                              }
                            },
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 24),

          /// RIGHT PREVIEW
          const LivePreview(),
        ],
      ),
    );
  }

  Widget _tab(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF10B981) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}