import 'package:fatmore/Model/foodModel.dart';
import 'package:fatmore/Widget/singleItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';

class Search extends StatefulWidget {
  final List<FoodModel> search;
  Search({required this.search});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  searchItem(String query) {
    List<FoodModel> searchFood = widget.search.where((element) {
      return element.foodName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<FoodModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Search",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins-Bold",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Get Your Food Wright Here",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins-Bold",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
          ),
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey.shade300,
                filled: true,
                hintText: "  Search for the food",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItems(
                isBool: false,
                foodImage: data.foodImage,
                foodName: data.foodName,
                price: data.price,
                foodId: data.foodId,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
