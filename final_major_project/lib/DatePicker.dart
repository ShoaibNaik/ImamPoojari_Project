import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';


class DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container(
      child: Center(
        child: Container(
          child: Column(
            children: [
              LinearDatePicker(
                startDate: "2000/01/01",
                endDate: "2099/12/12",
                initialDate: "2000/01/01",
                dateChangeListener: (String selectedDate) {
                  print(selectedDate);
                },
                showDay: true,
                fontFamily: 'Roboto',
                textColor: Colors.black,
                selectedColor: Colors.deepOrange,
                unselectedColor: Colors.blueGrey,
                yearText: "سال | year",
                monthText: "ماه | month",
                dayText: "روز | day",
                showLabels: true,
                columnWidth: 100,
                showMonthName: true,
                isJalaali: true,
              ),
              RaisedButton(
                child: Text(
                  "Pick Date | انتخاب تاریخ",
                ),
                onPressed: () {
                  showDateDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Choose Date'),
              content: LinearDatePicker(
                dateChangeListener: (String selectedDate) {
                  print(selectedDate);
                },
                showMonthName: true,
                isJalaali: true,
              ),
            ));
  }
}
