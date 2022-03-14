import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    return const Scaffold(
      body: Center(
        child: Text('Register'),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   static const String routeName = '/login';

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   final bool _isLogin = true;
//   final bool _isLoading = false;
//   bool _hidePassword = true;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _buildBackground(),
//           _buildForm(),
//         ],
//       ),
//     );
//   }

//   Widget _buildBackground() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Theme.of(context).primaryColor,
//             Theme.of(context).colorScheme.secondary,
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildForm() {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         height: MediaQuery.of(context).size.height * 0.7,
//         width: MediaQuery.of(context).size.width * 0.8,
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildLogo(),
//                 const SizedBox(height: 20),
//                 _buildEmailField(),
//                 const SizedBox(height: 20),
//                 _buildPasswordField(),
//                 const SizedBox(height: 20),
//                 _buildLoginButton(),
//                 const SizedBox(height: 20),
//                 _buildSignUpButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLogo() {
//     return Hero(
//       tag: 'logo',
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height * 0.25,
//         child: Image.asset('assets/images/tutissha.png'),
//       ),
//     );
//   }

//   Widget _buildEmailField() {
//     return TextFormField(
//       keyboardType: TextInputType.phone,
//       decoration: const InputDecoration(
//         labelText: 'Phone Number',
//         labelStyle: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//           fontSize: 16,
//         ),
//       ),
//       style: const TextStyle(
//         fontSize: 20,
//       ),
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Email can\'t be empty';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildPasswordField() {
//     return TextFormField(
//       obscureText: _hidePassword,
//       decoration: InputDecoration(
//         labelText: 'Password',
//         labelStyle: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//           fontSize: 16,
//         ),
//         suffixIcon: IconButton(
//           icon: Icon(
//             _hidePassword ? Icons.visibility_off : Icons.visibility,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             setState(() {
//               _hidePassword = !_hidePassword;
//             });
//           },
//         ),
//       ),
//       style: const TextStyle(
//         fontSize: 20,
//       ),
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Password can\'t be empty';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildLoginButton() {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.8,
//       height: 50,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xFF00C853),
//             Color(0xFF00E676),
//           ],
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(5),
//         ),
//       ),
//       child: TextButton(
//         child: const Text(
//           'Login',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//         onPressed: () {
//           if (_formKey.currentState!.validate()) {
//             Navigator.of(context).pushNamed('/home');
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildSignUpButton() {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.8,
//       height: 50,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xFFF44336),
//             Color(0xFFE53935),
//           ],
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(5),
//         ),
//       ),
//       child: TextButton(
//         child: const Text(
//           'Sign Up',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//         onPressed: () {
//           if (_formKey.currentState!.validate()) {
//             Navigator.of(context).pushNamed('/home');
//           }
//         },
//       ),
//     );
//   }
// }

