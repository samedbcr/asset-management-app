import 'package:admin/theme/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:admin/controllers/EmployeesController.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import 'package:intl/intl.dart';

class Employees extends StatelessWidget {
  final EmployeesController _controller = EmployeesController();

  Employees({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: (Responsive.isMobile(context))
                  ? Axis.horizontal
                  : Axis.vertical,
              child: _callAssetsStream(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _callAssetsStream() {
    return StreamBuilder(
      stream: _controller.getEmployees(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Waiting');
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return buildDataTable(snapshot.data.docs);
            } else {
              return Text("employees is Empty!");
            }
            break;
          default:
            return Text('Active');
        }
      },
    );
  }

  DataTable buildDataTable(List<QueryDocumentSnapshot> employees) {
    return DataTable(
      horizontalMargin: 0,
      columnSpacing: defaultPadding,
      dataRowHeight: 100,
      columns: [
        DataColumn(
          label: Text(
            "UserID",
            style: TextStyle(color: AppConstants.darkBlueColor),
          ),
        ),
        DataColumn(
          label: Text(
            "Username",
            style: TextStyle(color: AppConstants.darkBlueColor),
          ),
        ),
        DataColumn(
          label: Text(
            "Job Type",
            style: TextStyle(color: AppConstants.darkBlueColor),
          ),
        ),
        DataColumn(
          label: Text(
            "Start Date",
            style: TextStyle(color: AppConstants.darkBlueColor),
          ),
        ),
      ],
      rows: recentFileDataRow(employees),
    );
  }

  List<DataRow> recentFileDataRow(List<QueryDocumentSnapshot> employees) {
    return List.generate(
      employees.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text(employees[index].id),
          ),
          DataCell(
            Text(employees[index]["username"]),
          ),
          DataCell(
            Text(employees[index]["job_type"]),
          ),
          DataCell(
            Text(DateFormat.yMMMd()
                .format(DateTime.parse(
                    employees[index]["start_date"].toDate().toString()))
                .toString()),
          ),
        ],
      ),
    );
  }
}
