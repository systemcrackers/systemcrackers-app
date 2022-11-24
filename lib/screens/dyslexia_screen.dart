import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:uia_app/models/dyslexia_request_model.dart';
import 'package:uia_app/utils/config.dart';
import '../models/dyslexia_response_model.dart';

import 'autism_home_screen.dart';

class DyslexiaScreen extends StatefulWidget {
  const DyslexiaScreen({super.key});

  @override
  State<DyslexiaScreen> createState() => _DyslexiaScreenState();
}

class _DyslexiaScreenState extends State<DyslexiaScreen> {
  Future<dynamic> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('files', filename));
    var res = await request.send();
    return res;
  }

  String state = "";
  String pred = "";
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text(
          'Diagnostic Tests',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Upload a picture of your handwriting',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            image == null
                ? ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    onPressed: () async {
                      var file = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      var streamedRes = await uploadImage(
                          file!.path, Config.dyslexiaUploadApi);
                      var res = await http.Response.fromStream(streamedRes);
                      setState(() {
                        image = file;
                        state = res.reasonPhrase!;
                        // pred = res.pred!;
                        // var tempPred = res.toJson();
                        // pred = tempPred['pred'];
                        print("Res: $res");
                        DyslexiaModel model =
                            DyslexiaModel.fromJson(json.decode(res.body));
                        pred = model.pred;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: const Text(
                        'Upload Image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            image != null
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal),
                        ),
                        onPressed: () async {
                          var file = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          var streamedRes = await uploadImage(
                              file!.path, Config.dyslexiaUploadApi);
                          var res = await http.Response.fromStream(streamedRes);
                          setState(() {
                            image = file;
                            state = res.reasonPhrase!;
                            // pred = res.pred!;
                            DyslexiaModel model =
                                DyslexiaModel.fromJson(json.decode(res.body));
                            pred = model.pred;
                            print("Res: $res");
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'Choose Another Image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal),
                        ),
                        onPressed: () async {
                          var streamedRes = await uploadImage(
                              image!.path, Config.dyslexiaUploadApi);
                          var res = await http.Response.fromStream(streamedRes);
                          setState(() {
                            state = res.reasonPhrase!;
                            // pred = res.pred!;
                            DyslexiaModel model =
                                DyslexiaModel.fromJson(json.decode(res.body));
                            pred = model.pred;
                            print("Final Res: $res");
                          });
                          DyslexiaRequestModel model =
                              DyslexiaRequestModel(img: image!, pred: pred);
                          var url = Uri.parse(Config.draftReportApi);
                          var newUrl = 'http://' + Config.apiUrl + url.path;
                          var streamedResult = await uploadImage(
                            image!.path, newUrl);
                          var result = await http.Response.fromStream(streamedResult);
                          // if (result.statusCode == 200) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           AutismHomeScreen(pred: pred),
                          //     ),
                          //   );
                          // }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AutismHomeScreen(pred: pred),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'Next >',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "No Image Selected",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
