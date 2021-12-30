import 'package:fatmore/Model/foodModel.dart';
import 'package:fatmore/Widget/singleItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text("Search"),
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
            title: Text("Items"),
          ),
          Container(
            height: 52,
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
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
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
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
