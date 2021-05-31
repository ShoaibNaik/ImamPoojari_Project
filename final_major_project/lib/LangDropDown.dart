import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';

class LangList extends StatefulWidget {
  LangList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LangListState createState() => _LangListState();
}

class _LangListState extends State<LangList> {
  List _langList = [
    {'no': 1, 'keyword': 'English'},
    {'no': 2, 'keyword': 'Urdu'},
    {'no': 3, 'keyword': 'Marathi'},
  ];
  List<DropdownMenuItem> _dropdownLangItems;
  var _selectedLang;

  @override
  void initState() {
    _dropdownLangItems = buildDropdownLangItems(_langList);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownMenuItem> buildDropdownLangItems(List _langList) {
    List<DropdownMenuItem> items = List();
    for (var i in _langList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  var lang = 'Hindi';

  onChangeDropdownLang(selectedLang) {
    print(selectedLang);
    setState(() {
      _selectedLang = selectedLang;
      lang = "English";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownBelow(
        itemWidth: 370,
        itemTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
        boxWidth: 370,
        boxHeight: 60,
        //  hint: Text('choose item'),
        value: _selectedLang,
        items: _dropdownLangItems,
        onChanged: onChangeDropdownLang,
      ),
    );
  }
}
