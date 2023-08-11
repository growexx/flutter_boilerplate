import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/models/message.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class MessageTile extends StatefulWidget {
  final Message recentMessage;
  const MessageTile(this.recentMessage, {Key? key}) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  String message = "";
  UserRepository userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    userRepository = Provider.of<UserRepository>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: const BoxDecoration(
        // color: Colors.white54,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              // Icon(
              //   Icons.account_circle,
              //   color: Colors.grey.shade600,
              //   size: 50,
              // ),
              // const SizedBox(
              //   width: 10.0,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recentMessage.messageSenderId.toString() ==
                            userRepository.currentUser!.id
                        ? widget.recentMessage.messageTo.toString()
                        : widget.recentMessage.messageFrom.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      widget.recentMessage.message.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                        // fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            // width: 150,
            child: Text(
              Jiffy.parseFromDateTime(widget.recentMessage.msgTime).fromNow(),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
