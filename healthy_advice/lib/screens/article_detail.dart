import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ArticleDetail extends StatefulWidget {
  const ArticleDetail({Key? key}) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Healthy Advice Article"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Image.network("https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/10/25025409/manfaat-istirahat-yang-cukup-dan-cara-memperolehnya-halodoc.jpg.webp"),
              SizedBox(height: 20,),
              Text("Manfaat Istirahat yang Cukup dan Cara Memperolehnya", style: TextStyle (
                fontSize: 24, fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
              SizedBox(height: 20,),
              Text("Oct. 28, 2021", style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20
              ),
                textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("Halodoc, Jakarta - Di zaman modern yang semakin sibuk ini, istirahat yang cukup menjadi hal yang sudah tidak lagi diprioritaskan. Padahal istirahat yang cukup sangat penting untuk membantu menjaga kesehatan dan kesejahteraan kamu secara optimal. Manfaat Istirahat yang Cukup dan Cara Memperolehnya Halodoc, Jakarta - Di zaman modern yang semakin sibuk ini, istirahat yang cukup menjadi hal yang sudah tidak lagi diprioritaskan. Padahal istirahat yang cukup sangat penting untuk membantu menjaga kesehatan dan kesejahteraan kamu secara optimal. Faktanya, tidur sama pentingnya dengan olahraga teratur dan makan makanan yang seimbang. Tidak hanya bisa membuat kamu merasa lebih segar, istirahat yang cukup juga bisa memberikan banyak manfaat kesehatan, antara lain: Memperkuat Sistem Kekebalan Tubuh Istirahat yang cukup setiap malam sudah dikaitkan dengan sistem kekebalan tubuh yang kuat. Hal itu karena tidur memungkinkan tubuh untuk memperbaiki, meregenerasi, dan memulihkan diri.",
              style: TextStyle(
                fontWeight: FontWeight.normal, fontSize: 16,
              ),
              textAlign: TextAlign.justify,)
            ],
          ),
        )
      ),
    );
  }
}
