import 'package:bloc/bloc.dart';
import 'package:ecovegetables_app/bloc/apiConfig/api_constants.dart';
import 'package:ecovegetables_app/bloc/verifyOTP/verifyOTP_event.dart';
import 'package:ecovegetables_app/bloc/verifyOTP/verifyOTP_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, VerifyOTPState> {
  VerifyOTPBloc() : super(VerifyOTPInitial()) {
    on<VerifyOTPButtonPressed>(_onVerifyOTPButtonPressed);
  }

  Future<void> _onVerifyOTPButtonPressed(
      VerifyOTPButtonPressed event, Emitter<VerifyOTPState> emit) async {
    print("VerifyOTPBloc: Received event - VerifyOTPButtonPressed");
    print("VerifyOTPBloc: email = ${event.email}, otp = ${event.otp}");

    emit(VerifyOTPLoading());
    print("VerifyOTPBloc: State changed to VerifyOTPLoading");

    try {
      final response = await _verifyOTP(event.email, event.otp);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("VerifyOTPBloc: Server response = ${response.body}");
        emit(VerifyOTPSuccess());
        print("VerifyOTPBloc: State changed to VerifyOTPSuccess");
      } else {
        final errorData = json.decode(response.body);
        final errorMessage =
            errorData['message'] ?? 'Đã xảy ra lỗi trong quá trình đăng ký';
        print("VerifyOTPBloc: Server error response = $errorMessage");

        emit(VerifyOTPFailure(error: errorMessage));
        print("VerifyOTPBloc: State changed to VerifyOTPFailure");
      }
    } catch (e) {
      print("VerifyOTPBloc: Exception occurred - $e");
      emit(VerifyOTPFailure(error: 'Có lỗi xảy ra, vui lòng thử lại sau.'));
    }
  }

  Future<http.Response> _verifyOTP(String email, String otp) {
    return http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.verifyOTPEndpoint}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'otp': otp
      }),
    );
  }
}
