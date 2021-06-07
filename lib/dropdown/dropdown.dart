import 'dart:math';

import 'package:flutter/material.dart';
import 'package:admin/theme/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final firestoreInstance = FirebaseFirestore.instance;

  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: AppConstants.sidebarColor,
        width: MediaQuery.of(context).size.height * .50,
        height: MediaQuery.of(context).size.height * .60,
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: AppConstants.backgroundColor),

                items: <String>[
                  'Assets',
                  'Licenses',
                  'Employees',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(
                  "Please choose a type",
                  style: TextStyle(
                      color: AppConstants.backgroundColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String value) {
                  setState(() {
                    _chosenValue = value;
                  });
                },
              ),
              _chosenValue == null
                  ? Text("")
                  : Form(
                      child: checkType(_chosenValue),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget checkType(String value) {
    if (value == "Assets") {
      return assetsForm(context);
    } else if (value == "Licenses") {
      return licensesForm(context);
    }
    return employeeForm(context);
  }

  Column employeeForm(BuildContext context) {
    String job_type = '';
    String username = '';
    Timestamp date = Timestamp.fromMicrosecondsSinceEpoch(
        DateTime.now().microsecondsSinceEpoch);
    return Column(
      children: [
        Text(
          "Username",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            username = text;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Job Type",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            job_type = text;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Start Date",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        DateTimePicker(
          type: DateTimePickerType.dateTimeSeparate,
          dateMask: 'd MMM, yyyy',
          initialValue: DateTime.now().toString(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          icon: Icon(Icons.event),
          dateLabelText: 'Date',
          timeLabelText: "Hour",
          selectableDayPredicate: (date) {
            // Disable weekend days to select from the calendar
            if (date.weekday == 6 || date.weekday == 7) {
              return false;
            }

            return true;
          },
          onChanged: (val) {
            DateTime currentPhoneDate = DateTime.now(); //DateTime
            Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
            date = Timestamp.fromMicrosecondsSinceEpoch(
                currentPhoneDate.microsecondsSinceEpoch);
            print(date);
          },
          validator: (val) {
            print(val);
            return null;
          },
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            var rng = new Random();
            var randomNumber = rng.nextInt(1000000);
            String valueStr = randomNumber.toString();
            firestoreInstance.collection("employees").doc(valueStr).set({
              "job_type": job_type,
              "start_date": date,
              "username": username,
            }).then((_) {
              print("başarılı");
            });
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.done_rounded,
            color: Colors.blueGrey,
          ),
          label: Text(
            'ADD',
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: AppConstants.sidebarColor),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            primary: AppConstants.backgroundColor,
          ),
        ),
      ],
    );
  }

  Column licensesForm(BuildContext context) {
    String software = '';
    String category = '';
    String users = '';
    return Column(
      children: [
        Text(
          "Software",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            software = text;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Category",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            category = text;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Users",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            users = text;
          },
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            var rng = new Random();
            var randomNumber = rng.nextInt(1000000);
            String valueStr = randomNumber.toString();
            firestoreInstance.collection("licenses").doc(valueStr).set({
              "name": software,
              "category": category,
              "users": users,
            }).then((_) {
              print("başarılı");
            });
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.done_rounded,
            color: Colors.blueGrey,
          ),
          label: Text(
            'ADD',
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: AppConstants.sidebarColor),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            primary: AppConstants.backgroundColor,
          ),
        ),
      ],
    );
  }

  Column assetsForm(BuildContext context) {
    String asset_name = '';
    String description = '';
    String product_type = '';
    String quantity = '';
    return Column(
      children: [
        Text(
          "Asset Name",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            asset_name = text;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Asset Description",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            description = text;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Product Type",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            product_type = text;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Quantity",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          style: TextStyle(color: AppConstants.greenColor),
          onChanged: (text) {
            quantity = text;
          },
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            var rng = new Random();
            var randomNumber = rng.nextInt(1000000);
            String valueStr = randomNumber.toString();
            firestoreInstance.collection("assets").doc(valueStr).set({
              "name": asset_name,
              "description": description,
              "type": product_type,
              "quantity": quantity,
              "is_deleted": false,
            }).then((_) {
              print("başarılı");
            });
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.done_rounded,
            color: Colors.blueGrey,
          ),
          label: Text(
            'ADD',
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: AppConstants.sidebarColor),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            primary: AppConstants.backgroundColor,
          ),
        ),
      ],
    );
  }

  ElevatedButton buildOkButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.done_rounded,
        color: Colors.blueGrey,
      ),
      label: Text(
        'ADD',
        style: Theme.of(context)
            .textTheme
            .button
            .copyWith(color: AppConstants.sidebarColor),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        primary: AppConstants.backgroundColor,
      ),
    );
  }
}
