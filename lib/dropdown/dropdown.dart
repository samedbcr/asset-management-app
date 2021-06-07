import 'package:flutter/material.dart';
import 'package:admin/theme/constants.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
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
    return Column(
      children: [
        Text(
          "UserID",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          onChanged: (text) {
            print('1 text field: $text');
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Username",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          onChanged: (text) {
            print('2 text field: $text');
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
          onChanged: (text) {
            print('3 text field: $text');
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Start Date",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          onChanged: (text) {
            print('4 text field: $text');
          },
        ),
        SizedBox(
          height: 20,
        ),
        buildOkButton(context),
      ],
    );
  }

  Column licensesForm(BuildContext context) {
    return Column(
      children: [
        Text(
          "LicenseID",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          onChanged: (text) {
            print('1 text field: $text');
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Software",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          onChanged: (text) {
            print('2 text field: $text');
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
          onChanged: (text) {
            print('3 text field: $text');
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
          onChanged: (text) {
            print('4 text field: $text');
          },
        ),
        SizedBox(
          height: 20,
        ),
        buildOkButton(context),
      ],
    );
  }

  Column assetsForm(BuildContext context) {
    return Column(
      children: [
        Text(
          "AssetID",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          onChanged: (text) {
            print('1 text field: $text');
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Asset Name",
          style: TextStyle(color: AppConstants.backgroundColor),
        ),
        TextFormField(
          onChanged: (text) {
            print('2 text field: $text');
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
          onChanged: (text) {
            print('3 text field: $text');
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
          onChanged: (text) {
            print('4 text field: $text');
          },
        ),
        SizedBox(
          height: 20,
        ),
        buildOkButton(context),
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
        'OK!',
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
