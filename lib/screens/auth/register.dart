import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          heightFactor: 1.2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Hello Neighbour',
                    style: TextStyle(
                      color: Colors.cyanAccent.shade700,
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/1.webp',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 400,fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                TextFormField(
                  controller: emailController,
                  decoration:  InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent.shade100,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent.shade100,
                        width: 2.0,
                      ),
                    ),
                  ),

                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: Colors.cyanAccent.shade700,
                  ),
                  onPressed: isLoading ? null : _handleRegister,
                  child: isLoading
                      ? CircularProgressIndicator()
                      : const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Already have an account? Login here'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleRegister() {
    setState(() {
      isLoading = true;
    });

    // Simulate a login request. Replace this with your actual login logic.
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }
}
