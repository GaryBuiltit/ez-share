// ignore_for_file: unused_element

import 'dart:io';

import 'package:ezshare/upload_bottomsheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User? _currentUser;
  List<PlatformFile> files = [];
  int selectedIndex = 0;
  int currentIndex = 0;
  Color activeColor = Colors.red;
  Color addButtonColor = Colors.red;

  void _pickFile() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        setState(() {
          files = result.files;
        });

        if (mounted) {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return UploadSheet(
                  files: files,
                  currentUser: _currentUser,
                );
              });
        }
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }

  changeScreen(selectedIndex) {
    if (currentIndex == 0 && selectedIndex == 1) {
      setState(() {
        currentIndex = 1;
      });
    }

    if (currentIndex == 1 && selectedIndex == 0) {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  @override
  void initState() {
    _currentUser = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: const Text(
            'EZ Share',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickFile,
          backgroundColor: addButtonColor,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.upload_file,
            size: 40,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            changeScreen(index);
          },
          currentIndex: currentIndex,
          iconSize: 40,
          selectedItemColor: activeColor,
          selectedIconTheme: IconThemeData(
            color: activeColor,
          ),
          selectedFontSize: 16,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.file_copy_outlined,
              ),
              label: 'Uploads',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            )
          ],
          backgroundColor: Colors.grey[850],
        ),
        backgroundColor: Colors.grey[700],
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
