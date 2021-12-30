import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Model/foodModel.dart';
import 'package:flutter/cupertino.dart';

class FoodProvider with ChangeNotifier {
  late FoodModel foodModel;
  List<FoodModel> search = [];

  foodModels(QueryDocumentSnapshot element) {
    foodModel = FoodModel(
        foodImage: element.get("foodImage"),
        foodName: element.get("foodName"),
        mainIncrediants: element.get("mainIncrediants"),
        price: element.get("price"),
        description: element.get("description"),
        calories: element.get("calories"),
        foodId: element.get("foodId"));
    search.add(foodModel);
  }

//salad food list
  List<FoodModel> saladFoodList = [];

  fetchSaladFoodData() async {
    List<FoodModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Food_Salad").get();
    value.docs.forEach(
      (element) {
        foodModels(element);
        newList.add(foodModel);
      },
    );
    saladFoodList = newList;
    notifyListeners();
  }

  List<FoodModel> get getSaladFoodDataList {
    return saladFoodList;
  }

  /// popluar food list

  List<FoodModel> popularFoodList = [];

  fetchPopularFoodData() async {
    List<FoodModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Food_Popular").get();
    value.docs.forEach(
      (element) {
        foodModels(element);
        newList.add(foodModel);
      },
    );
    popularFoodList = newList;
    notifyListeners();
  }

  List<FoodModel> get getPopularFoodDataList {
    return popularFoodList;
  }

  ///fried rice
  List<FoodModel> friedRiceFoodList = [];

  fetchFriedRiceFoodData() async {
    List<FoodModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Food_Fried Rice").get();
    value.docs.forEach(
      (element) {
        foodModels(element);

        newList.add(foodModel);
      },
    );
    friedRiceFoodList = newList;
    notifyListeners();
  }

  List<FoodModel> get getFriedRiceFoodDataList {
    return friedRiceFoodList;
  }

  /////////////////// Search Return ////////////
  List<FoodModel> get gerAllfoodSearch {
    return search;
  }
}
