import 'package:flutter/material.dart';
import 'package:fluttercomicvine/main.dart';
import 'appcolors.dart';

class MyRawInfo extends StatelessWidget {
  const MyRawInfo ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child : Stack (
          children : [Container
        (
          height: 200,
          width: 500,
          decoration: BoxDecoration
          (
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.centerLeft,
          child:  Row(
            children: [
              Expanded(
                flex: 1,
                
                  child : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child : const Image(
                    image : AssetImage('image.jpeg'),
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                    
                  ),))
                
                ,
              const Expanded (
                flex: 2,
                child : Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children : [
                      
                      
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Row(
                            children: [
                              Icon(
                            Icons.local_movies,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          Text(
                            "  Marvel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              
                            ),)
                            ]
                            ),
                            SizedBox(height: 10),
                            Row (
                              children: [
                                Icon(
                             Icons.tv,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          Text(
                            "  136 épisodes",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 17
                            ),)

                              ],),
                            SizedBox(height: 10),
                              Row (
                              children: [
                                Icon(
                            Icons.calendar_today,
                            color: Color.fromARGB(255, 255, 255, 255),
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
                      
                      
                      ],
                        ),
                )
                
                
                  
              ),
              
            
            ]
    ),
    ),  
        ]
        )
        
    )
    );
  }
}