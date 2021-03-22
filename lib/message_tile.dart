import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pankhuri_sample_app/models/message_model.dart';

class MessageTile extends StatelessWidget {
  final MessageModel messageModel;

  const MessageTile({Key key, this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          messageModel.imageUrl.isNotEmpty
              ? CircleAvatar(
                  radius: 20,
                  child: SizedBox.shrink(),
                  backgroundImage: NetworkImage(
                    messageModel.imageUrl ?? "",
                  ),
                  backgroundColor: Theme.of(context).accentColor,
                )
              : CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).accentColor,
                  child: Icon(
                    CupertinoIcons.question_circle_fill,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        child: Text("${messageModel.title}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${messageModel.time}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: messageModel.read
                                    ? Colors.grey
                                    : Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Visibility(
                            visible: !messageModel.read,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColor),
                              child: Text(
                                "${messageModel.messageCount}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              margin: EdgeInsets.only(left: 5),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: messageModel.read ? 15 : 10,
                ),
                Container(
                    child: Text(
                  "${messageModel.message}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
