import 'package:flutter/material.dart';
import 'package:login_ui1/signup.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // TextEditingController to manage email and password input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.cyan,
      // appBar: AppBar(
      //   backgroundColor: Colors.cyan,
      //   centerTitle: true,
      //   title: const Text("Login"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the content vertically
          children: [
            Spacer(),

            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0), // Card margin
              elevation: 5.0, // Shadow for the card
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15.0), // Rounded corners for the card
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0), // Padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .stretch, // Stretch content to fill width
                  children: [
                    Text("Login"),
                    SizedBox(
                      height: 50,
                    ),
                    // Email input field with padding
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        prefixIcon: const Icon(Icons.email),
                        filled: true,
                        fillColor:
                            Colors.white, // Background color for the text field
                      ),
                    ),
                    const SizedBox(
                        height:
                            16.0), // Space between email and password fields

                    // Password input field with padding
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        filled: true,
                        fillColor:
                            Colors.white, // Background color for the text field
                      ),
                    ),
                    const SizedBox(
                        height:
                            24.0), // Space between password field and button

                    // Login button
                    ElevatedButton(
                      onPressed: () {
                        // Handle login logic here
                        print("Login button pressed");
                      },
                      child: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        backgroundColor: Colors.blueAccent, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Rounded button corners
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                            16.0), // Space between button and additional options

                    // Forgot password option
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password logic
                          print("Forgot Password tapped");
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            // const SizedBox(
            //     height: 20.0), // Space between card and SignUp container
            // SignUp container at the bottom
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SignupView(),
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
                color: Colors.red,
                child: const Center(
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16), // Text color for contrast
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
