import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: event.email, password: event.password);
        if (credential.user == null) {
          //
        }

        if (!credential.user!.emailVerified) {
          //
        }
      } catch (e) {
        emit(AuthError('$e'));
      }
    });
  }
}
