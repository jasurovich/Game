import 'package:flutter/material.dart';
import 'package:imtihon/screens/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();

  Color? _color;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _soniController = TextEditingController();

  List<DropdownMenuItem<Color>> _listOfDropdownc = [
    DropdownMenuItem(
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.red),
          SizedBox(
            width: 20.0,
          ),
          Text("Qizil Rang"),
        ],
      ),
      value: Colors.red,
    ),
    DropdownMenuItem(
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.green),
          SizedBox(
            width: 20.0,
          ),
          Text("Yashil Rang"),
        ],
      ),
      value: Colors.green,
    ),
    DropdownMenuItem(
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.blue),
          SizedBox(
            width: 20.0,
          ),
          Text("Moviy Rang"),
        ],
      ),
      value: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Tosh Qaychi Qog'oz",
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: _formListElementlar(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _formListElementlar() {
    return [
      CircleAvatar(
        radius: 100.0,
        backgroundImage: AssetImage(
          "assets/images/arm.png",
        ),
      ),
      SizedBox(
        height: 80.0,
      ),
      TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
          ),
          hintText: "Username Shu Yerda kiriting...",
          labelText: "Username",
        ),
        validator: (String? v) {
          if (v!.length < 4) {
            return "Username Kam Kirtildi !!!";
          }
        },
      ),
      SizedBox(height: 15.0),
      TextFormField(
        keyboardType: TextInputType.number,
        controller: _soniController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
          ),
          hintText: "Necha marta o'ynaymiz...",
          labelText: "O'yin soni",
        ),
      ),
      SizedBox(height: 10.0),
      DropdownButtonHideUnderline(
        child: DropdownButton<Color>(
          value: _color,
          hint: Text("Rang Tanlang"),
          items: _listOfDropdownc,
          onChanged: (v) {
            setState(() {
              _color = v;
            });
          },
        ),
      ),
      SizedBox(height: 20.0),
      Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, elevation: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow),
              Text("Start Game"),
            ],
          ),
          onPressed: () {
            if (_formKey.currentState!.validate() && _color != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(
                    color: _color,
                    username: _usernameController.text,
                    soni: int.parse(_soniController.text),
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Hamma Fieldni Tekshiring Iltimos !",
                  ),
                ),
              );
            }
          },
        ),
      ),
    ];
  }
}
