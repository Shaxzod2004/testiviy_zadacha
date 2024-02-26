

import 'package:hive_flutter/adapters.dart';

class HiveRepository{

  final Box _box=Hive.box('favorite');

  saveFavorite(List<Map<String, dynamic>> dictionaries){
    _box.put('items',dictionaries);
  }

  List<Map<String, dynamic>> getFavorite(){
    return _box.get('items', defaultValue: List<Map<String, dynamic>>.of([]));
  }

  saveEmail(String email){
    _box.put('email', email);
  }

  String getEmail(){
    return _box.get('email',defaultValue:'');
  }


  saveFollow(bool followHive){
    _box.put('followHive', !followHive);
  }

  bool getFollow(){
    return _box.get('followHive',defaultValue:true);
  }





}