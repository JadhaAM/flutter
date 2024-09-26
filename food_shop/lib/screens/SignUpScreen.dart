import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSubmitting = false;

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });
      try {
        final response = await http.post(
          Uri.parse('http:// 192.168.0.104:5001/register'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": _nameController.text,
            "username": _usernameController.text,
            "email": _emailController.text,
            "password": _passwordController.text,
          }),
        );

        if (response.statusCode == 200) {
          _showAlertDialog("Registration successful", "You have been registered successfully");
          Navigator.pushReplacementNamed(context, '/');
        } else {
          _showAlertDialog("Registration failed", "An error occurred while registering");
        }
      } catch (error) {
        _showAlertDialog("Registration failed", "An error occurred while registering");
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17202A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/LoginBG.png',
                  width: 150,
                  height: 100,
                ),
                const SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextInput(
                        controller: _nameController,
                        labelText: "Full Name",
                        icon: Icons.person,
                        validator: RequiredValidator(errorText: 'Full Name is required'),
                      ),
                      _buildTextInput(
                        controller: _usernameController,
                        labelText: "Username",
                        icon: Icons.account_circle,
                        validator: RequiredValidator(errorText: 'Username is required'),
                      ),
                      _buildTextInput(
                        controller: _emailController,
                        labelText: "Email",
                        icon: Icons.email,
                        validator: EmailValidator(errorText: 'Enter a valid email'),
                      ),
                      _buildTextInput(
                        controller: _passwordController,
                        labelText: "Password",
                        icon: Icons.lock,
                        isPassword: true,
                        validator: RequiredValidator(errorText: 'Password is required'),
                      ),
                      const SizedBox(height: 25),
                      _buildSignUpButton(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  child: const Text(
                    "Already have an account? Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required String? Function(String?) validator,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: _isSubmitting ? null : _handleSignUp,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
        backgroundColor: const Color(0xFF4285F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: _isSubmitting
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : const Text(
        "Sign Up",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
      ),
    );
  }
}
