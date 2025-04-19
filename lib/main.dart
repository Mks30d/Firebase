import 'package:firebase/ui/main_page.dart';
import 'package:firebase/ui/signup_page.dart';
import 'package:firebase/ui/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

@pragma("vm:entry-point")
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void customSuccessScaffoldMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:
      Text("Successfully..."),
      backgroundColor: Colors.green,
    ),
  );
}

void customErrorScaffoldMessage(BuildContext context, String error) {
  debugPrint("Error:- $error");
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Error-: $error"),
      backgroundColor: Colors.red,
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscribe();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // displaying homepage if user is signin, if not then displaying signup page
      // it wasn't real time, it is synchronous
      // home: FirebaseAuth.instance.currentUser != null
      //     ? const MyHomePage()
      //     : SignupPage(),
      // OR

      // better than above method as it is real time, it is asynchronous
      // home: StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       if (snapshot.data != null) {
      //         print("MyHomePage...");
      //         return MyHomePage();
      //       }
      //       else{
      //         print("Not sign in...");
      //         return SigninPage();
      //       }
      //     }),

      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}

//-------- sending notification to all/subgroup user through api------------
void subscribe() {
  FirebaseMessaging massaging = FirebaseMessaging.instance;

  // to target specific group, we have define ever user group and for ever user we have to run below code by fetching their group_name
  // massaging.subscribeToTopic("group_name");  // OR

  //to sent notification to all users
  massaging.subscribeToTopic("all");
  print("---------Subscribe to all topic-----------");
}

// https://fcm.googleapis.com/v1/projects/fir-tutorial-cfc61/messages:send
// ------------ Postman Body format -------------
// {
//   "message": {
//     "topic": "all",
//     "notification": {
//       "title": "Breaking News",
//       "body": "New news story available."
//     }
//   }
// }
