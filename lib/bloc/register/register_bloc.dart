import 'package:bloc/bloc.dart';
import 'package:ecovegetables_app/bloc/apiConfig/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'register_event.dart';
import 'register_state.dart';

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
      final response = await _register(
          event.fullname, event.email, event.phone, event.password);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("RegisterBloc: Server response = ${response.body}");
        emit(RegisterSuccess());
        print("RegisterBloc: State changed to RegisterSuccess");
      } else {
        // Parse lỗi từ server nếu có
        final errorData = json.decode(response.body);
        final errorMessage =
            errorData['message'] ?? 'Đã xảy ra lỗi trong quá trình đăng ký';
        print("RegisterBloc: Server error response = $errorMessage");

        emit(RegisterFailure(error: errorMessage));
        print("RegisterBloc: State changed to RegisterFailure");
      }
    } catch (e) {
      print("RegisterBloc: Exception occurred - $e");
      emit(RegisterFailure(error: 'Có lỗi xảy ra, vui lòng thử lại sau.'));
    }
  }

  Future<http.Response> _register(
      String fullname, String email, String phone, String password) {
    print("RegisterBloc: Sending request to server with email: $email");
    return http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.registerEndpoint}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'fullname': fullname,
        'email': email,
        'phone': phone,
        'password': password
      }),
    );
  }
}
