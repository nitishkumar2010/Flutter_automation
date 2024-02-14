//to serve as an interface bw our code and shared preferences
import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';
import 'dart:convert';

class SPHelper {
  late SharedPreferences prefs; // we want to call init method only once
  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    prefs.setString(session.id.toString(),
        json.encode(session.toJson())); //encode session into map
  }
}
