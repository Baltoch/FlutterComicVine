import 'package:flutter/material.dart';
import 'appcolors.dart';

class Popular extends StatelessWidget {
  const Popular ({super.key, required this.title, required this.edition, required this.nbEpisodes, required this.date, required this.rank, required this.imageURL});

  final String title;
  final String edition;
  final String nbEpisodes;
  final String date;
  final String rank;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Center(
        child : Stack (
          children :  [
            Container(
              height: 200,
              width: 500,
              decoration: BoxDecoration
          (
                color: AppColors.section,
                borderRadius: BorderRadius.circular(30),
          ),
          
         
          alignment: Alignment.centerLeft,
          child:  Stack(
            children : [
              Row(
                children: [
              
              Expanded(
                flex: 2,
                child : Padding (
                  padding: EdgeInsets.all(20), 
                  child : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child : Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                    
                  )
                  ))
                
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
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
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
                            edition,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito'
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
                            nbEpisodes,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito'
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
                            date,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito'
                            ),)

                              ],)
                          
                        ],
                        ),
                      )
                      
                      ],
                        ),
              ),
              )
            
            ]),


            Positioned(
                    top: 10, 
                    left: 10, 
                    child : Stack(
                      children : [
                        Container(
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration
                          (
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          
                          child: Text(
                            rank,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center
                            ),

                        ),
                        
                        
                            
                      ],
                    
                    
                  ),
            )
    
            ],
    ),
    
            )
      
          ]
        
    )
    ,);
  }
}