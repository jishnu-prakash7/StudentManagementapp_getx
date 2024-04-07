import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management/constants/colors.dart';
import 'package:student_management/presentation/update_student/screen_update_student.dart';
import 'package:student_management/presentation/controllers/student_controller.dart';

class ViewStudentPage extends StatefulWidget {
  const ViewStudentPage({Key? key}) : super(key: key);

  @override
  _ViewStudentPageState createState() => _ViewStudentPageState();
}

class _ViewStudentPageState extends State<ViewStudentPage> {
  final studentDataController = Get.put(StudentDataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: KWhite,
            ),
          ),
          backgroundColor: Kblack,
          title: const Text(
            'Student List',
            style: TextStyle(
                color: KWhite,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
        body: Obx(
          () => studentDataController.allStudents.isNotEmpty
              ? ListView.builder(
                  itemCount: studentDataController.allStudents.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          child: ClipOval(
                            child: Image.file(
                              File(studentDataController
                                  .allStudents[index].image!),
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          studentDataController.allStudents[index].name!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text(
                          'Grade: ${studentDataController.allStudents[index].grade}, Section: ${studentDataController.allStudents[index].section}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      radius: 10,
                                      confirmTextColor: Kblack,
                                      cancelTextColor: KWhite,
                                      textConfirm: 'Yes',
                                      buttonColor: KWhite,
                                      textCancel: 'No',
                                      onConfirm: () {
                                        Get.back();
                                        studentDataController.deleteStudent(
                                            studentDataController
                                                .allStudents[index].id!);
                                      },
                                      backgroundColor: Kred,
                                      title: 'Delete Details',
                                      titleStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: KWhite),
                                      content: const Text(
                                        'Are You sure you want to delete this details',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: KWhite),
                                      ));
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.to(updateStudent(
                                      imagePath: studentDataController
                                          .allStudents[index].image!,
                                      grade: studentDataController
                                          .allStudents[index].grade!,
                                      name: studentDataController
                                          .allStudents[index].name!,
                                      section: studentDataController
                                          .allStudents[index].section,
                                      id: studentDataController
                                          .allStudents[index].id!,
                                    ));
                                  },
                                  icon: const Icon(Icons.edit))
                            ],
                          ),
                        )),
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Lottie.asset(
                            'assets/animations/no data found.json'),
                      ),
                      const Text(
                        'No Datas Found?Add Data',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
