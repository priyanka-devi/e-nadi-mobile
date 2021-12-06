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
        items: ["https://coolwallpapers.me/picsup/3053079-ball_basketball_beach_buildings_city_dark-clouds_daylight_game_holiday_hotel_landscape_leisure_outdoors_palm-trees_people_person_playing_recreation_relaxation_sport_street_summer_sunset_tourism_t.jpg",
          "https://mocah.org/thumbs/5317447-fruit-food-cherry-red-juicy-healthy-summer-sweet-dark-rich-shiny-closeup-detail-macro-android-wallpaper-desktop-background-wallpapers-hd-foodie-wallpaper-free-stock-photos.jpg",
          "https://www.asiaholidayretreats.com/wp-content/uploads/2018/06/yogain-bali-1000x668.jpg",
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
                      Image.network("$i"),
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