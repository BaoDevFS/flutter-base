import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/cores/ui/toast.dart';
import 'package:flutter_base/injector.dart';
import 'package:flutter_base/theme/ui_color.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  await EasyLocalization.ensureInitialized();
  setupEasyLoading();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('vi')],
      path: 'resources/langs',
      fallbackLocale: const Locale('vi'),
      child: const MyApp(),
    ),
  );
}

void setupEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = UIColor.white
    ..indicatorColor = UIColor.primary
    ..progressColor = UIColor.primary
    ..userInteractions = false
    ..textColor = UIColor.black;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () => GetMaterialApp(
        title: 'REE Food Ordering',
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: REEToast(child: FlutterEasyLoading(child: child)),
          );
        },
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        home: Container(),
        //SplashPage(),
      ),
    );
  }
}
