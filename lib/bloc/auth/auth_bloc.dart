import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      try {
        if (event.email.isEmpty || event.password.isEmpty) {
          // emit(AuthLoading());
          emit(AuthError('Email empty and password empty'));
          // print('error');
        } else {
          try {
            emit(AuthLoading());
            final credential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: event.email, password: event.password);
            
            if (credential.user ==null) {
              print('user does not exist');
            }

            if (!credential.user!.emailVerified) {
              print('not verified');
            }

            if (credential.user != null) {
              print('user exist');
            }
            
            emit(AuthSuccess());
            print('success');
          } on FirebaseAuthException catch (e) {
            // print('$e');
              emit(AuthError('$e'));
            // if (e.code == 'user-not-found') {
            // print('1');
            //   emit(AuthError('No user found for that email.'));
            // } else if (e.code == 'wrong-password') {
            // print('2');
            //   emit(AuthError('Wrong password provided for that user.'));
            // } else if (e.code == 'invalid-email') {
            //   print('3');
            //   emit(AuthError('Your email address is not valid'));
            // }
          } catch (e){
            emit(AuthError('$e'));
          }
        }
      } catch (e) {
        emit(AuthError('$e'));
      }
    });

    on<SignOutEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        await FirebaseAuth.instance.signOut();
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError('$e'));
      }
    });
  }
}
