import 'package:flutter/material.dart';
import 'package:trippin/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/login/login-bg.png'),
            // set the image position top
            alignment: Alignment.topCenter,
          ),
        ),
        // insert image and a rectangle
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        // make front
                        margin: const EdgeInsets.only(top: 50),
                        width: 300,
                        height: 150,
                        child: Image.asset('lib/images/login/title-white.png'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            _label("Email"),
                            const SizedBox(height: 5),
                            _inputField('dalkun@gmail.com', emailController),
                            const SizedBox(height: 20),
                            _label("Password"),
                            const SizedBox(height: 5),
                            _inputField('**********', passwordController,
                                isPassword: true),
                            const SizedBox(height: 20),
                            _loginButton(),
                            const SizedBox(height: 20),
                            // set center
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center, // Add this
                                children: [
                                  Text("Don’t have an account? ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter',
                                          fontSize: 16)),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                        color: Color(0xFF3485FF),
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets
                                            .zero, // Remove the default padding
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _label(String label) {
    // set align left
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xFF9C9C9C)));
    return TextField(
      style: const TextStyle(color: Colors.black, fontFamily: 'Inter'),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 15),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xFF9C9C9C), fontFamily: 'Inter', fontSize: 16),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginButton() {
    // set the button position to bottom
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 350,
        height: 50,
        margin: const EdgeInsets.only(top: 80),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3485FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text("Sign In",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  color: Colors.white,
                ))),
      ),
    );
  }
}
