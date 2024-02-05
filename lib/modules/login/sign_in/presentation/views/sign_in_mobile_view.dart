import 'package:flutter/material.dart';

// TODO: Pranjal - Work on Sign In Screen

class SignInMobileView extends StatefulWidget {
  const SignInMobileView({super.key});

  @override
  State<SignInMobileView> createState() => _SignInMobileViewState();
}

class _SignInMobileViewState extends State<SignInMobileView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController uidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 67, left: 15),
              child: Text(
                'TM System',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                  color: Color.fromARGB(255, 157, 37, 116),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50, right: 200),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                'Add or select your details to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 113, 113, 113),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: uidController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 157, 37, 116),
                            width: 2.0,
                          ),
                        ),
                        labelText: 'Employee UID',
                        prefixIcon: const Icon(Icons.mail),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Employee UID';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 157, 37, 116),
                            width: 2.0,
                          ),
                        ),
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 157, 37, 116),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Login Successful.');
                      uidController.clear();
                      passwordController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 157, 37, 116),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
