//Step 1 : import all required file
import 'dart:ffi';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqllite_crud_v1/Model/Students.dart';
//Step 2 : Initial the Database connection => User defined class
class DBConnection{
  //Step 2.1 : Create setDatabase method:
  Future<Database> setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var filepath = join(directory.path,'kitstudentdb');//Create the database
    var database = await openDatabase(filepath,version: 1,onCreate: _createTable);//Create the table
    return database;
  }
  //Step 2.2 : Create _createTable() method:
  _createTable(Database db,version) async{
    String query = 'CREATE TABLE STDUENTS( stu_id text PRIMARY KEY ,stu_name text not null ,year INTEGER not null,age INTEGER not null,phonenumber text not null)';
    //String query2 = 'CREATE TABLE EMPLOYEES(stu_id text PRIMARY KEY,stu_name text not null,department_id INTEGER not null )';
    await db.execute(query);
  }


}
class DBHandler {//Responsible from recieve data from the service and then push the data into database
  late DBConnection _dbConnection;
  static Database? _database; // Static because we want to make it as a single entity
  Future<Database?> get database async{
    if (_database!=null){
      return _database;
    }else{
      _dbConnection = DBConnection();
      _database=_dbConnection.setDatabase() as Database?;
      return _database;
    }
  }
  insertData(data) async{
    var db = await database;
    return await db!.insert("STUDENTS", data);
  }
}
class UserService{
  DBHandler ? _dbHandler;
  UserService(){_dbHandler=DBHandler();}//Initialize the dbhandler
  insertData(Student student) async{
    return await _dbHandler?.insertData(student.StudentMap());
  }
}
