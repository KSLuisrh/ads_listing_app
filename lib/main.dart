import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

 
void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
        ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
      ],
      child: MyApp(),
    );
  }
}



 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ads App',
      initialRoute: 'checking',
      routes: {
        
        'checking': ( _ ) => CheckAuthScreen(),

        'home'    : ( _ ) => HomeScreen(),
        'product' : ( _ ) => ProductScreen(),

        'login'   : ( _ ) => LoginScreen(),
        'register': ( _ ) => RegisterScreen(),
        'settings': ( _ ) => SettingsScreen(),
        'profile' : ( _ ) => ProfileScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.black
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
          elevation: 0
        )
      ),
    );
  }
}