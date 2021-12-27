import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalDelete extends StatefulWidget {
  const ModalDelete({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  _ModalDeleteState createState() => _ModalDeleteState();
}

class _ModalDeleteState extends State<ModalDelete> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'http://clipart-library.com/image_gallery2/Red-Cross-Mark-Download-PNG.png',
            width: 100,
          ),
          const Text(
            "Are you sure?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          const Text(
            "Do you really want to delete your comment? This process cannot be undone.",
            style: TextStyle(fontSize: 16, color: Colors.black45),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: Colors.grey,
                    onPrimary: Colors.white,
                    side: BorderSide(width: 2, color: Colors.grey),
                    padding:
                        EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(4.0)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    side: BorderSide(width: 2, color: Colors.red),
                    padding:
                        EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(4.0)),
                  ),
                  onPressed: () {},
                  child: const Text('Delete')),
            ],
          ),
        ],
      ),
    );
  }
}
