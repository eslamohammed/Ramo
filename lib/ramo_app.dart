import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramo/ramo/ui.dart';
// import 'package:ramo/app_router.dart';

class RamoApp extends StatelessWidget {
  // final AppRouter appRouter;
  // const RamoApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 3264),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ramo",
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Color.fromARGB(255, 20, 115, 128), // Example color
          scaffoldBackgroundColor: Color(
            0xFFF5F5F5,
          ), // Example background color
        ),
        home: Screen(),
        // onGenerateRoute: AppRouter.generateRoute,
        // initialRoute: Routes.splashRoute,
      ),
    );
  }
}
