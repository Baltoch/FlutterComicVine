import 'package:flutter/material.dart';
import 'package:fluttercomicvine/main.dart';
import 'appcolors.dart';

class Episode extends StatelessWidget {
  const Episode({super.key, required this.content, required this.title, required this.date, required this.imageURL});

  final String content;
  final String title;
  final String date;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container
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
                flex: 1,
                child : Padding (
                  padding: EdgeInsets.all(20), 
                  child : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
      ),
                  /*
                  child : Image(
                    image : AssetImage('image.jpeg'),
                    fit: BoxFit.cover,
                    
                  ),*/
                  ))
                
                ),
              Expanded(
                flex: 1,
                child : Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children : [
                      Text(
                        content,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Nunito'),
                          
                      ),
                      Text(
                        title,
                        style: 
                        TextStyle (
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Nunito'),
                        
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35),
                        child : Row(
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
                      )
                      
                      ],
                        ),
              ))
            
            ]
    )
    )
    
    );
  }
}