import 'package:flutter/material.dart';
import 'package:flutter_app/configs/basic_config.dart';
import 'package:flutter_app/providers/user_state.dart';
import 'package:flutter_app/screens/item.dart';
import 'package:provider/provider.dart';

import '../../models/item_model.dart';


class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<UserState>().isDarkMode ? kColorHomeDark:kColorHomeLight,
      padding:const EdgeInsets.symmetric(horizontal: 13),
      child: ListView.builder(
        itemCount: context.watch<UserState>().listAll.length,
        itemBuilder: (context,index){
          return Padding(
            padding: index == 0 ? const EdgeInsets.only(top: 20): const EdgeInsets.all(0),
            child: Item(context.watch<UserState>().listAll[index]),
          );
        },
      ),
    );
  }
}
