import 'dart:convert';
import 'dart:io';
import 'dart:io' as IO;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pick_note1/apikey.dart';
import 'package:pick_note1/utils.dart';
import 'package:http/http.dart ' as http;

class RecognitionScreen extends StatefulWidget {
  const RecognitionScreen({Key? key}) : super(key: key);

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  File? pickedImage;
  bool scannig = false;
  String scannedText = '';
  // @override
  // void initState() {
  //   pickedImage;
  //   super.initState();
  // }

  optionsdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () => pickImage(ImageSource.gallery),
                child: Text(
                  'Gallery',
                  style: textStyle(
                      size: 20, color: Colors.black, fw: FontWeight.w800),
                ),
              ),
              SimpleDialogOption(
                onPressed: () => pickImage(ImageSource.camera),
                child: Text(
                  'Camera',
                  style: textStyle(
                      size: 20, color: Colors.black, fw: FontWeight.w800),
                ),
              ),
            ],
          );
        });
  }

  pickImage(ImageSource source) async {
    final _image = await ImagePicker().pickImage(source: source);
    setState(() {
      scannig = true;
      pickedImage = File(_image!.path);
    });
    Navigator.pop(context);
    Uint8List bytes = IO.File(pickedImage!.path).readAsBytesSync();
    String img64 = base64Encode(bytes);

    String url = "https://api.ocr.space/parse/image";
    var data = {"base64Image": "data:image/jpg;base64,$img64"};
    var header = {"apikey": apiKey};
    http.Response response =
        await http.post(Uri.parse(url), body: data, headers: header);

    Map result = jsonDecode(response.body);
    print(result['ParsedResult'][0]['ParsedText']);
    setState(() {
      scannig = false;
      scannedText = result['ParsedResult'][0]['ParsedText'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatButtons(
            icon: Icons.copy,
          ),
          SizedBox(
            width: 10,
          ),
          FloatButtons(icon: Icons.reply),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 55 + MediaQuery.of(context).viewInsets.top,
              ),
              Text(
                'Pick Note',
                style: textStyle(
                    size: 30,
                    color: Colors.lightBlueAccent,
                    fw: FontWeight.w800),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => optionsdialog(context),
                child: Image(
                  width: 256,
                  height: 356,
                  image: pickedImage == null
                      ? AssetImage('images/p.jpg') as ImageProvider
                      : FileImage(pickedImage!),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              scannig
                  ? Text(
                      'Scannig.....',
                      style: textStyle(
                          size: 30, color: Colors.black, fw: FontWeight.w700,),
                    )
                  : Text(
                     scannedText,

                      style: textStyle(
                          size: 25,
                          color: Colors.lightBlueAccent.withOpacity(0.6),
                          fw: FontWeight.w600),textAlign: TextAlign.center,
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class FloatButtons extends StatelessWidget {
  IconData icon;
  FloatButtons({required this.icon});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightBlueAccent,
      heroTag: null,
      onPressed: () {},
      child: Icon(
        icon,
        size: 28,
      ),
    );
  }
}
