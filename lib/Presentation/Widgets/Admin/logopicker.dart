import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BrandLogoPicker extends StatefulWidget {
  final String title;
  final Color background;
  final void Function(Uint8List?) onPicked;

  const BrandLogoPicker({
    super.key,
    required this.title,
    required this.background,
    required this.onPicked,
  });

  @override
  State<BrandLogoPicker> createState() => _BrandLogoPickerState();
}

class _BrandLogoPickerState extends State<BrandLogoPicker> {
  Uint8List? fileBytes;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null) {
      setState(() => fileBytes = result.files.single.bytes);
      widget.onPicked(fileBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Center(
            child: fileBytes == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.image_outlined, size: 40, color: Colors.grey),
                      SizedBox(height: 6),
                      Text("Failed to load image",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  )
                : Image.memory(fileBytes!, height: 80),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: pickFile,
              icon: const Icon(Icons.image),
              label: const Text("Browse"),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () => setState(() => fileBytes = null),
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ],
    );
  }
}
