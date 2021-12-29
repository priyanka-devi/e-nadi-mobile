import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselHealthyAdv extends StatefulWidget {
  const CarouselHealthyAdv({Key? key}) : super(key: key);

  @override
  _CarouselHealthyAdvState createState() => _CarouselHealthyAdvState();
}

class _CarouselHealthyAdvState extends State<CarouselHealthyAdv> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(height: 200.0),
        items: [
          "assets/images/healthy_advice/basket_HA.jpg",
          "assets/images/healthy_advice/ceri_HA.jpg",
          "assets/images/healthy_advice/yoga_HA.jpg",
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      // ignore: unnecessary_string_interpolations
                      Image.asset("$i"),
                      const Positioned(
                        child: Text("Healthy Advice",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        left: 80,
                        top: 80,
                      ),
                    ],
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
