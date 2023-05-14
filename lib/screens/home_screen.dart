import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/user_state.dart';
import 'package:flutter_app/screens/All/all_screen.dart';
import 'package:flutter_app/screens/drawer.dart';
import 'package:flutter_app/screens/excel/excel_screen.dart';
import 'package:flutter_app/screens/pdf/pdf_screen.dart';
import 'package:flutter_app/screens/ppt/ppt_screen.dart';
import 'package:flutter_app/screens/word/word_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _version = 'Unknown';
  String tieuDe = "Trình đọc";
  Color cl = Colors.grey;
  final PageController controller = PageController(initialPage: 0);
  int _currentPageIndex = 0;


  Future<void> initPlatformState() async {
    String version;
    try {
      PdftronFlutter.initialize("your_pdftron_license_key");
      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _version = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: cl,
            title:  Text(tieuDe),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<UserState>().pickFile();
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          drawer: const DrawerScreen(),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _currentPageIndex = 0;
                          controller.jumpToPage(0);
                          tieuDe = "Trình đọc";
                          cl = Colors.grey;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/6,
                        decoration: BoxDecoration(
                          color:_currentPageIndex == 0 ? Colors.grey : Colors.transparent
                        ),
                        child: const Center(
                          child: Text("ALL"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _currentPageIndex = 1;
                          controller.jumpToPage(1);
                          tieuDe = "Trình đọc PDF";
                          cl = Colors.red;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/6,
                        decoration: BoxDecoration(
                            color: _currentPageIndex == 1 ? Colors.red : Colors.transparent
                        ),
                        child: const Center(
                          child: Text("PDF"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _currentPageIndex = 2;
                          controller.jumpToPage(2);
                          tieuDe = "Trình đọc Word";
                          cl = Colors.blue;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/6,
                        decoration: BoxDecoration(
                            color: _currentPageIndex == 2 ? Colors.blue : Colors.transparent
                        ),
                        child: const Center(
                          child: Text("WORD"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _currentPageIndex = 3;
                          controller.jumpToPage(3);
                          tieuDe = "Trình đọc Excel";
                          cl = Colors.green;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/6,
                        decoration: BoxDecoration(
                            color: _currentPageIndex == 3 ? Colors.green : Colors.transparent
                        ),
                        child: const Center(
                          child: Text("EXCEL"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _currentPageIndex = 4;
                          controller.jumpToPage(4);
                          tieuDe = "Trình đọc PPT";
                          cl = Colors.orange;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/6,
                        decoration: BoxDecoration(
                            color: _currentPageIndex == 4 ? Colors.orange : Colors.transparent
                        ),
                        child: const Center(
                          child: Text("PPT"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: PageView(
                controller: controller,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children:[
                  AllScreen(),
                  PDFScreen(),
                  WordScreen(),
                  ExcelScreen(),
                  PPTScreen()
                ],
              ),)
            ],
          ),),
    );
  }
}
