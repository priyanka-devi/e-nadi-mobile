import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselHealthyAdv extends StatefulWidget {
  const CarouselHealthyAdv({Key? key}) : super(key: key);

  @override
  _CarouselHealthyAdvState createState() =>  _CarouselHealthyAdvState();
}

class _CarouselHealthyAdvState extends State<CarouselHealthyAdv> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(height: 200.0),
        items: ["assets/images/healthy_advice/basket_HA.jpg",
          "assets/images/healthy_advice/ceri_HA.jpg",
          "assets/images/healthy_advice/yoga_HA.jpg",
          ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(

                  ),
                  child: Stack(
                    children: [
                      Image.asset("$i"),
                      Positioned(
                        child: Text("Healthy Advice", style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                        left: 80,
                        top: 80,

                    ),
                    ],
                  )



              );
            },
          );
        }).toList(),
      ),
    );
  }
}