// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';
import 'package:image_picker/image_picker.dart';
import 'package:savorsip/screens/home/my_home_page.dart';

class EditProfileScreen extends StatefulWidget {
  final String userID;
  const EditProfileScreen({super.key, required this.userID});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Users? currentUser; // Local variable to hold the updated user data

  @override
  void initState() {
    super.initState();
    _fetchAndSetCurrentUser();
  }

  Future<void> _fetchAndSetCurrentUser() async {
    try {
      Users fetchedUser = await Users.fetchUserData(widget.userID);
      setState(() {
        currentUser = fetchedUser;
      });
    } catch (e) {
      // Handle errors, e.g., user not found or network issues
      //print("Error fetching user data: $e");
    }
  }

  // ignore: unused_field
  bool _isEmptyField = false;
  bool _isPasswordMismatch = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  String _changeError = '';
  //final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _oldPasswordController = TextEditingController();

  Widget _entryField(String title, TextEditingController controller) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.0),
          ),
        ),
      ),
    );
  }

  Widget _passwordEntryField(String title, TextEditingController controller,
      bool passwordVisibility, Function togglePasswordVisibility) {
      var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: TextField(
        controller: controller,
        obscureText: !passwordVisibility,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.0),
          ),
          labelText: title,
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisibility ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () => togglePasswordVisibility(),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            _entryField("Change First Name", _firstNameController),
            _entryField("Change Last Name", _lastNameController),
            _entryField("Change username", _usernameController),
            _entryField("Old Password", _oldPasswordController),
            _passwordEntryField("New password", _passwordController,
                _passwordVisible, _togglePasswordVisibility),
            _passwordEntryField(
                "Confirm new password",
                _confirmPasswordController,
                _confirmPasswordVisible,
                _toggleConfirmPasswordVisibility),
            const SizedBox(height: 15),
            if (_isPasswordMismatch)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Passwords do not match',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            if (_changeError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _changeError,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                    child: ElevatedButton(
                      onPressed: () {
                        pickImageAndUpdateProfile();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                userID: widget
                                    .userID), // Or pass the whole updatedUser object if needed
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondaryContainer,
                          minimumSize: const Size(150, 50),
                          elevation: 6
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined, color: theme.colorScheme.onSecondaryContainer),
                          const SizedBox(width: 8),
                          Text('Change Picture',
                              style: TextStyle(color: theme.colorScheme.onSecondaryContainer)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          // Set flags for field checks
                          setState(() {
                            _isEmptyField =
                                false; // As we will use existing data if field is empty
                            _isPasswordMismatch =
                                _passwordController.text.isNotEmpty &&
                                    _passwordController.text !=
                                        _confirmPasswordController.text;
                            _changeError = '';
                          });

                          if (!_isPasswordMismatch) {
                            // Prepare new values, fallback to current values if fields are empty
                            String newFirstName =
                                _firstNameController.text.isEmpty
                                    ? currentUser!.firstName
                                    : _firstNameController.text;
                            String newLastName =
                                _lastNameController.text.isEmpty
                                    ? currentUser!.lastName
                                    : _lastNameController.text;
                            String newUsername =
                                _usernameController.text.isEmpty
                                    ? currentUser!.username
                                    : _usernameController.text;

                            // Call the updateUser method
                            String result = await Users.updateUser(
                              uid: currentUser!.uid,
                              firstName: newFirstName,
                              lastName: newLastName,
                              username: newUsername,
                              oldPassword: _oldPasswordController.text,
                              newPassword: _passwordController.text.isEmpty
                                  ? null
                                  : _passwordController.text,
                            );

                            if (result == "Success") {
                              // Update was successful
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Profile updated successfully')),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                      userID: widget
                                          .userID), // Or pass the whole updatedUser object if needed
                                ),
                              );
                            } else {
                              // Update failed, show error message
                              setState(() {
                                _changeError = result;
                                _firstNameController.clear();
                                _lastNameController.clear();
                                _usernameController.clear();
                                _oldPasswordController.clear();
                                _passwordController.clear();
                                _confirmPasswordController.clear();
                              });
                            }
                          } else {
                            // Handle password mismatch
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Passwords do not match')),
                            );
                            setState(() {
                              _firstNameController.clear();
                              _lastNameController.clear();
                              _usernameController.clear();
                              _oldPasswordController.clear();
                              _passwordController.clear();
                              _confirmPasswordController.clear();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          minimumSize: const Size(150, 50),
                          elevation: 10,
                        ),
                        child: Text(
                          'Save Changes',
                          style: TextStyle(color: theme.colorScheme.onPrimary,),
                        ),
                      ),
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

  Future<void> pickImageAndUpdateProfile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      try {
        if (currentUser != null) {
          await currentUser!.updateProfilePicture(image);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Profile picture updated successfully!')),
            );
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User not found.')),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Something went wrong: $e')),
          );
        }
      }
    }
  }
}
