import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:tutis/models/auth/login.dart';
import 'package:tutis/providers/auth.dart';

import 'forgot_password.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final bool _isLogin = true;
  bool _isLoading = false;
  bool _hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginData _loginData = LoginData(phoneNumber: null, password: null);

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        _formKey.currentState!.save();
        print(_loginData);
        await Provider.of<Auth>(context, listen: false).login(_loginData);
      } on PlatformException {
        // ProgressHUD.showErrorWithStatus(e.message);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: ProgressHUD(
          inAsyncCall: _isLoading,
          key: UniqueKey(),
          child: _loginUI(BuildContext, context),
          // opacity: 0.3,
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext, context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/tutissha.png',
              width: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.contain,
            ),
          ),
          Form(
            key: _formKey,
            child: _loginForm(context),
          ),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(context).cardColor,
      shadowColor: Theme.of(context).cardColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.headline1!.color,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).textTheme.headline1!.color!,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).textTheme.headline1!.color!,
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              onSaved: (value) {
                _loginData.phoneNumber = value!;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).textTheme.headline1!.color!,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).textTheme.headline1!.color!,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _hidePassword ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).textTheme.headline1!.color,
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
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
              ),
              onSaved: (value) {
                _loginData.password = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text.rich(
                  TextSpan(
                    text: 'Forgot Password?',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1!.color,
                    ),
                    children: [
                      TextSpan(
                        text: ' Click here',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.popAndPushNamed(
                              context,
                              ForgotPasswordScreen.routeName,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
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
                      login();
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
                        builder: (context) => const RegisterScreen(),
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
