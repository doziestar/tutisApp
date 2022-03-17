import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:tutis/screens/auth/login.dart';

import '../../models/auth/user_signup.dart';
import '../../providers/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _animation;
  final bool _isLogin = true;
  bool _isLoading = false;
  bool _hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserData _signUpData = UserData(
    phoneNumber: null,
    password: null,
    firstName: null,
    lastName: null,
    email: null,
  );

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

  void signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        _formKey.currentState!.save();
        print(_signUpData);
        await Provider.of<Auth>(context, listen: false).signUp(_signUpData);
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
              // height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.contain,
            ),
          ),

          // const SizedBox(height: 20),
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
                'Sign Up to Tutis',
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
              onSaved: (value) => _signUpData.phoneNumber = value,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
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
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              onSaved: (value) => _signUpData.email = value,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full Name',
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
              keyboardType: TextInputType.text,
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
                _signUpData.firstName = value;
                _signUpData.lastName = value;
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) => _signUpData.password = value,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
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
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                      signup();
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
                  'Already have an account?',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
                TextButton(
                  child: Text(
                    'Login',
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
