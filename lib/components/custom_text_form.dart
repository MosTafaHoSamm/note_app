import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hint;
  final TextInputType type;
  final bool secure;
  final IconData? icon;
  final Function()? onpreseed;
  final TextEditingController controller;

  const CustomTextForm({
    required this.controller,
    required this.hint,
    required this.type,
    this.icon,
    this.onpreseed,
    required this.secure,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      keyboardType: type,
      decoration: InputDecoration(
        suffixIcon: icon != null
            ? InkWell(
                child: Icon(icon),
                onTap: onpreseed,
              )
            : null,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: hint,
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}
