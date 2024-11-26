import 'package:flutter/material.dart';
import 'package:instagram_clone/firebase_service/firebase_authentication.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/screens/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'assets/img/insta.png',
        width: 200,
        // height: 80,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 90),

      //email textfield
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: TextField(
          controller: _email,
          decoration: InputDecoration(
            hintText: 'Enter email address',
            filled: true,
            // fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 2),
            ),
          ),
        ),
      ),
      const SizedBox(height: 16),

      // Password TextField
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: TextField(
          controller: _password,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                )),
            filled: true,
            // fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 2),
            ),
          ),
        ),
      ),

      const SizedBox(height: 24),
      // Login Button////////////////////////////////
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final message = await AuthService()
                .login(email: _email.text, password: _password.text);
            if (message!.contains('Success')) {
              navigatorKey.currentState?.pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignupPage()));
            } else if (message == 'Wrong password provided for that user.') {
              print('wrong password');
            } else {
              scaffoldKey.currentState
                  ?.showSnackBar(SnackBar(content: Text('Shrijana $message')));
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: Colors.black,
          ),
          child: Text('Log In',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Colors.white)),
        ),
      ),

      const SizedBox(height: 16),
      // Forgot Password////////////////////////////////////////////

      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              print('Forgot password');
            },
            child: Text(
              'Forgot password?',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              // go to next page
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignupPage()));
            },
            child: Text('SignUp',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.blue)),
          ),
          const SizedBox(width: 10),
        ],
      ),

      const SizedBox(height: 40),
      // Login with Facebook
    ]));
  }
}
