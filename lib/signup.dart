import 'package:flutter/material.dart';
import 'package:login_ui1/login.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  // TextEditingController to manage email, password, and confirm password input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text("Sign Up"),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the content vertically
        children: [
          // Email input field with padding
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0), // Horizontal padding for the text field
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                prefixIcon: const Icon(Icons.email),
                filled: true,
                fillColor: Colors.white, // Background color for the text field
              ),
            ),
          ),
          const SizedBox(
              height: 16.0), // Space between email and password fields

          // Password input field with padding
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0), // Horizontal padding for the text field
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: Colors.white, // Background color for the text field
              ),
            ),
          ),
          const SizedBox(
              height:
                  16.0), // Space between password and confirm password fields

          // Confirm Password input field with padding
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0), // Horizontal padding for the text field
            child: TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: Colors.white, // Background color for the text field
              ),
            ),
          ),
          const SizedBox(
              height: 24.0), // Space between confirm password field and button

          // Sign Up button
          ElevatedButton(
            onPressed: () {
              // Handle sign up logic here
              print("Sign Up button pressed");
            },
            child: const Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              backgroundColor: Colors.blueAccent, // Button color
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Rounded button corners
              ),
            ),
          ),
          const SizedBox(
              height: 16.0), // Space between button and additional options

          Spacer(),
          // Login container at the bottom
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      LoginView(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    // Define the bottom-to-top transition
                    const begin = Offset(0.0, 1.0); // Start from the bottom
                    const end = Offset.zero; // End at the top
                    const curve = Curves.easeInOut; // Animation curve

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Container(
              height: screenHeight / 14,
              width: double.infinity,
              color: Colors.cyan,
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16), // Text color for contrast
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
