import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1/bloc/auth_bloc.dart';
import 'package:tp1/bloc/auth_event.dart';
import 'package:tp1/bloc/auth_state.dart';
import 'package:tp1/presentation/list_bar.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AnimationController controller;

  bool isLoading = false;

  void _handleLogin(BuildContext context) {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text('Les champs ne peuvent pas être vides.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });

      BlocProvider.of<AuthBloc>(context).add(
        AuthLoginRequested(username: username, password: password),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Login page'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(hintText: 'Username'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthAuthenticated) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const MyListPage()),
                      );
                    }
                  },
                  child: const SizedBox.shrink(),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    String? errorMessage;
                    if (state is AuthFailure) {
                      errorMessage = state.message;
                    }
                    
                    return Column(
                      children: [
                        if (errorMessage != null)
                          Text(
                            errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () => _handleLogin(context),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      const Color.fromARGB(255, 13, 82, 139),
                                ),
                                child: const Text('Login'),
                              ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
