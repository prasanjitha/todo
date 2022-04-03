// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:todo/widget/category_list.dart';
import 'package:todo/widget/search.dart';
import 'data_class.dart';

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  bool _visible = false;
  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  bool isChecked = false;

  bool viewVisible = true;

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  bool hide = false;
  @override
  Widget build(BuildContext context) {
    
    Color myHexColor = Color.fromRGBO(15, 1, 69 ,1);
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      body: Container(
        color: myHexColor,
        padding: EdgeInsets.all(20),
        child: postModel.loading
            ? Center(
                child: Container(
                  child: SpinKitThreeBounce(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/man.jpg'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi,",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "Peter John",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 90.0,height: 100.0,),
                            PopupMenuButton<int>(
                              icon: Icon(Icons.more_vert, color: Colors.white),
                              onSelected: (item) => handleClick(item),
                              itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                    value: 0, child: Text('Logout')),
                                PopupMenuItem<int>(
                                    value: 1, child: Text('Settings')),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SearchPost()));
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 32.0),
                                borderRadius: BorderRadius.circular(25.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 32.0),
                                borderRadius: BorderRadius.circular(25.0)))),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Category",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CategoryList(),
                    Visibility(
                      visible: _visible,
                      child: Expanded(
                        child: Container(
                            color: Colors.white,
                            child: Consumer(
                              builder: (context, todo, child) {
                                return ListView.builder(
                                    itemCount:5,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  postModel.post?.title ?? "",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                  "Completed",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                            Transform.scale(
                                              scale: 1.5,
                                              child: Checkbox(
                                                activeColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.0))),
                                                value: isChecked,
                                                onChanged: (v) {
                                                  setState(() {
                                                    isChecked = v!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.only(
                                            bottom: 8, left: 16, right: 16),
                                      );
                                    });
                              },
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: FloatingActionButton(
                        backgroundColor: Colors.purpleAccent[100],
                        child: Icon(Icons.add),
                        onPressed: _toggle,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
