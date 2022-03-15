// Container(
//   width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height / 2,
//   decoration: const BoxDecoration(
//     gradient: LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [
//         // Colors.white,
//         Color.fromARGB(255, 15, 63, 28),
//         Color(0xff004e15)
//         // Colors.white,
//       ],
//     ),
//     borderRadius: BorderRadius.only(
//       bottomLeft: Radius.circular(100),
//       bottomRight: Radius.circular(100),
//     ),
//   ),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.end,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Align(
//         alignment: Alignment.center,
//         child: Image.asset(
//           'assets/images/tutissha.png',
//           width: MediaQuery.of(context).size.width / 2,
//           height: MediaQuery.of(context).size.height / 3,
//           fit: BoxFit.contain,
//         ),
//       ),
//       const SizedBox(height: 20),
//     ],
//   ),
// ),

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final bool _isLogin = true;
  bool _isLoading = false;
  bool _hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ProgressHUD(
        inAsyncCall: _isLoading,
        key: UniqueKey(),
        child: _loginUI(BuildContext, context),
        opacity: 0.3,
      ),
    );
  }

  Widget _loginUI(BuildContext, context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 15, 63, 28),
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/tutissha.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
              ],
            ),
          ),
          Form(
            child: _loginForm(context),
          ),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        // color: Colors.white,\
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
              style: const TextStyle(
                color: Colors.white,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _hidePassword ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: _hidePassword,
              style: const TextStyle(
                color: Colors.white,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                // color: Theme.of(context).primaryColor,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        _isLoading = false;
                      });
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
                TextButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
