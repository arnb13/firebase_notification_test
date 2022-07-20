
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  @override
  initState() {
    // TODO: implement initState
    FirebaseMessaging.instance.getInitialMessage().then((value) => null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Demo'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Firebase Notification Test',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            child:
            const Text(
                'Subscribe To Car'
            ),
            onPressed: () {
              FirebaseMessaging.instance.subscribeToTopic('car');
              showToast('You have subscribed to Car!');
            },
          ),

          const SizedBox(height: 20,),


          ElevatedButton(
            child:
            const Text(
                'Subscribe To Bus'
            ),
            onPressed: () {
              FirebaseMessaging.instance.subscribeToTopic('bus');
              showToast('You have subscribed to Bus!');
            },
          ),

          const SizedBox(height: 20,),

          ElevatedButton(
            child:
            const Text(
                'Subscribe To Train'
            ),
            onPressed: () {
              FirebaseMessaging.instance.subscribeToTopic('train');
              showToast('You have subscribed to Train!');
            },
          ),

          const SizedBox(height: 20,),


          ElevatedButton(
            child:
            const Text(
                'Unsubscribe'
            ),
            onPressed: () {
              FirebaseMessaging.instance.unsubscribeFromTopic('car');
              FirebaseMessaging.instance.unsubscribeFromTopic('bus');
              FirebaseMessaging.instance.unsubscribeFromTopic('train');
              showToast('You have been unsubscribed!');
            },
          ),

          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  showToast (String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.black,
        backgroundColor: Colors.indigo.withOpacity(0.6),
        fontSize: 16.0
    );
  }
}
