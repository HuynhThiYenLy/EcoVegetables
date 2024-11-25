import 'package:bloc/bloc.dart';
import 'package:ecovegetables_app/bloc/register/register_event.dart';
import 'package:ecovegetables_app/bloc/register/register_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  Future<void> _onRegisterButtonPressed(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    print("RegisterBloc: Received event - RegisterButtonPressed");
    print(
        "RegisterBloc: Fullname = ${event.fullname}, Email = ${event.email}, Phone = ${event.phone}, Password = ${event.password}");

    emit(RegisterLoading());
    print("RegisterBloc: State changed to RegisterLoading");

    try {
      final response = await _Register(event.email, event.password);

      if (response.statusCode == 200) {
        print("RegisterBloc: Server response = ${response.body}");
        emit(RegisterSuccess());
        print("RegisterBloc: State changed to RegisterSuccess");
      } else {
        print(
            "RegisterBloc: Register failed with status code = ${response.statusCode}");
        emit(RegisterFailure(error: 'Invalid credentials'));
      }
    } catch (e) {
      print("RegisterBloc: Exception occurred - $e");
      emit(RegisterFailure(error: 'An error occurred'));
    }
  }

  Future<http.Response> _Register(String email, String password) {
    print("RegisterBloc: Sending request to server with email: $email");
    return http.post(
      Uri.parse('http://192.168.215.1:5217/user/Register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
  }
}
