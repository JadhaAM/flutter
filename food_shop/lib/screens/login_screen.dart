import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse('http:// 192.168.0.100:5001/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': values['username'],
          'password': values['password'],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];

        Provider.of<AuthProvider>(context, listen: false).setToken(token);
        Navigator.pushReplacementNamed(
            context, '/main'); // Navigate to main screen
      } else {
        _showErrorDialog('Invalid login credentials');
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) =>
          AlertDialog(
            title: Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text('Okay'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/LoginBG.png',
                width: 150,
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 30),
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextInput('username', 'User name', Icons.person),
                    SizedBox(height: 20),
                    _buildTextInput(
                        'password', 'Password', Icons.lock, isPassword: true),
                    SizedBox(height: 20),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: () => _login(context),
                      child: Text('Log In'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      child: Text("Don't have an account? Sign Up"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput(String name, String labelText, IconData icon,
      {bool isPassword = false}) {
    return FormBuilderTextField(
      name: name,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      validator: RequiredValidator(
          errorText: '$labelText is required'), // Updated validator
    );
  }

}