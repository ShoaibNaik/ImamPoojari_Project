import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'nav.dart';

class UserRegister extends StatefulWidget {
  final userId;
  const UserRegister({Key key, this.userId}) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController SArea = TextEditingController();
  TextEditingController mName = TextEditingController();
  TextEditingController mAddress = TextEditingController();
  Box dataBox;

  Future registration() async{
    var url = Uri.parse("http://imampoojari.educationhost.cloud/userReg.php");
    var response = await http.post(url,
        body:{
          "userId" : widget.userId,
          "firstName" : fName.text,
          "lastName" : lName.text,
          "email" : email.text,
          "place" : mName.text,
          "address": mAddress.text,
          "area" : Area.text,
        });
    var data = response.body;
    print(response.body);
    if (response.statusCode == 200){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => navBar()));
    }else{
      print('Error');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box("loginData");
  }
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
                margin: const EdgeInsets.only(top: 100,bottom: 70),
                child: Center(
                  child: Text(
                    "Register",
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
                      controller: fName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: lName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
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
                      controller: mName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Masjid Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: mAddress,
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Masjid Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: (){
                        setState(() {
                          registration();
                        });
                        dataBox.put('first_name',fName.text);
                        dataBox.put('last_name',lName.text);
                        dataBox.put('area',Area.text);
                        dataBox.put('email',email.text);

                      },
                      child: Container(
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
                              'Register',
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
