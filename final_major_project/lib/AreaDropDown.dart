import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';

class Area extends StatefulWidget {
  Area({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<Area> {
  List _area = [
    {'no': 1, 'keyword': 'Amrut Nagar'},
    {'no': 2, 'keyword': 'Kausa'},
    {'no': 3, 'keyword': 'Tanwar Nagar'},
    {'no': 4, 'keyword': 'Imam'},
    {'no': 5, 'keyword': 'Poojari'}
  ];
  List<DropdownMenuItem> _dropdownLangItems;
  var _selectedArea;

  @override
  void initState() {
    _dropdownLangItems = buildDropdownLangItems(_area);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownMenuItem> buildDropdownLangItems(List _area) {
    List<DropdownMenuItem> items = List();
    for (var i in _area) {
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
      _selectedArea = selectedLang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownBelow(
        itemWidth: 350,
        itemTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
        boxWidth: 400,
        boxHeight: 60,
        //  hint: Text('choose item'),
        value: _selectedArea,
        items: _dropdownLangItems,
        onChanged: onChangeDropdownLang,
      ),
    );
  }
}
