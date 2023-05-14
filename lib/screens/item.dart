import 'package:flutter/material.dart';
import 'package:flutter_app/models/item_model.dart';
import 'package:flutter_app/providers/user_state.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'package:provider/provider.dart';

class Item extends StatefulWidget {
  final ItemModel model;

  const Item(this.model, {Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await PdftronFlutter.openDocument(widget.model.path);
      },
      child: Container(
        decoration:  BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black)),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 8,
                child: Row(
                  children: [
                    Image.asset(
                      widget.model.image,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.model.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 25),
                          ),
                          Text("${widget.model.date}~${widget.model.capacity}")
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    context.read<UserState>().deleteItem(widget.model);
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 35,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
