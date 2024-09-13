import 'package:bus_tracking/admin/screen/Auth/login.dart';
import 'package:bus_tracking/admin/screen/Auth/signup.dart';
import 'package:bus_tracking/admin/screen/Auth/successsignUp.dart';
import 'package:bus_tracking/admin/screen/Auth/verifypassword.dart';
import 'package:bus_tracking/admin/screen/Auth/verifysignupcode.dart';
import 'package:bus_tracking/admin/screen/forgetpass/forgetpassword.dart';
import 'package:bus_tracking/admin/screen/forgetpass/resetpassword.dart';
import 'package:bus_tracking/admin/screen/forgetpass/successresetpass.dart';
import 'package:bus_tracking/admin/screen/home.dart';
import 'package:bus_tracking/admin/screen/trackingadmin.dart';
import 'package:bus_tracking/core/constant/routes.dart';
import 'package:bus_tracking/core/mymiddleware/middleware.dart';
import 'package:bus_tracking/view/screen/Auth/login.dart';
import 'package:bus_tracking/view/screen/Auth/signup.dart';
import 'package:bus_tracking/admin/screen/Auth/successlogin.dart';
import 'package:bus_tracking/view/screen/Auth/successlogin.dart';
import 'package:bus_tracking/view/screen/Auth/successsignUp.dart';
import 'package:bus_tracking/admin/screen/Auth/verifylogin.dart';
import 'package:bus_tracking/view/screen/Auth/verifylogin.dart';
import 'package:bus_tracking/view/screen/Auth/verifypassword.dart';
import 'package:bus_tracking/view/screen/Auth/verifysignupcode.dart';
import 'package:bus_tracking/admin/widget/listridesmorning.dart';
import 'package:bus_tracking/view/screen/forgetpass/forgetpassword.dart';
import 'package:bus_tracking/view/screen/forgetpass/resetpassword.dart';
import 'package:bus_tracking/view/screen/forgetpass/successresetpass.dart';
import 'package:bus_tracking/view/screen/homescreen.dart';
import 'package:bus_tracking/view/screen/language.dart';
import 'package:bus_tracking/admin/widget/listridesevining.dart';
import 'package:bus_tracking/view/screen/listchildoftheride.dart';
import 'package:bus_tracking/view/screen/notification.dart';
import 'package:bus_tracking/view/screen/listdriverrideshome.dart';
import 'package:bus_tracking/view/screen/tracking.dart';
import 'package:bus_tracking/view/splash.dart';
import 'package:bus_tracking/admin/widget/listridesadminhome.dart';
import 'package:bus_tracking/view/widget/listridesevining.dart';
import 'package:bus_tracking/view/widget/listridesmorning.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),

  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.verifylogin, page: () => const VerifyLogin()),

  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPass()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerifySignUp()),

  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),

  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.successlogin, page: () => const SuccessLogin()),

  GetPage(name: AppRoute.notification, page: () => const NotificationView()),
  GetPage(
      name: AppRoute.adminridesmorning, page: () => const ListRidesMorning()),
  GetPage(
      name: AppRoute.adminridesevining, page: () => const ListRidesEvining()),

  GetPage(
      name: AppRoute.driverridesmorning, page: () => ListDriverRidesMorning()),
  GetPage(
      name: AppRoute.driverridesevining, page: () => ListDriverRidesEvening()),

  GetPage(name: AppRoute.ridesdriver, page: () => const ListDriverRidesHome()),
  GetPage(name: AppRoute.ridesadmin, page: () => const ListAdminRidesHome()),
  GetPage(
      name: AppRoute.listchildrenoftheride,
      page: () => const ListChildrenoftheride()),

  //ADMIN
  GetPage(name: AppRoute.adminlogin, page: () => const AdminLogin()),
  GetPage(
      name: AppRoute.adminverfiylogin, page: () => const AdminVerifyLogin()),

  GetPage(name: AppRoute.adminsignup, page: () => const AdminSignUp()),
  GetPage(
      name: AppRoute.adminforgetpass, page: () => const AdminForgetPassword()),
  GetPage(
      name: AppRoute.adminresetPassword,
      page: () => const AdminResetPassword()),
  GetPage(
      name: AppRoute.adminsuccessResetpassword,
      page: () => const AdminSuccessResetPass()),
  GetPage(
      name: AppRoute.adminsuccesslogin, page: () => const AdminSuccessLogin()),
  GetPage(
      name: AppRoute.adminsuccessSignUp,
      page: () => const AdminSuccessSignUp()),
  GetPage(name: AppRoute.adminverfiyCode, page: () => const AdminVerifyCode()),
  GetPage(
      name: AppRoute.adminverfiyCodeSignUp,
      page: () => const AdminVerifySignUp()),
  GetPage(name: AppRoute.adminhomepage, page: () => const AdminHomePage()),
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.tracking, page: () => const Tracking()),
  GetPage(name: AppRoute.trackingdetails, page: () => const AdminTracking()),
];
