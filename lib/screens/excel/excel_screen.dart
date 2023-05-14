import 'package:flutter/material.dart';
import 'package:flutter_app/configs/basic_config.dart';
import 'package:flutter_app/providers/user_state.dart';
import 'package:flutter_app/screens/item.dart';
import 'package:provider/provider.dart';

class ExcelScreen extends StatefulWidget {
  const ExcelScreen({Key? key}) : super(key: key);

  @override
  State<ExcelScreen> createState() => _ExcelScreenState();
}

class _ExcelScreenState extends State<ExcelScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<UserState>().isDarkMode ? kColorHomeDark:kColorHomeLight,
      padding:const EdgeInsets.symmetric(horizontal: 13),
      child: ListView.builder(
        itemCount: context.watch<UserState>().listExcel.length,
        itemBuilder: (context,index){
          return Padding(
            padding: index == 0 ? const EdgeInsets.only(top: 20): const EdgeInsets.all(0),
            child: Item(context.watch<UserState>().listExcel[index]),
          );
        },
      ),
    );
  }
}
