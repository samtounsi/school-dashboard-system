// ignore_for_file: must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemProfile extends StatefulWidget {
  final String? title;
  String? subTitle;
  final IconData? icon;
  final IconData? iconEdit;

  ItemProfile(
      {Key? key,
        this.title,
        this.subTitle,
        this.icon,
        this.iconEdit})
      : super(key: key);

  @override
  State<ItemProfile> createState() => _ItemProfileState();
}

class _ItemProfileState extends State<ItemProfile> {
  late TextEditingController editingController;
  String name = '';

  @override
  void initState() {
    editingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 95,
      padding: new EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xFFA6CDCA),
        elevation: 10,
        child: Column(
          children: <Widget>[
            ListTile(
              title:
              Text('${widget.title}', style: TextStyle(fontSize: 18.0)),
              subtitle: Text('${widget.subTitle}',
                  style: TextStyle(fontSize: 20.0)),
              leading: Icon(widget.icon),
              trailing: IconButton(
                  onPressed: () async {

                  },
                  icon: Icon(widget.iconEdit)),
            ),
          ],
        ),
      ),
    );
  }

  void edit(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<String?> openDialogEdit(BuildContext context) => showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${widget.title} '),
          content: TextField(
            controller: editingController,
            decoration: InputDecoration(
              hintText: 'Edit ${widget.title}',
            ),
            onChanged: (value){

            },

          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(editingController.text);
                },
                child: Text('Edit'))
          ],
        );
      });
}