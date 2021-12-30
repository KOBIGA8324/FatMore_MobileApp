import 'package:fatmore/Providers/food_provider.dart';
import 'package:fatmore/Providers/review_cart_provider.dart';
import 'package:fatmore/Screen/details.dart';
import 'package:fatmore/Screen/search.dart';
import 'package:fatmore/Widget/categaryTitle.dart';
import 'package:fatmore/Widget/drawerSide.dart';
import 'package:fatmore/Widget/foodcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FoodProvider foodProvider;
  //late UserProvider userProvider;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget popular(context) {
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
                    "Popular Foods",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins_Bold",
                        fontSize: 15,
                        letterSpacing: 2.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                search: foodProvider.getPopularFoodDataList,
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
            children: foodProvider.getPopularFoodDataList.map(
              (popularFoodData) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: FoodCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            foodName: popularFoodData.foodName,
                            mainIncrediants: popularFoodData.mainIncrediants,
                            foodImage: popularFoodData.foodImage,
                            description: popularFoodData.description,
                            price: popularFoodData.price,
                            foodId: popularFoodData.foodId,
                          ),
                        ),
                      );
                    },
                    foodImage: popularFoodData.foodImage,
                    price: popularFoodData.price,
                    foodName: popularFoodData.foodName,
                    mainIncrediants: popularFoodData.mainIncrediants,
                    description: popularFoodData.description,
                    calories: popularFoodData.calories,
                    foodId: popularFoodData.foodId,
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

  Widget salad(context) {
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
                    "Fresh Salad",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins_Bold",
                        fontSize: 15,
                        letterSpacing: 2.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                search: foodProvider.getSaladFoodDataList,
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
            children: foodProvider.getSaladFoodDataList.map(
              (saladFoodData) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: FoodCard(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              foodImage: saladFoodData.foodImage,
                              foodName: saladFoodData.foodName,
                              mainIncrediants: saladFoodData.mainIncrediants,
                              description: saladFoodData.description,
                              price: saladFoodData.price,
                              foodId: saladFoodData.foodId,
                            ),
                          ),
                        );
                      },
                      foodImage: saladFoodData.foodImage,
                      foodName: saladFoodData.foodName,
                      mainIncrediants: saladFoodData.mainIncrediants,
                      price: saladFoodData.price,
                      description: saladFoodData.description,
                      calories: saladFoodData.calories,
                      foodId: saladFoodData.foodId,
                    ));
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget friedRice(context) {
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
                    "Fried Rice",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins_Bold",
                        fontSize: 15,
                        letterSpacing: 2.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                search: foodProvider.getFriedRiceFoodDataList,
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
            children: foodProvider.getFriedRiceFoodDataList.map(
              (friedRiceFoodData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10.0),
                  child: FoodCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            foodName: friedRiceFoodData.foodName,
                            mainIncrediants: friedRiceFoodData.mainIncrediants,
                            foodImage: friedRiceFoodData.foodImage,
                            description: friedRiceFoodData.description,
                            //   'This is full veg salad bowel,it has some popular veggie toppings include chopped carrots, onions, cucumbers, celery, mushrooms and broccoli.',
                            price: friedRiceFoodData.price,
                            foodId: friedRiceFoodData.foodId,
                          ),
                        ),
                      );
                    },
                    foodImage: friedRiceFoodData.foodImage,
                    price: friedRiceFoodData.price,
                    foodName: friedRiceFoodData.foodName,
                    mainIncrediants: friedRiceFoodData.mainIncrediants,
                    description: friedRiceFoodData.description,
                    calories: friedRiceFoodData.calories,
                    foodId: friedRiceFoodData.foodId,
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

  @override
  void initState() {
    FoodProvider initfoodProvider = Provider.of(context, listen: false);
    initfoodProvider.fetchSaladFoodData();
    initfoodProvider.fetchPopularFoodData();
    initfoodProvider.fetchFriedRiceFoodData();
    ReviewCartProvider initReviewProvider = Provider.of(context, listen: false);
    initReviewProvider.getReviewCartData();
    // UserProvider inituserProvider = Provider.of(context, listen: false);
    // inituserProvider.getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    foodProvider = Provider.of(
      context,
    );
    // userProvider = Provider.of(context);
    // userProvider.getUserData();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: DrawerSide(),
      floatingActionButton: Container(
          padding: EdgeInsets.all(6.0),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepOrangeAccent.withOpacity(0.26)),
          child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepOrangeAccent),
              child: Image.asset(
                "asset/images/plus.png",
                color: Colors.black,
              ))),
      body: Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 20),
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
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
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                "Simple way to find\nTasty food",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins_Bold",
                    fontSize: 18,
                    letterSpacing: 2.0),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  CategoryTitle(
                    title: "All",
                    actrive: true,
                  ),
                  CategoryTitle(
                    title: "Breakfast",
                  ),
                  CategoryTitle(
                    title: "Lunch",
                  ),
                  CategoryTitle(
                    title: "Dinner",
                  ),
                  CategoryTitle(
                    title: "Snacks",
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.deepOrangeAccent,
                  //size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Search(search: foodProvider.gerAllfoodSearch)));
                },
              ),
            ),
            popular(context),
            SizedBox(
              height: 5,
            ),
            salad(context),
            SizedBox(
              height: 5,
            ),
            friedRice(context),
          ],
        ),
      ),
    );
  }
}
