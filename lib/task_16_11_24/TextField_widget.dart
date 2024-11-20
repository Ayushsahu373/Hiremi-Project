import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wyreflow_intern_ayush/task_16_11_24/colors.dart'; // Import the colors file

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryTextColor, // Use color from AppColors
        ),
        filled: true,
        fillColor: AppColors.textFieldFillColor, // Use color from AppColors
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor, // Use color from AppColors
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor, // Use color from AppColors
            width: 2,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
