import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import 'login.dart';

class VerifySmsScreen extends StatefulWidget {
  const VerifySmsScreen({Key? key}) : super(key: key);

  static const String routeName = '/forgot-password';

  @override
  State<VerifySmsScreen> createState() => _VerifySmsScreenState();
}

class _VerifySmsScreenState extends State<VerifySmsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final bool _isLogin = true;
  final bool _isLoading = false;
  final bool _hidePassword = true;
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
              child: Text.rich(
                TextSpan(
                  text:
                      'Kindly enter the verification code sent to your phone number',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              maxLength: 13,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Verify'),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'Back',
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
