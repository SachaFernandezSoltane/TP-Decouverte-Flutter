import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1/bloc/auth_bloc.dart';
import 'package:tp1/bloc/auth_event.dart';
import 'package:tp1/bloc/auth_state.dart';
import 'package:tp1/presentation/list_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                // BlocListener pour gérer les changements d'état
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      // Afficher un indicateur de chargement
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is AuthFailure) {
                      // Afficher un message d'erreur
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Erreur'),
                          content: Text(state.message),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else if (state is AuthAuthenticated) {
                      // Attendre 2 secondes avant de naviguer vers MyListPage
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyListPage()),
                        );
                      });
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthFailure) {
                        // Afficher l'erreur sous forme de texte dans la vue
                        return Column(
                          children: [
                            Text(state.message, style: TextStyle(color: Colors.red)),
                            ElevatedButton(
                              onPressed: () {
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
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    AuthLoginRequested(username: username, password: password),
                                  );
                                }
                              },
                              child: const Text('Login'),
                            ),
                          ],
                        );
                      } else {
                        // Afficher le bouton Login quand l'état n'est ni loading, ni failure
                        return ElevatedButton(
                          onPressed: () {
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
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginRequested(username: username, password: password),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(255, 13, 82, 139),
                          ),
                          child: const Text('Login'),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}