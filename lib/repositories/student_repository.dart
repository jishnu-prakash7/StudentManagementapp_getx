import 'package:student_management/database/db_helper.dart';
import 'package:student_management/database/util.dart';
import 'package:student_management/model/student_model.dart';

class StudentRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<StudentModel>> getStudent() async {
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> maps = await dbClient
        .query(tableName, columns: ['id', 'name', 'grade', 'section', 'image']);
    List<StudentModel> student = [];

    for (var i = 0; i < maps.length; i++) {
      student.add(StudentModel.fromMap(maps[i]));
    }

    return student;
  }

  Future<int> add(StudentModel studentModel) async {
    print('working');
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, studentModel.toMap());
  }

  Future<int> update(StudentModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, studentModel.toMap(),
        where: 'id=?', whereArgs: [studentModel.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id=?', whereArgs: [id]);
  }
}
