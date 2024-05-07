import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
    this.obscureText = false,
    this.onSaved,
    this.onChanged,
    this.trailingIcon,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final int maxLines;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 241, 240, 240)
                .withOpacity(0.5), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Offset in x and y directions
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        cursorColor: kPrimaryColor,
        maxLines: maxLines,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30.0),

          hintText: hint,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor),
          suffixIcon: trailingIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    trailingIcon,
                    color: kPrimaryColor,
                  ),
                )
              : null, // Add suffix icon
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: color ?? kInputColor,
      ),
    );
  }
}
