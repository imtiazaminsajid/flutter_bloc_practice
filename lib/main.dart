import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ApiServices/Repository.dart';
import 'Blocs/OfferBlocs/offer_bloc.dart';
import 'Blocs/OfferBlocs/offer_states.dart';
import 'OfferTestScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => OfferBloc(InitialState(), Repository()),
      )
    ], child: MyApp()));
    // runApp(MyApp());
  });
  //runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OfferTestScreen(),
    );
  }
}
