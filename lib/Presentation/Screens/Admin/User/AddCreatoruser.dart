import 'package:flutter/material.dart';

class Addcreatoruser extends StatefulWidget {
  const Addcreatoruser({super.key});

  @override
  State<Addcreatoruser> createState() => _AddcreatoruserState();
}

class _AddcreatoruserState extends State<Addcreatoruser> {
  bool hidePassword = true;
  bool hideConfirm = true;
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        width: 480,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add New Brand",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),

              const SizedBox(height: 24),

              _label("Name"),
              _input(),

              const SizedBox(height: 16),

              _label("Email"),
              _input(),

              const SizedBox(height: 16),

              _label("Password"),
              _passwordField(
                obscure: hidePassword,
                onToggle: () =>
                    setState(() => hidePassword = !hidePassword),
              ),

              const SizedBox(height: 16),

              _label("Confirm Password"),
              _passwordField(
                obscure: hideConfirm,
                onToggle: () =>
                    setState(() => hideConfirm = !hideConfirm),
              ),

              const SizedBox(height: 16),

              _label("Role"),
              DropdownButtonFormField<String>(
                value: selectedRole,
                hint: const Text("Select Role"),
                decoration: _inputDecoration(),
                items: const [
                  DropdownMenuItem(
                      value: "Brand", child: Text("Brand")),
                  // DropdownMenuItem(
                  //     value: "Team Member",
                  //     child: Text("Team Member")),
                ],
                onChanged: (v) => setState(() => selectedRole = v),
              ),

              const SizedBox(height: 32),

              /// ACTION BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22C55E),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {},
                    child: const Text("Save"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /// ---------- UI HELPERS ----------

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: RichText(
          text: TextSpan(
            text: text,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            children: const [
              TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      );

  Widget _input() => TextField(
        decoration: _inputDecoration(),
      );

  Widget _passwordField(
      {required bool obscure, required VoidCallback onToggle}) {
    return TextField(
      obscureText: obscure,
      decoration: _inputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            size: 20,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}