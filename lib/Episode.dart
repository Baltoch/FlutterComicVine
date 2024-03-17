import 'package:flutter/material.dart';
import 'package:fluttercomicvine/main.dart';
import 'appcolors.dart';

class MyEpisode extends StatelessWidget {
  const MyEpisode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  child : Image(
                    image : AssetImage('image.jpeg'),
                    fit: BoxFit.cover,
                    
                  ),))
                
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
                        "Episode #101",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30),
                      ),
                      Text(
                        "Pilot",
                        style: 
                        TextStyle (
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 20),
                        
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
                            "  06 Mars 2024",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                            ),)
                        ],)
                      )
                      
                      ],
                        ),
              ))
            
            ]
    )
    )
    )
    );
  }
}