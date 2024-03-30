import 'package:flutter/material.dart';
import 'package:fluttercomicvine/main.dart';
import 'appcolors.dart';

class RawInfo extends StatelessWidget {
  const RawInfo ({super.key, required this.edition, required this.date, required this.nbEpisodes, required this.imageURL});

  final String imageURL;
  final String edition;
  final String date;
  final String nbEpisodes;

  @override
  Widget build(BuildContext context) {
    return Center(
        child : Stack (
          children : [Container
        (
          height: 150,
          width: 500,
          decoration: BoxDecoration
          (
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerLeft,
          child:  Row(
            children: [
              Expanded(
                flex: 1,
                
                  child : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child : Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                    
                  ),))
                
                ,
              Expanded (
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
                            edition,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                              
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
                            nbEpisodes,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 17,
                              fontFamily: 'Nunito',

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
                            date,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
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
        
    
    );
  }
}