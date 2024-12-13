import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<File> _imageList = [];
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _pickImageFromCamera() async {
    setState(() {
      _isLoading = true;
    });
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageList.add(_image!);
        _isLoading = false;
      });
    } else {
      _isLoading = false;
    }
  }

  Future<void> _imageLoaded() async {}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      /*Expanded(
            child: ListView.builder(
                itemCount: imageList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: imageList.length == 0
                        ? Text("사진 촬영ㄱㄱ")
                        : Image.file(
                            imageList[i],
                            width: 50,
                            height: 50,
                          ),
                  );
                }),
          ),*/
      Column(
        children: _imageList.map((_image) {
          return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("미리보기"),
                        content: Image.file(_image),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("이미지 삭제"),
                                        content: Text("정말로 이 이미지를 삭제 하시겠습니까?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  _imageList.remove(_image);
                                                });
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text("삭제")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("취소")),
                                        ],
                                      );
                                    });
                              },
                              child: Text("이미지 삭제"))
                        ],
                      );
                    });
              },
              child: _imageList.length == 0
                  ? Text("사진 촬영ㄱㄱ")
                  : _isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Image.file(
                            _image,
                            width: 50,
                            height: 50,
                          )));
        }).toList(),
      ),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(onPressed: _pickImageFromCamera, child: Text("카메라로 사진 찍기"))
    ]));
  }
}
