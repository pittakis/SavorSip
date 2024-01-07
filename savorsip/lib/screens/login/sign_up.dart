import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:savorsip/screens/home/home.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isEmptyField = false;
  bool _isPasswordMismatch = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();


  void _handleLogin() async {
    try {
      // Attempt to sign in the user with Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // If successful, navigate to the HomeNearby screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeNearby()),
      );
    } on FirebaseAuthException catch (e) {
      // Show an error message if login failed
      String errorMessage;
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        errorMessage = 'Invalid email or password.';
      } else {
        errorMessage = 'An error occurred. Please try again later.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            _entryField("First Name", _firstNameController),
            _entryField("Last Name", _lastNameController),
            _entryField("username", _usernameController),
            _entryField("email", _emailController),
            _passwordEntryField("password", _passwordController, _passwordVisible, _togglePasswordVisibility),
            _passwordEntryField("Confirm password", _confirmPasswordController,_confirmPasswordVisible,_toggleConfirmPasswordVisibility),
            const SizedBox(height: 15),
            if (_isEmptyField)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'No Field can be empty',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Choose the icon based on the password visibility
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // Update the state to toggle password visibility
                        setState(() {
                          _isPasswordMismatch = false;
                        });
                        if(_isEmptyField == false && _isPasswordMismatch == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeNearby()),
                          );
                        }
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF624E99),
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text(
                      'Sign-Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
