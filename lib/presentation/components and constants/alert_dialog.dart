
import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  List<String>items;
  MultiSelect({Key? key,required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String>selectedItems=[];
  void itemChange(String itemValue,bool isSelected)
  {
    setState(() {
      if(isSelected)
      {
        selectedItems.add(itemValue);
      }
      else{
        selectedItems.remove(itemValue);
      }
    });

  }

  void cancel()
  {
    Navigator.pop(context);
  }

  void submit()
  {
    Navigator.pop(context,selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('select subjects'),
      content: SingleChildScrollView(
        child: ListBody(
          children:widget.items.map((item) => CheckboxListTile(
              value: selectedItems.contains(item),
              title: Text(item),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (isChecked)
              {
                itemChange(item, isChecked!);
              }

          )).toList(),
        ),
      ),
      actions: [
        TextButton(onPressed: cancel, child: Text('cancel')),
        TextButton(onPressed: submit, child: Text('submit')),
      ],


    );
  }
}