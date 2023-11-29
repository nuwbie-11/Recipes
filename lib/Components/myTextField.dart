import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final void Function(dynamic) onChanged;
  final bool obscured;
  final TextInputType keyboardType;
  final bool formatted;
  final Function()? onComplete;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.onChanged,
    this.obscured = false,
    this.keyboardType = TextInputType.text,
    this.formatted = false,
    this.onComplete,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        child: TextField(
          inputFormatters: [
            widget.formatted
                ? FilteringTextInputFormatter.deny(RegExp(r'\s')) // Deny spaces
                : FilteringTextInputFormatter.deny(RegExp(r'')),
          ],
          keyboardType: widget.keyboardType,
          obscureText: widget.obscured,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: widget.hint),
          controller: widget.controller,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onComplete,
        ),
      ),
    );
  }
}
