// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, dead_code, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:recipe/RecipeDetail.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselRecipe extends StatefulWidget {
  @override
  _CarouselRecipeState createState() => _CarouselRecipeState();
}

class _CarouselRecipeState extends State<CarouselRecipe> {
  int recipeIndex = 0;

  final List<Widget> myData = [
    Stack(
      children: [
        Positioned(
          bottom: 16,
          right: 16,
          left: 16,
          child: Text(
            'BRUSCHETTA GRILLED CHICKEN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Positioned(
          bottom: 16,
          right: 16,
          left: 16,
          child: Text(
            'HONEY WALNUT SHRIMP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Positioned(
          bottom: 16,
          right: 16,
          left: 16,
          child: Text(
            'CHICKEN SOUP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  ];
  final controller = CarouselController();
  final urlImages = [
    'https://hips.hearstapps.com/del.h-cdn.co/assets/17/23/1496939954-bruschetta-chicken-1sm.jpg?crop=1.0xw:1xh;center,top&resize=768:*',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/honey-walnut-shrimp-horizontal-1548093880.png',
    'https://hips.hearstapps.com/del.h-cdn.co/assets/17/25/1498147867-delish-easy-crockpot-chicken-and-dumplings-horizontal-1024.jpg?crop=1xw:1xh;center,top&resize=480:*',
  ];
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            initialPage: 0,
            height: 200.0,
            autoPlay: true,
            onPageChanged: (index, reason) =>
                setState(() => recipeIndex = index),
          ),
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return Stack(
              children: [
                buildImage(urlImage, index),
                myData[index],
              ],
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        buildIndicator(),
        const SizedBox(
          height: 20,
        ),
        buildButtons(),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: recipeIndex,
      count: urlImages.length,
      onDotClicked: animateToSlide,
      effect: SlideEffect(
        spacing: 8.0,
        radius: 4.0,
        dotWidth: 50,
        dotHeight: 5,
        strokeWidth: 1.5,
        activeDotColor: Colors.red,
        dotColor: Colors.black12,
      ));
  Widget buildButtons({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10.0)),
            child: Icon(Icons.arrow_back, size: 20),
            onPressed: previous,
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            )),
            child: Icon(Icons.arrow_forward, size: 20),
            onPressed: next,
          ),
        ],
      );
  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: Stack(
          children: [
            Ink.image(
              image: NetworkImage(urlImage),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
              height: 240,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
  void animateToSlide(int index) => controller.animateToPage(index);
  void previous() => controller.previousPage();

  void next() => controller.nextPage();
  // Widget buildButtonDetail1() => Container(
  //       child: Positioned(
  //           child: ButtonBar(
  //         alignment: MainAxisAlignment.start,
  //         children: [
  //           ElevatedButton(
  //             style: ButtonStyle(
  //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                     RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(18.0),
  //                         side: BorderSide(
  //                           color: Colors.orange,
  //                         )))),
  //             child: Text('View Detail'),
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => const RecipeDetail()),
  //               );
  //             },
  //           ),
  //         ],
  //       )),
  //     );
}
