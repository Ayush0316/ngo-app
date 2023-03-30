import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:form_builder_phone_field/form_builder_phone_field.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:image_cropper/image_cropper.dart";
import "package:image_picker/image_picker.dart";
import "package:ngo_app/services/ML/preprocessing.dart";
import "package:ngo_app/services/database.dart";
import "package:uuid/uuid.dart";

class help_feedback extends StatefulWidget {
  const help_feedback({super.key});

  @override
  State<help_feedback> createState() => _help_feedbackState();
}

class _help_feedbackState extends State<help_feedback> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? tag;
  bool other1 = false;
  String error = " ";

  File? imageFile;

  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      cropImage(pickedFile);
    }
  }

  void cropImage(XFile file) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 20);

    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  void showPhotoOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Upload Profile Picture"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.gallery);
                  },
                  leading: Icon(Icons.photo_album),
                  title: Text("Select from Gallery"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.camera);
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a photo"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        //adding a search bar
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
              leading: BackButton(
                onPressed: () => Navigator.of(context).pop(false),
              ),
              title: Text("Create Community"),
              elevation: 0.0,
              backgroundColor: Colors.blue),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Container(), flex: 0),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          (imageFile != null) ? FileImage(imageFile!) : null,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: imageFile == null
                            ? Image.asset("images/logo.png")
                            : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            showPhotoOptions();
                          },
                          child: Text(
                            "CHANGE PICTURE",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Black',
                            ),
                          )),
                    ),
                    FormBuilder(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        FormBuilderTextField(
                          name: "email",
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'EMAIL',
                            suffixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        FormBuilderTextField(
                          name: "about",
                          decoration: InputDecoration(
                            labelText: 'ABOUT',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "socials",
                          decoration: InputDecoration(
                            labelText: 'Link of your social account',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "website",
                          decoration: InputDecoration(
                            labelText: 'Link to your website',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "server",
                          decoration: InputDecoration(
                            labelText: 'Link to your server',
                          ),
                        ),

                        // FormBuilderTextField(
                        //   name: "confirm_password",
                        //   obscureText: obscure_conf,
                        //   decoration: InputDecoration(
                        //     labelText: 'CONFIRM PASSWORD',
                        //     suffixIcon: IconButton(
                        //         onPressed: () {
                        //           _formKey.currentState?.save();
                        //           setState(() {
                        //             obscure_conf = !obscure_conf;
                        //           });
                        //         },
                        //         icon: Icon(obscure_conf
                        //             ? Icons.remove_red_eye_outlined
                        //             : Icons.visibility_off_outlined)),
                        //   ),
                        //   validator: FormBuilderValidators.compose([
                        //     FormBuilderValidators.required(),
                        //   ]),
                        // ),
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            labelText: 'Category',
                            hintText: 'Select any category',
                          ),
                          dropdownColor: Color.fromARGB(255, 189, 236, 243),
                          onChanged: (String? newValue) {
                            tag = newValue;
                            setState(() {
                              _formKey.currentState?.save();
                              if (newValue == "Any Other") {
                                other1 = true;
                              } else {
                                other1 = false;
                              }
                            });
                          },
                          items: <String>[
                            "Art & Culture",
                            "Children",
                            "EnvironmenT & Forests",
                            "Medical",
                            "Family Welfare",
                            "Legal Awareness & Aid",
                            "Vocational Training",
                            "Women's development & Empowerment",
                            "Youth Affairs",
                            "Agriculture",
                            "Teaching",
                            "Human Rights",
                            "Panchayti Raj",
                            "Urban Development & Poverty Alleviation",
                            "Women's Development & Empowerment",
                            "Civic Issues",
                            "Differently Abled",
                            "Tourism",
                            "Sports",
                            "Aged/Elderly",
                            "Nutrition",
                            "HIV/AIDS",
                            "Minority Issues",
                            "Science & Technoloy",
                            "Water Resources",
                            "Information & Commnication Technology",
                            "Skill Development",
                            "Micro Finance",
                            "Rural Development",
                            "Food Processing",
                            "Dairying & Fisheries",
                            "Animal Husbandry",
                            "Tribal Affairs",
                            "Drinking Water",
                            "Micro Small & Medium Enterprises",
                            "Labours & Employement",
                            "Industrial Reseach",
                            "New & Renewable Energy",
                            "Advocacy",
                            "Prisoner's Issues",
                            "Housing",
                            "Land Resources",
                            "Disaster Management",
                            "Biotechnology",
                            "Monuments Conservation",
                            "Student Counselling",
                            "Clean City",
                            "Peace",
                            "Dalit Upliftment",
                            "Any Other",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        Visibility(
                          visible: other1,
                          child: FormBuilderTextField(
                            name: "tag",
                            decoration: const InputDecoration(
                              labelText: "If other(specify)",
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                        ),
                        FormBuilderTextField(
                          name: "name",
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            suffixIcon: Icon(
                              Icons.person_2_rounded,
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        FormBuilderPhoneField(
                          name: 'phone_number',
                          decoration: const InputDecoration(
                            labelText: 'CONTACT NUMBER',
                            hintText: 'Phone Number',
                          ),
                          priorityListByIsoCode: ['KE'],
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            String uid = Uuid().v1();
                            String? Imgurl;
                            if (imageFile != null) {
                              Imgurl = await DatabaseService(uid: uid)
                                  .uploadImage(imageFile);
                            }

                            _formKey.currentState?.save();
                            if (_formKey.currentState!.validate()) {
                              Map<String, dynamic> formData = {
                                ..._formKey.currentState!.value
                              };

                              formData["Imgurl"] = Imgurl;
                              if (tag != "Any Other") {
                                formData["tag"] = tag;
                              }
                              formData["ml"] = ml(tag!);
                              await DatabaseService(uid: uid)
                                  .register_community(formData);

                              setState(() {
                                error = "Done successfully!!";
                              });
                            }
                          },
                          child: const Text(
                            "Add Community",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0.0,
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          error,
                          style: const TextStyle(color: Colors.green),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
