import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pankhuri_sample_app/models/message_model.dart';

import 'message_tile.dart';

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  ScrollController scrollController = ScrollController();

  List<String> categories = [
    "Wellness & Selfcare",
    "Bridal Fashion",
    "Photography",
    "Makeup",
    "Beauty and Salon"
  ];
  int midIndex;
  List<MessageModel> messageModels;

  @override
  void initState() {
    // TODO: implement initState
    midIndex = categories.length ~/ 2;
    messageModels = [
      MessageModel(
          imageUrl:
              "https://images.unsplash.com/photo-1512790182412-b19e6d62bc39?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80",
          title: "Photography",
          message: "Hi there, I'll help you with photos",
          time: "9:30 a.m.",
          read: false,
          messageCount: 24),
      MessageModel(
          imageUrl:
              "https://images.unsplash.com/photo-1573007974656-b958089e9f7b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
          title: "Regan Raj",
          message: "Hi there I want to know more about beauty tips",
          time: "7:20 a.m.",
          read: false,
          messageCount: 2),
      MessageModel(
        imageUrl: "",
        title: "How to loose weight in 60 seconds",
        message: "Hi there I want to know more about loosing weights",
        time: "1:20 a.m.",
        read: true,
      ),
      MessageModel(
        imageUrl:
            "https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fHBlcnNvbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        title: "Ophelia Hopkins",
        message: "Hi there I want to know more about Ophelia hopkins",
        time: "10:20 p.m.",
        read: true,
      ),
      MessageModel(
          imageUrl:
              "https://images.unsplash.com/photo-1604608619749-7dc84887834f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fHB8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          title: "Ask Pankhuri",
          message: "Hi there I want to know more about pankhuri",
          time: "11:20 p.m.",
          read: true)
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xfff1ebf8),
//7624d3
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: SafeArea(
            top: true,
            bottom: true,
            maintainBottomViewPadding: true,
            child: Container(
              height: 80,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 50,
                      child: Image.asset(
                        "assets/images/ssht.png",
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      )),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.event,
                        color: Colors.blueGrey,
                      ),
                      CircleAvatar(backgroundColor: Colors.red, radius: 5),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Theme.of(context).accentColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Select Category",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 12),
                  )),
              SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            children: categories
                                .sublist(0, midIndex)
                                .map((e) => Container(
                                      padding:
                                          EdgeInsets.only(left: 20, bottom: 5),
                                      child: Chip(
                                        label: Text("$e",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16)),
                                        padding: EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: Colors.white,
                                        elevation: 1,
                                      ),
                                    ))
                                .toList()),
                        Row(
                            children: categories
                                .sublist(midIndex, categories.length)
                                .map((e) => Container(
                                      padding:
                                          EdgeInsets.only(left: 20, bottom: 5),
                                      child: Chip(
                                        label: Text("$e",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16)),
                                        padding: EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 1,
                                        backgroundColor: Colors.white,
                                      ),
                                    ))
                                .toList()),
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                margin:
                    EdgeInsets.only(left: 20, top: 5, bottom: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Text("Ask Pankhuri something else",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16)),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: messageModels.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return MessageTile(
                      messageModel: messageModels[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
