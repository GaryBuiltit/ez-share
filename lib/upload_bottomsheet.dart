import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadSheet extends StatelessWidget {
  UploadSheet({super.key, required this.files, required this.currentUser});
  final List<PlatformFile> files;
  final User? currentUser;
  final FirebaseStorage storage = FirebaseStorage.instance;

  _uploadFile() async {
    if (files.isNotEmpty) {
      final DateTime now = DateTime.now();
      final String timeStamp = now.toString().replaceAll(' ', '_');

      final folderName = '${currentUser!.uid}-$timeStamp';
      final Reference storageRef = storage.ref().child(folderName);
      try {
        for (var file in files) {
          final String fileName = file.path!.split('/').last;
          final Reference fileRef = storageRef.child(fileName);
          await fileRef.putData(file.bytes!);
        }

        String folderUrl = await storageRef.getDownloadURL();
        print('Folder URL: $folderUrl');
      } catch (e) {
        print('file upload error: $e');
      }
    }
  }

  //  getFiles() {
  //   return files.map<Widget>((file) {
  //     return Text(file.name);
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () => print('bottom sheet closed'),
        builder: (context) {
          return Column(children: [
            ListView(
              children: files.map<Widget>((file) {
                return Text(file.name);
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                _uploadFile();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Upload completed'),
                  ),
                );
              },
              child: const Text('Upload'),
            )
          ]);
        });
  }
}
