import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/app_router.gr.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                // Handle login logic
                // if (await context.read<AuthStore>().signInWithEmailAndPassword(
                //       email: emailController.text,
                //       password: passwordController.text,
                //     )) {
                if (context.mounted) context.router.replace(const MainScaffoldRoute());
                // } else {
                //   if (context.mounted) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text('Invalid credentials'),
                //       ),
                //     );
                //   }
                // }
              },
            ),
            const SizedBox(height: 12.0),
            TextButton(
              child: const Text('New here? Sign up'),
              onPressed: () {
                // Navigate to registration screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
