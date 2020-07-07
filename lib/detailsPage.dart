import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DetailsPage extends StatelessWidget {
  bool fav = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(height: MediaQuery.of(context).size.height,),
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pic2.jpg'), fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/2 - 70,
            child: Container(
              padding: EdgeInsets.only(left:20, right: 20),
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
              ),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SizedBox(height: 20,),
                  Text('Caramel Cream', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Color(0xFFF9B3C2) ),),  
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      cont("15 Min", Icons.alarm, Color(0xFFF9B3C2)),
                      cont("2 Servings", Icons.people, Color(0xff89cff0)),
                      cont("540 Calorie", Icons.fastfood,Color(0xff955a73))
                    ],
                  ) ,
                  SizedBox(height:20),
                  Text("Ingredients", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color:Color(0xff89cff0)),),
                  SizedBox(height:20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        ingredient('Rice', '4 Cups'),
                        mDivider(),
                        ingredient('Tomato Paste', '1 Satchet'),
                        mDivider(),
                        ingredient('Eggs', '10 Pieces'),
                        mDivider(),
                        ingredient('Vegetable Oil', '10 Litres'),
                      ],
                    )
                  ),
                  SizedBox(height:20),
                  Text("Directions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color:Color(0xff955a73)),),
                  SizedBox(height:10),
                  steps(1),
                  steps(2),
                  steps(3),
                  steps(4),
                  steps(5),
                ],
              )
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/2 - 90,
            right: 25,
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
        ],
      ), 
    );
  }

  Widget steps(int number){
    return Container(
      padding: EdgeInsets.all(10),
      child: Text('$number.  D/mali_winsys( 3857): EGLint new window surface (egl_winsys_display *, void *, EGLSurface, EGLConfig, egl winsys surface.'),
    );
  }

  Widget mDivider(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Divider(thickness: 1, color: Colors.grey,),
    );
  }
  Widget ingredient(String name , String quantity){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyle(fontSize: 17),),
        Text(quantity, style: TextStyle(fontSize: 15))
      ],
    );
  }

  Widget cont(String name, IconData icon, Color color){
    return Container(
      margin: EdgeInsets.only(left:10),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30,),
          SizedBox(height: 10,),
          Text(name)
        ],
      ),
    );
  }
}