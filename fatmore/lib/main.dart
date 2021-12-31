import 'package:fatmore/Providers/food_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/BreakfastProvider.dart';
import 'Providers/checkoutProvider.dart';
import 'Providers/review_cart_provider.dart';
import 'Providers/userProvider.dart';
import 'Providers/wishListProvider.dart';
import 'Screen/homeScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //////WidgetsFlutterBinding.ensureInitialized();

  //await Firebase.initializeApp(
  //options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FoodProvider>(
          create: (context) => FoodProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: (context) => CheckoutProvider(),
        ),
        ChangeNotifierProvider<BreakfastFoodProvider>(
          create: (context) => BreakfastFoodProvider(),
        ),
      ],
      child: MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false),
    ); // define it once at root level.
  }
}
