import 'package:flutter/material.dart';
import 'package:instagram_clone/firebase_service/firebase_authentication.dart';
import 'package:instagram_clone/main.dart';
// import 'package:instagram_clone/data/firebase_service/firebase_auth.dart';
import 'package:instagram_clone/screens/login.dart';
// import 'package:instagram_clone/screens/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _email = TextEditingController();
  final _usernamecontroller = TextEditingController();
  final _biocontroller = TextEditingController();
  final _password = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  late final String inner;
  late final bool say;
  late String displayMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              'assets/img/insta.png',
              width: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            //for circle avatar
            const CircleAvatar(
              backgroundImage: AssetImage('assets/img/avatar.png'),
              radius: 30,
            ),
            const SizedBox(
              height: 40,
            ),
            _buildfield(_email, Icons.email, 'Email', false),
            const SizedBox(
              height: 10,
            ),
            _buildfield(_usernamecontroller, Icons.man, 'Username', false),
            const SizedBox(
              height: 10,
            ),
            _buildfield(_biocontroller, Icons.password, 'Bio', false),
            const SizedBox(
              height: 10,
            ),
            _buildfield(_password, Icons.lock, 'Password', true),
            const SizedBox(
              height: 10,
            ),
            _buildfield(_confirmpasswordcontroller, Icons.lock_outline,
                'Confirm Password', true),
            const SizedBox(
              height: 10,
            ),

            //######################SIGN UP BUTTON
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, // Full-width button
                child: ElevatedButton(
                  onPressed: () async {
                    final message = await AuthService().registration(
                        email: _email.text, password: _password.text);
                    if (message!.contains('Success')) {
                      navigatorKey.currentState?.push(MaterialPageRoute(
                          builder: (context) => const Login()));
                    } else {
                      if (message.contains('Password is too weak')) {
                        displayMessage = 'Password is too weak';
                      } else if (message.contains(
                          'The account already exists for this email')) {
                        displayMessage = 'Account already exists';
                      } else {
                        displayMessage = message;
                      }
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$displayMessage')));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text('Sign me Up',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Already have an Account?',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: Text('LogIn',
                        style: Theme.of(context).textTheme.displaySmall),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildfield(
      TextEditingController controller, IconData icon, String inner, bool say) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText: say,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey[600],
          ),
          hintText: inner,
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
