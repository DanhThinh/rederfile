import 'package:flutter/material.dart';
import 'package:flutter_app/providers/user_state.dart';
import 'package:flutter_app/screens/item.dart';
import 'package:provider/provider.dart';

import '../../configs/basic_config.dart';

class PPTScreen extends StatefulWidget {
  const PPTScreen({Key? key}) : super(key: key);

  @override
  State<PPTScreen> createState() => _PPTScreenState();
}

class _PPTScreenState extends State<PPTScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<UserState>().isDarkMode ? kColorHomeDark:kColorHomeLight,
      padding:const EdgeInsets.symmetric(horizontal: 13),
      child: ListView.builder(
        itemCount: context.watch<UserState>().listPpt.length,
        itemBuilder: (context,index){
          return Padding(
            padding: index == 0 ? const EdgeInsets.only(top: 20): const EdgeInsets.all(0),
            child: Item(context.watch<UserState>().listPpt[index]),
          );
        },
      ),
    );
  }
}
