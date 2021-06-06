import 'package:admin/theme/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:admin/controllers/LicensesController.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Licenses extends StatelessWidget {
  final LicensesController _controller = LicensesController();
  Licenses({
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
              child: _callLicensesStream(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _callLicensesStream() {
    return StreamBuilder(
      stream: _controller.getLicenses(),
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
              return Text("Licenses is Empty!");
            }
            break;
          default:
            return Text('Active');
        }
      },
    );
  }

  DataTable buildDataTable(List<QueryDocumentSnapshot> licenses) {
    return DataTable(
      horizontalMargin: 0,
      columnSpacing: defaultPadding,
      dataRowHeight: 100,
      columns: [
        DataColumn(
          label: Text(
            "LicenseID",
            style: TextStyle(color: AppConstants.darkBlueColor),
          ),
        ),
        DataColumn(
          label: Text(
            "Name",
            style: TextStyle(color: AppConstants.darkBlueColor),
          ),
        ),
        DataColumn(
          label: Text(
            "Category",
            style: TextStyle(color: AppConstants.darkBlueColor),
          ),
        ),
        DataColumn(
          label: Text(
            "Users",
            style: TextStyle(color: AppConstants.darkBlueColor),
          ),
        ),
      ],
      rows: recentFileDataRow(licenses),
    );
  }

  List<DataRow> recentFileDataRow(List<QueryDocumentSnapshot> licenses) {
    return List.generate(
      licenses.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text(licenses[index].id),
          ),
          DataCell(
            Text(licenses[index]["name"]),
          ),
          DataCell(
            Text(licenses[index]["category"]),
          ),
          DataCell(
            Text(
              licenses[index]["users"].toString(),
            ),
          ),
        ],
      ),
    );
  }
}
