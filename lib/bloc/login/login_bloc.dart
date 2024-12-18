import 'package:bloc/bloc.dart';
import 'package:ecovegetables_app/bloc/apiConfig/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    print("LoginBloc: Received event - LoginButtonPressed");
    print("LoginBloc: Email = ${event.email}, Password = ${event.password}");

    emit(LoginLoading());
    print("LoginBloc: State changed to LoginLoading");

    try {
      final response = await _login(event.email, event.password);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("LoginBloc: Server response = ${response.body}");
        emit(LoginSuccess(token: data['token']));
        print(
            "LoginBloc: State changed to LoginSuccess with token = ${data['token']}");
      } else {
        print(
            "LoginBloc: Login failed with status code = ${response.statusCode}");
        emit(LoginFailure(error: 'Invalid credentials'));
      }
    } catch (e) {
      print("LoginBloc: Exception occurred - $e");
      emit(LoginFailure(error: 'An error occurred'));
    }
  }

  Future<http.Response> _login(String email, String password) {
    print("LoginBloc: Sending request to server with email: $email");
    return http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginEndpoint}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
  }
}
