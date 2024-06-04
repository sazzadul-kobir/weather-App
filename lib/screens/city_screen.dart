import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CityScreen extends StatelessWidget {
  final Function cityWeatherFunction;

  CityScreen({required this.cityWeatherFunction});

  final TextEditingController textEditingController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText:"Enter any city name",
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          cityWeatherFunction(textEditingController.text,context);

                        },
                        child: Text("get city weather",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff94e0ab),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                        ),
                      ),
                    ),

                    SvgPicture.asset('assets/svg/city.svg')
                  ],
                ),
              ),


          ),
        ),
    );
  }
}
