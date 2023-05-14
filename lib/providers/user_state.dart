import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/item_model.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import '../configs/basic_config.dart';

class UserState extends ChangeNotifier {
  late final Box boxUserSetting = Hive.box(boxUserSettingName);
  List<ItemModel> listAll = [];
  List<ItemModel> listPdf = [];
  List<ItemModel> listWord = [];
  List<ItemModel> listExcel = [];
  List<ItemModel> listPpt = [];
  bool isDarkMode = false;

  Future<void> ChageMode() async{
    isDarkMode = !isDarkMode;
    boxUserSetting.put("darkMode", isDarkMode);
    notifyListeners();
  }


  Future<void> initData()async{
    listAll = [];
    listPdf = [];
    listPpt = [];
    listWord = [];
    listExcel = [];
    isDarkMode = boxUserSetting.get("darkMode", defaultValue: false);
    String dataInit = boxUserSetting.get(
        "data", defaultValue: "");
    if (dataInit != "") {
      final item = json.decode(dataInit);
      for(var i in item){
        ItemModel ite = ItemModel.fromMap(i);
        if(ite.type == "pdf"){
          listPdf.add(ite);
        }else{
          if(ite.type == "excel"){
            listExcel.add(ite);
          }else{
            if(ite.type == "word"){
              listWord.add(ite);
            }else{
              listPpt.add(ite);
            }
          }
        }
        listAll.add(ite);
      }
    }
  }

  Future saveData() async{
    boxUserSetting.put("data", json.encode(listAll));
  }

  Future<void> pickFile() async {
    final pathLocal = await path_provider.getApplicationDocumentsDirectory();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls', 'docx', 'doc', 'pptx', 'ppt', 'pdf'],
    );
    if (result != null) {
      File i = File(result.files.single.path!);
      String name = result.files.single.name;
      String capacity = "${(result.files.single.size/1000).roundToDouble()}kb";
      i.copy("${pathLocal.path}/$name");
      String k = path.extension(i.path).toLowerCase();
      ItemModel it = ItemModel(image: "", name: name.split(".")[0], date: DateTime.now().toString().split(" ")[0], capacity: capacity, path: "${pathLocal.path}/$name",type: "");
      if(k.contains("pdf")){
        it.image = "assets/image/pdf.png";
        it.type = "pdf";
        listPdf.add(it);
      }else{
        if(k.contains("xlsx") || k.contains("xls")){
          it.image = "assets/image/excel.png";
          it.type = "excel";
          listExcel.add(it);
        }else{
          if(k.contains("docx") || k.contains("doc")){
            it.image = "assets/image/word.png";
            it.type = "word";
            listWord.add(it);
          }else{
            it.image = "assets/image/powerpoint.png";
            it.type = "powerpoint";
            listPpt.add(it);
          }
        }
      }
      listAll.add(it);
    }
    saveData();
    notifyListeners();
  }


  Future<void> deleteItem(ItemModel i)async{
    int index = listAll.indexWhere((element) => element.path == i.path);
    if(index > -1){
      listAll.removeAt(index);
    }
    int index1 = listPpt.indexWhere((element) => element.path == i.path);
    if(index1 > -1){
      listPpt.removeAt(index1);
    }
    int index2 = listWord.indexWhere((element) => element.path == i.path);
    if(index2 > -1){
      listWord.removeAt(index2);
    }
    int index3 = listExcel.indexWhere((element) => element.path == i.path);
    if(index3 > -1){
      listExcel.removeAt(index3);
    }
    int index4 = listPdf.indexWhere((element) => element.path == i.path);
    if(index4 > -1){
      listPdf.removeAt(index4);
    }
    saveData();
    notifyListeners();
  }
}
