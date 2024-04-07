import 'package:get/get.dart';
import 'package:student_management/model/student_model.dart';
import 'package:student_management/repositories/student_repository.dart';

class StudentDataController extends GetxController {
  var allStudents = <StudentModel>[].obs;
  StudentRepository studentRepository = StudentRepository();

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  fetchStudents() async {
    var student = await studentRepository.getStudent();
    allStudents.value = student;
  }

  addStudent(StudentModel studentModel) {
    studentRepository.add(studentModel);
    fetchStudents();
  }

  updateStudent(StudentModel studentModel) {
    studentRepository.update(studentModel);
    fetchStudents();
  }

  deleteStudent(int id) {
    studentRepository.delete(id);
    fetchStudents();
  }
}
