import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.isPassword = false,
    required this.controller,
  });

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool isPassword;
  final TextEditingController controller;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        cursorColor: const Color(0xff094546),
        maxLines: widget.isPassword ? 1 : widget.maxLines,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
          border: buildBorder(const Color(0xffE3E5E8)),
          enabledBorder: buildBorder(const Color(0xffE3E5E8)),
          focusedBorder: buildBorder(const Color(0xff094546)),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xff094546),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
