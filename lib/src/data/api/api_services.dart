import 'dart:io';

import 'package:dio/dio.dart' hide DioMediaType;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';

import 'package:dio/dio.dart' hide DioMediaType;
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/apply/apply_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/confirm_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/get_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/reset_password_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/login_request/login_request.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/apply/apply_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/confirm_otp_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/get_otp_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/reset_password_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/logout_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/app_user_response/app_user_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/change_password/change_password_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/edite_my_info/updated_user_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/login_response_model/login_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/upload_photo_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/vehicles/vehicles_response_model.dart';
import 'package:tracking_app/src/data/api/core/constants/api_end_points.dart';
import 'package:tracking_app/src/data/api/core/constants/api_keys.dart';

import 'core/api_request_models/change_password/change_password_request_model.dart';
import 'core/api_request_models/edite_my_info/updated_user_request_model.dart';
import 'core/api_response_models/order/pending_orders_response_model.dart';
import 'core/api_response_models/order/start_order_response_model/start_order_response_model.dart';
import 'core/constants/api_base_url.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract interface class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApiEndPoints.forgetPassword)
  Future<GetOtpResponseModel> getOtp(
      @Body() GetOtpRequestModel getOtpRequestModel);

  @POST(ApiEndPoints.verifyResetCode)
  Future<ConfirmOtpResponseModel> confirmOtp(
      @Body() ConfirmOtpRequestModel confirmOtpRequestModel);

  @PUT(ApiEndPoints.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(
      @Body() ResetPasswordRequestModel resetPasswordRequestModel);

  @POST(ApiEndPoints.login)
  Future<LoginResponseModel> login(@Body() LoginRequest loginRequestModel);

  @GET(ApiEndPoints.profileData)
  Future<AppUserResponseModel> profileData({
    @Header(ApiKey.authorization) required String token,
  });

  @POST(ApiEndPoints.apply)
  @MultiPart()
  Future<ApplyResponseModel> apply(
      @Part(name: "country") String country,
      @Part(name: "firstName") String firstName,
      @Part(name: "lastName") String lastName,
      @Part(name: "vehicleType") String vehicleType,
      @Part(name: "vehicleNumber") String vehicleNumber,
      @Part(name: "vehicleLicense", contentType: "image/jpg")
      File vehicleLicense,
      @Part(name: "NID") String NID,
      @Part(name: "NIDImg", contentType: "image/jpg") File NIDImg,
      @Part(name: "email") String email,
      @Part(name: "password") String password,
      @Part(name: "rePassword") String rePassword,
      @Part(name: "gender") String gender,
      @Part(name: "phone") String phone);

  @GET(ApiEndPoints.vehicles)
  Future<VehiclesResponseModel> getAllVehicles();

  @GET(ApiEndPoints.logout)
  Future<LogOutResponseModel> logout(
      @Header(ApiKey.authorization) String token);

  @PATCH(ApiEndPoints.changePassword)
  Future<ChangePasswordResponesModel> changePassword(
      @Header(ApiKey.authorization) String token,
      @Body() ChangePasswordRequestModel changePasswordRequestModel);

  @GET(ApiEndPoints.pendingOrder)
  Future<PendingOrdersResponseModel> getAllPendingOrders();
  Future<PendingOrdersResponseModel>getAllPendingOrders();


  @PUT("${ApiEndPoints.startOrder}/{orderId}")
  Future<StartOrderResponseModel>startOrder({@Path()  required String orderId});


  @PUT(ApiEndPoints.uploadPhoto)
  @MultiPart()
  Future<UploadPhotoResponseModel> uploadPhoto(
      @Header(ApiKey.authorization) String token,
      @Part(name: "photo",contentType: "image/jpg") File photo);


  @PUT(ApiEndPoints.editeProfile)
  Future<UpdatedUserResponseModel> updateUserInfo(@Header(ApiKey.authorization) String token, @Body() UpdatedUserRequestModel updatedUserRequestModel);
}
