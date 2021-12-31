import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Model/foodModel.dart';
import 'package:flutter/cupertino.dart';

class BreakfastFoodProvider with ChangeNotifier {
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
  List<FoodModel> traditionalFoodList = [];

  fetchTraditionalFoodData() async {
    List<FoodModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("TraditionalFood").get();
    value.docs.forEach(
      (element) {
        foodModels(element);
        newList.add(foodModel);
      },
    );
    traditionalFoodList = newList;
    notifyListeners();
  }

  List<FoodModel> get getTraditionalFoodList {
    return traditionalFoodList;
  }

  List<FoodModel> get gerAllfoodSearch {
    return search;
  }

  /// popluar food list

  List<FoodModel> healthyFoodList = [];

  fetchHealthyFoodData() async {
    List<FoodModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Healthy").get();
    value.docs.forEach(
      (element) {
        foodModels(element);
        newList.add(foodModel);
      },
    );
    healthyFoodList = newList;
    notifyListeners();
  }

  List<FoodModel> get getHealthyFoodDataList {
    return healthyFoodList;
  }
}

// ///fried rice
// List<FoodModel> friedRiceFoodList = [];
//
// fetchFriedRiceFoodData() async {
//   List<FoodModel> newList = [];
//   QuerySnapshot value =
//   await FirebaseFirestore.instance.collection("Food_Fried Rice").get();
//   value.docs.forEach(
//         (element) {
//       foodModels(element);
//
//       newList.add(foodModel);
//     },
//   );
//   friedRiceFoodList = newList;
//   notifyListeners();
// }

// List<FoodModel> get getFriedRiceFoodDataList {
//   return friedRiceFoodList;
// }
