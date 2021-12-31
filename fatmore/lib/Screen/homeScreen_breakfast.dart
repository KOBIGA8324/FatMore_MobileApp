import 'package:fatmore/Providers/BreakfastProvider.dart';
import 'package:fatmore/Providers/review_cart_provider.dart';
import 'package:fatmore/Screen/details.dart';
import 'package:fatmore/Screen/search.dart';
import 'package:fatmore/Widget/drawerSide.dart';
import 'package:fatmore/Widget/foodcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'details.dart';
import 'homeScreen.dart';

class Breakfast extends StatefulWidget {
  const Breakfast({Key? key}) : super(key: key);

  @override
  _BreakfastState createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  late BreakfastFoodProvider breakfastFoodProvider;
  //late UserProvider userProvider;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget traditional(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Traditional Breakfast",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins_Bold",
                        fontSize: 13,
                        letterSpacing: 1.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                search: breakfastFoodProvider
                                    .getTraditionalFoodList,
                              )));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins_Bold",
                          fontSize: 10,
                          letterSpacing: 2.0,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: breakfastFoodProvider.getTraditionalFoodList.map(
              (traditional) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: FoodCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            foodName: traditional.foodName,
                            mainIncrediants: traditional.mainIncrediants,
                            foodImage: traditional.foodImage,
                            description: traditional.description,
                            price: traditional.price,
                            foodId: traditional.foodId,
                          ),
                        ),
                      );
                    },
                    foodImage: traditional.foodImage,
                    price: traditional.price,
                    foodName: traditional.foodName,
                    mainIncrediants: traditional.mainIncrediants,
                    description: traditional.description,
                    calories: traditional.calories,
                    foodId: traditional.foodId,
                    //calories: '42Kcal',
                    ////description:
                    // 'This is full veg salad bowel,it has some popular veggie toppings include chopped carrots, onions, cucumbers, celery, mushrooms and broccoli.',
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget healthy(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Healthy Breakfast",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins_Bold",
                        fontSize: 13,
                        letterSpacing: 1.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                search: breakfastFoodProvider
                                    .getTraditionalFoodList,
                              )));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins_Bold",
                          fontSize: 10,
                          letterSpacing: 2.0,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: breakfastFoodProvider.getHealthyFoodDataList.map(
              (healthy) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: FoodCard(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              foodImage: healthy.foodImage,
                              foodName: healthy.foodName,
                              mainIncrediants: healthy.mainIncrediants,
                              description: healthy.description,
                              price: healthy.price,
                              foodId: healthy.foodId,
                            ),
                          ),
                        );
                      },
                      foodImage: healthy.foodImage,
                      foodName: healthy.foodName,
                      mainIncrediants: healthy.mainIncrediants,
                      price: healthy.price,
                      description: healthy.description,
                      calories: healthy.calories,
                      foodId: healthy.foodId,
                    ));
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  // Widget friedRice(context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(left: 25.0),
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Container(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   "Fried Rice",
  //                   style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontFamily: "Poppins_Bold",
  //                       fontSize: 15,
  //                       letterSpacing: 2.0),
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     Navigator.of(context).push(MaterialPageRoute(
  //                         builder: (context) => Search(
  //                               search: foodProvider.getFriedRiceFoodDataList,
  //                             )));
  //                   },
  //                   child: Text(
  //                     "View All",
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontFamily: "Poppins_Bold",
  //                         fontSize: 10,
  //                         letterSpacing: 2.0,
  //                         color: Colors.grey),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //       SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //           children: foodProvider.getFriedRiceFoodDataList.map(
  //             (friedRiceFoodData) {
  //               return Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                     vertical: 10, horizontal: 10.0),
  //                 child: FoodCard(
  //                   onTap: () {
  //                     Navigator.of(context).push(
  //                       MaterialPageRoute(
  //                         builder: (context) => DetailsScreen(
  //                           foodName: friedRiceFoodData.foodName,
  //                           mainIncrediants: friedRiceFoodData.mainIncrediants,
  //                           foodImage: friedRiceFoodData.foodImage,
  //                           description: friedRiceFoodData.description,
  //                           //   'This is full veg salad bowel,it has some popular veggie toppings include chopped carrots, onions, cucumbers, celery, mushrooms and broccoli.',
  //                           price: friedRiceFoodData.price,
  //                           foodId: friedRiceFoodData.foodId,
  //                         ),
  //                       ),
  //                     );
  //                   },
  //                   foodImage: friedRiceFoodData.foodImage,
  //                   price: friedRiceFoodData.price,
  //                   foodName: friedRiceFoodData.foodName,
  //                   mainIncrediants: friedRiceFoodData.mainIncrediants,
  //                   description: friedRiceFoodData.description,
  //                   calories: friedRiceFoodData.calories,
  //                   foodId: friedRiceFoodData.foodId,
  //                   //calories: '42Kcal',
  //                   ////description:
  //                   // 'This is full veg salad bowel,it has some popular veggie toppings include chopped carrots, onions, cucumbers, celery, mushrooms and broccoli.',
  //                 ),
  //               );
  //             },
  //           ).toList(),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  void initState() {
    BreakfastFoodProvider initBreakfastFoodProvider =
        Provider.of(context, listen: false);
    initBreakfastFoodProvider.fetchTraditionalFoodData();
    initBreakfastFoodProvider.fetchHealthyFoodData();
    // initfoodProvider.fetchFriedRiceFoodData();
    ReviewCartProvider initReviewProvider = Provider.of(context, listen: false);
    initReviewProvider.getReviewCartData();
    // UserProvider inituserProvider = Provider.of(context, listen: false);
    // inituserProvider.getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    breakfastFoodProvider = Provider.of(
      context,
    );
    // userProvider = Provider.of(context);
    // userProvider.getUserData();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: DrawerSide(),
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (_) => HomeScreen()));
      //     },
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                IconButton(
                    color: Colors.black,
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.menu,
                        size: 20,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29.0),
              child: Text(
                "Teasty Breakfast",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins_Bold",
                    fontSize: 20,
                    letterSpacing: 2.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            traditional(context),
            SizedBox(
              height: 10,
            ),
            healthy(context),
            SizedBox(
              height: 5,
            ),
            // friedRice(context),
          ],
        ),
      ),
    );
  }
}
