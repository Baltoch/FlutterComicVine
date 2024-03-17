import 'package:flutter/material.dart';
import 'package:fluttercomicvine/main.dart';
import 'appcolors.dart';

class Popular extends StatelessWidget {
  const Popular ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child : Stack (
          children :  [Container
        (
          height: 200,
          width: 500,
          decoration: BoxDecoration
          (
                color: AppColors.cardElementBackgroundColor,
                borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.centerLeft,
          child:  Row(
            children: [
              Expanded(
                flex: 2,
                child : Padding (
                  padding: EdgeInsets.all(20), 
                  child : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child : Image(
                    image : AssetImage('image.jpeg'),
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                    
                  ),))
                
                ),
              Expanded(
                flex: 3,
                child : Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children : [
                      Text(
                        "Agents of shield",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Icon(
                            Icons.local_movies,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text(
                            "  Marvel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                            ),)
                            ]
                            ),
                            Row (
                              children: [
                                Icon(
                             Icons.tv,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text(
                            "  136 épisodes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                            ),)

                              ],),

                              Row (
                              children: [
                                Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text(
                            "  2013",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                            ),)

                              ],)
                          
                        ],
                        ),
                      )
                      
                      ],
                        ),
              ),
              )
            
            ]
    ),
    ),
    /*Positioned(
      top: 10,
      left: 10,
      Container (alignment: 
      width: 50,
      height: 50,
      color: Colors.red,)

    )*/
          ]
        )
        
    )
    );
  }
}