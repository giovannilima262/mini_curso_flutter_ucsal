import 'package:flutter/material.dart';

class ScreenBlue extends StatefulWidget {
  const ScreenBlue({Key key}) : super(key: key);

  @override
  _ScreenBlueState createState() => _ScreenBlueState();
}

class _ScreenBlueState extends State<ScreenBlue> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Blue'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
      ),
    );
  }
}
