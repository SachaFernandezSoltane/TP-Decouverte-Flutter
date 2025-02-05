import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';  // Importer les événements
import 'auth_state.dart';  // Importer les états

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // Définir le handler pour l'événement AuthLoginRequested
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());  // Émettre un état de chargement pendant la connexion

      try {
        // Simuler une connexion avec un délai (remplace ceci avec ta logique réelle)
        await Future.delayed(Duration(seconds: 2));
        
      if (event.username.isNotEmpty || event.password.isNotEmpty) {
          // Connexion réussie
          emit(AuthAuthenticated(username: event.username));
        } else {
          // Connexion échouée
          emit(AuthFailure(message: "Nom d'utilisateur ou mot de passe incorrect"));
        }
      } catch (e) {
        // En cas d'erreur
        emit(AuthFailure(message: "Une erreur est survenue"));
      }
    });
  }
}
