import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class diagnosticPage extends StatefulWidget {
  const diagnosticPage({key}) : super(key: key);

  @override
  _diagnosticPageState createState() => _diagnosticPageState();
}

class _diagnosticPageState extends State<diagnosticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E8EC),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                margin: const EdgeInsets.only(top: 100,bottom: 105),
                child: Center(
                  child: Text(
                    "Diagnostics",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Center Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Contact Person Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.only(left: 12.0, right: 14.0),
                      child: DropDownField(
                        controller: Gender,
                        hintText: 'Select Option',
                        hintStyle:
                        TextStyle(fontSize: 16.0),
                        enabled: true,
                        items: area,
                        itemsVisibleInDropdown: 2,
                        onValueChanged: (value) {
                          setState() {
                            selectArea = value;
                            print(selectArea);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF35BB9B),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String selectArea = "";

  final Gender = TextEditingController();

  List<String> area = [
    'Reti Bandar',
    'Alishan',
    'Sanjay Nagar',
    'Amrut Nagar',
    'Tanwar Nagar',
    'Shimla Park',
    'Shibli Nagar',
    'Shilphata',
    'Kalyanphata',
  ];


}
