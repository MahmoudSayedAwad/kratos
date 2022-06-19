import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDb {

  static Database? _db ;

  Future<Database?> get db async {
    if (_db == null){
      _db  = await intialDb() ;
      return _db ;
    }else {
      return _db ;
    }
  }


  intialDb() async {
    String databasepath = await getDatabasesPath() ;
    String path = join(databasepath , 'kratos.db') ;
    Database mydb = await openDatabase(path , onCreate: _onCreate , version: 1  , onUpgrade:_onUpgrade ) ;
    return mydb ;
  }

  _onUpgrade(Database db , int oldversion , int newversion )async {


       await db.execute('''
       ALTER TABLE "user" ADD 
          COLUMN "phone" TEXT
       
       '''
       );

print("email added");
  }

  _onCreate(Database db , int version) async {
    await db.execute('''
  CREATE TABLE "user" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "name" TEXT  NOT NULL ,
            "gender" TEXT  NOT NULL ,
            "password" TEXT  NOT NULL ,
             "workingHours" TEXT  NOT NULL,
             "weight" INTEGER NOT NULL,
             "height" INTEGER NOT NULL,
             "email" TEXT NOT NULL,
             "phone" TEXT NOT NULL,
             "age" INTEGER NOT NULL
  )
 ''') ;
    if (kDebugMode) {
      print(" onCreate =====================================") ;
    }

  }

  readData(String sql) async {
    Database? mydb = await db ;
    List<Map> response = await  mydb!.rawQuery(sql);
    return response ;
  }
  insertData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawInsert(sql);
    return response ;
  }
  updateData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawUpdate(sql);
    return response ;
  }
  deleteData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawDelete(sql);
    return response ;
  }


// SELECT
// DELETE
// UPDATE
// INSERT


}


