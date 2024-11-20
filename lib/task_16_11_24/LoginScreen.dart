import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wyreflow_intern_ayush/task_16_11_24/TextField_widget.dart';
import 'package:wyreflow_intern_ayush/task_16_11_24/colors.dart'; // Import the colors file

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Use from AppColors
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.23,
            child: SizedBox(
              width: size.width * 0.55,
              child: Column(
                children: [
                  Text(
                    'Login here',
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor, // Use from AppColors
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Welcome back you’ve been missed!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor, // Use from AppColors
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.32,
            left: size.width * 0.075,
            child: SizedBox(
              width: size.width * 0.85,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                            .hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle Forgot Password
                        },
                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.poppins(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor, // Use from AppColors
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.58,
            left: size.width * 0.075,
            child: SizedBox(
              width: size.width * 0.85,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor, // Use from AppColors
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor:
                      AppColors.buttonShadowColor, // Use from AppColors
                  elevation: 10,
                ),
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: AppColors.buttonTextColor) // Use from AppColors
                    : Text(
                        'Sign in',
                        style: GoogleFonts.poppins(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600,
                          color:
                              AppColors.buttonTextColor, // Use from AppColors
                        ),
                      ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.68,
            left: size.width * 0.075,
            child: SizedBox(
              width: size.width * 0.85,
              child: TextButton(
                onPressed: () {
                  // Handle Create Account
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      AppColors.backgroundColor, // Use from AppColors
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Create new account',
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor, // Use from AppColors
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
