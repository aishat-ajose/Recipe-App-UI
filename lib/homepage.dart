import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe/widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Icon> tabs = {
    'All': Icon(MaterialIcons.room_service),
    'Main': Icon(MaterialIcons.local_pizza),
    'Desserts':Icon(MaterialIcons.cake),
    'Drinks': Icon(MaterialIcons.local_bar)
  };
  List<String> options = ['df', 'ty', 'rt', 'tu','dk', 'py', 'lt', 'mu'];
  List<String> images = ['assets/pic3.jpg','assets/pic4.jpg','assets/pic5.jpg','assets/pic6.jpg','assets/pic7.jpg','assets/pic8.jpg'];
  List<int> fav = [1,5,7,9];
  int _currentIndex = 0;
  String selected = 'Main';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(MaterialIcons.account_circle, size: 40, color: Color(0xffFFE4D1)),
        actions: [
          Icon(Icons.search), SizedBox(width: 10),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            recipeoftheday(),
            Container(
              height: 80,
              color: Color(0xffFFE4D1),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: tabs.entries.map((e){
                  return InkWell(
                    onTap: (){
                      setState(() {
                        selected = e.key;
                      });
                    },
                    child: buildTab(e.value, e.key, selected == e.key)
                  );
                }).toList()
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/2 + 20,
              child: Swiper(
              scrollDirection: Axis.horizontal,
              itemCount: options.length,
              onIndexChanged: (val){
                setState(() {
                  _currentIndex = val;
                });
              },
              itemBuilder: (BuildContext context,int index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    recipes(options, _currentIndex, context, fav.contains(_currentIndex)),  
                  ],
                );
              },
              ),
            ),
            category("Popular Recipe"),
            category("Vegan"),
            category("Health"),
          ],
        ),
      ),
    );
  }
   
  Widget category(String name){
    return Container(
      height: 220,
      margin: EdgeInsets.only(top:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          Spacer(),
          Container(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index){
                int num = Random().nextInt(6);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left:15),
                      height: 150,
                      width: MediaQuery.of(context).size.width/3 + 15 ,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[num]), fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Yummy Food", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
                    
                  ],
                );
              }
            ),
          )
        ],
      ),
    );
  }
}