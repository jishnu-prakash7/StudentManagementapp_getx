import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/constants/colors.dart';
import 'package:student_management/constants/constants.dart';
import 'package:student_management/model/student_model.dart';
import 'package:student_management/presentation/add_student/widgets/text_form_field.dart';
import 'package:student_management/presentation/controllers/image_picker_controller.dart';
import 'package:student_management/presentation/controllers/student_controller.dart';

class updateStudent extends StatelessWidget {
  final String grade;
  final String name;
  final String section;
  final String imagePath;
  final int id;
  const updateStudent({
    super.key,
    required this.imagePath,
    required this.grade,
    required this.name,
    required this.section,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final studentDataController = Get.put(StudentDataController());
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: name);
    final gradeController = TextEditingController(text: grade);
    final sectionController = TextEditingController(text: section);

    PickimageController controller = PickimageController();
    controller.selectedImagePath.value = imagePath;

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
            )),
        backgroundColor: Kblack,
        title: const Text(
          'Update Details',
          style: TextStyle(
              color: KWhite,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              height20,
              CircleAvatar(
                backgroundImage:
                    FileImage(File(controller.selectedImagePath.value)),
                maxRadius: 60,
                child: Obx(
                  () => GestureDetector(
                      onTap: () async {
                        controller.pickImage();
                      },
                      child: controller.selectedImagePath.value != ''
                          ? ClipOval(
                              child: Image.file(
                                File(controller.selectedImagePath.value),
                                fit: BoxFit.cover,
                                width: 140,
                                height: 140,
                              ),
                            )
                          : null),
                ),
              ),
              height20,
              textformfield(
                labelText: 'Enter Name',
                controller: nameController,
                errorText: 'Name cannot be empty',
                formKey: _formKey,
              ),
              textformfield(
                labelText: 'Enter Grade',
                hintText: 'Eg:10',
                controller: gradeController,
                errorText: 'Grade cannot be empty',
                formKey: _formKey,
              ),
              textformfield(
                labelText: 'Enter Section',
                hintText: 'Eg:A',
                controller: sectionController,
                errorText: 'Section cannot be empty',
                formKey: _formKey,
              ),
              height20,
              ElevatedButton(
                onPressed: () {
                  if (controller.selectedImagePath.value.isEmpty) {
                    showDialog('No Image', 'Please select an Image',
                        const Color.fromARGB(255, 223, 87, 78));
                  }
                  if (_formKey.currentState!.validate() &&
                      controller.selectedImagePath.value.isNotEmpty) {
                    studentDataController.updateStudent(
                      StudentModel(
                        id: id,
                        image: controller.selectedImagePath.value,
                        name: nameController.text,
                        grade: gradeController.text,
                        section: sectionController.text,
                      ),
                    );
                    Get.back();
                    showDialog('Updated', 'Details Updated Succesfully',
                        const Color.fromARGB(255, 99, 190, 102));
                  }
                },
                child: const Text(
                  'Update Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  showDialog(String title, String message, Color backgroundcolor) {
    Get.snackbar(title, message,
        colorText: KWhite,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundcolor);
  }
}
