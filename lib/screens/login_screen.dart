import 'package:app_treewo/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final user = TextEditingController();
  final pass = TextEditingController();
  final bool view = false;

  String username = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("assets/images/login.png"),
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Sign In To ',
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      InputLogin(
                        icon: const Icon(Icons.person),
                        hintText: "Username",
                        obscureText: false,
                        controller: user,
                      ),
                      const SizedBox(height: 15),
                      InputLogin(
                        icon: const Icon(Icons.key_sharp),
                        hintText: "Password",
                        obscureText: true,
                        controller: pass,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 150,
                  child: ElevatedButton(
                    onPressed: () {
                      username = user.text;
                      password = pass.text;
                      if(username == "" || password == ""){
                        print("Debes colocar un usuario y contraseña");
                      }else if(username == "prueba@heippi.com" && password == "\$TecPass05"){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      }else{
                        print("Usuario o contraseña incorrectos");
                      }

                      user.text = '';
                      pass.text = '';
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8BC34A),
                      elevation: 0,
                    ),
                    child: const Text("Sign In"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputLogin extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const InputLogin({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: icon,
          prefixIconColor: Colors.grey,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF8BC34A)),
              borderRadius: BorderRadius.circular(12)),
          fillColor: const Color(0xFFFFFFFF),
          filled: true),
    );
  }
}
