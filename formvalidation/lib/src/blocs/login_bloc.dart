import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:formvalidation/src/blocs/validators.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => this._emailController.stream.transform(validatorEmail);
  Stream<String> get passwordStream => this._passwordController.stream.transform(validatorPassword);
  Stream<bool> get formValidStream => CombineLatestStream.combine2(this.emailStream, this.passwordStream, (e, p) => true);

  Function(String) get changeEmail => this._emailController.sink.add;
  Function(String) get changePassword => this._passwordController.sink.add;

  String get email => this._emailController.value;
  String get password => this._passwordController.value;

  dispose() {
    this._emailController?.close();
    this._passwordController?.close();
  }
}
