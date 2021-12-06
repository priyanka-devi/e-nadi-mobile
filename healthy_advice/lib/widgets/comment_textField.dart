import 'package:flutter/material.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({Key? key}) : super(key: key);

  @override
  _CommentTextFieldState createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  final _formKey = GlobalKey<FormState>();
  String textFieldsValue ="";
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text("LEAVE A CONSTRUCTIVE COMMENT BELOW", style:
            TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20,
            ),textAlign: TextAlign.center),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(20.0),
              child:
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: "Leave a comment",
                          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          )
                      ),
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Required Field';
                        }
                        textFieldsValue = value;
                        return null;
                      },
                    ),
                    SizedBox(height: 12,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                        side: BorderSide(width: 2, color: Colors.indigo),
                        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),),
                      onPressed: (){
                        if (_formKey.currentState!.validate()){
                          print(textFieldsValue);
                        }

                      },
                      child: const Text('POST'),
                    ),
                    SizedBox(height: 20,),
                  ],

                ),

              ),

            ),

            // SizedBox(height: 12,),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
            //     primary: Colors.indigo,
            //     onPrimary: Colors.white,
            //     side: BorderSide(width: 2, color: Colors.indigo),
            //     padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            //     shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),),
            //   onPressed: () {},
            //   child: const Text('POST'),
            // ),
            // SizedBox(height: 20,),
          ],
        )
    );
  }
}
