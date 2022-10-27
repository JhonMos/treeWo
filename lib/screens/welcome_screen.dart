import 'package:flutter/material.dart';
import 'package:app_treewo/screens/login_screen.dart';
import 'package:flutter/gestures.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset("assets/images/TreewoIcon.png"),
              const SizedBox(height: 30),
              RichText(
                text: const TextSpan(
                  text: 'Welcome To ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: 'TreeWo',
                      style: TextStyle(
                        color: Color(0xFF8EC54F),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "Sowing Hope For The \nPlanet",
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFFCECFCB),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Image.asset("assets/images/welcome.png"),
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 150,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8BC34A),
                    elevation: 0,
                  ),
                  child: const Text("Get Started"),
                ),
              ),
              const SizedBox(height: 50),
              RichText(
                text: TextSpan(
                  text: 'Already Have Account? ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: const TextStyle(
                        color: Color(0xFF8EC54F),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
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
}
