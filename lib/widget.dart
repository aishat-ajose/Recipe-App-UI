import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipe/detailsPage.dart';

Widget recipes(List<String> options, _currentIndex, context, bool fav){
  return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage()));
      },
      child: Container(
      padding: EdgeInsets.symmetric(horizontal:40),
      height: MediaQuery.of(context).size.height/2,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/3,
            margin: EdgeInsets.only(top:20),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(fav ?'assets/pic6.jpg': "assets/pic4.jpg"), fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15)
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              elevation: 10,
              child: Container(
                height: 120,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("PUMPKIN SOUP", style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height:10),
                    review(),
                    SizedBox(height:5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.alarm, size: 20,),
                            SizedBox(height:5),
                            Text('5 Min')
                          ],
                        ),
                        VerticalDivider(color:Colors.black, thickness: 2.0,),
                        Column(
                          children: [
                            Icon(Icons.signal_wifi_4_bar, size:20),
                            SizedBox(height:5),
                            Text('Easy')
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            right: 15,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: fav ? Icon(Icons.favorite, color: Colors.red,) : Icon(MaterialIcons.favorite_border),
              ),
            )
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: progress(options,_currentIndex)
        )
        ],
      ),
    ),
  );
  }

Widget progress(List<String> options, int currentIndex){
  return Container(
    height: 10, 
    child: Center(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, index){
          return  Container(
            margin: EdgeInsets.only(right:3),
            height: 7,
            width: 7,
            decoration: BoxDecoration(shape: BoxShape.circle,
            color: currentIndex == index ? Colors.black: Colors.grey[400]),
          );
        },
      ),
    ),
  );
}

Widget recipeoftheday(){
  return Container(
    padding: EdgeInsets.only(left:20,right: 20, bottom:30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recipe of the Day", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),),
        Container(
          height: 300,
          margin: EdgeInsets.only(top:20, bottom: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/pic2.jpg'), fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30)
          ),
        ),
        review(alignment:'start'), 
        SizedBox(height: 5,),
        Text("Shrimp Pasta", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),)
      ],
    ),
  );
}

Widget review({String alignment}){
  return Row(
    mainAxisAlignment: alignment == 'start' ? MainAxisAlignment.start : MainAxisAlignment.center,
    children: [
      Icon(Icons.star, color: Colors.yellow,), SizedBox(width: 10,),
      Text("4.8 |  345 Reviews", style: TextStyle(color: Colors.grey),)
    ],
  );
}


Widget buildTab(Icon icon, String name, bool selected){
  return Container(
    padding: EdgeInsets.only(left:40, top:10),
    child: Column(children: [
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ?  Colors.white: Colors.white.withOpacity(0.3)
        ),
        child: icon
      ),
      Spacer(),
      Text(name, style: TextStyle(fontWeight: selected ? FontWeight.bold: FontWeight.normal),),
      SizedBox(height: 10,)
    ],),
  );
}