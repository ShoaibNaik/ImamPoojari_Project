import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class hospitalPage extends StatefulWidget {
  const hospitalPage({key}) : super(key: key);

  @override
  _hospitalPageState createState() => _hospitalPageState();
}

class _hospitalPageState extends State<hospitalPage> {

  TextEditingController name = TextEditingController();
  TextEditingController cName = TextEditingController();
  TextEditingController cNo = TextEditingController();
  TextEditingController address = TextEditingController();

  final snackBar = SnackBar(
    content: Text('Thanks for your contribution! Team Ummeed will connect you shortly'),
  );

  final snackBar1 = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  @override

  Future Reg() async{
    var url = "http://www.imampoojari.educationhost.cloud/pro_req.php";
    var response = await http.post(Uri.parse(url),body: {
      "type" : 'Hospital',
      "centerName" : name.text,
      "name" : cName.text,
      "contactNo" : cNo.text,
      "area" : Area.text,
      "address" : address.text,
    });

    var data = jsonDecode(response.body);

    if(data == 'success'){
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      return ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E8EC),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                margin: const EdgeInsets.only(top: 100,bottom: 70),
                child: Center(
                  child: Text(
                    "Hospital",
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
                      controller: name,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Hospital/Doctor Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: cName,
                      decoration: InputDecoration(
                        labelText: 'Contact Person Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: cNo,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Contact No',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.only(left: 12.0, right: 14.0),
                      child: DropDownField(
                        controller: Area,
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
                      controller: address,
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

  final Area = TextEditingController();

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
