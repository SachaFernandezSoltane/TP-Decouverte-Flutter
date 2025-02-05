import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';  // Importer les événements
import 'auth_state.dart';  // Importer les états

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading()); 

      try {        
      if (event.username.isNotEmpty || event.password.isNotEmpty) {
          emit(AuthAuthenticated(username: event.username));
        } else {
          emit(AuthFailure(message: "Nom d'utilisateur et/ou mot de passe vides"));
        }
      } catch (e) {
        emit(AuthFailure(message: "Une erreur inattendue est survenue"));
      }
    });
  }
}
