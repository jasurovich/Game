import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imtihon/model/model.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List<User>? post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "ScoreBoard",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
            ),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: _getData(),
          builder: (context, AsyncSnapshot<List<User>> snap) {
            var data = snap.data;
            return snap.hasData
                ? ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.yellow,
                              child: Text(
                                data[index].userId.toString(),
                              ),
                            ),
                            title: Text(
                              data[index].title.toString(),
                            ),
                            trailing: Container(
                              alignment: Alignment.center,
                              width: 40.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Text(
                                data[data.length - index - 1].id.toString(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CupertinoActivityIndicator(),
                  );
          },
        ),
      ),
    );
  }

  Future<List<User>> _getData() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => User.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato Bor : ${res.statusCode}");
    }
  }
}
