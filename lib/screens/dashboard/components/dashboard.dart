import 'package:admin/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
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
          Text("Recent Activities"),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: (Responsive.isMobile(context))
                  ? Axis.horizontal
                  : Axis.vertical,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                    label: Text(
                      "ProductID",
                      style: TextStyle(color: AppConstants.darkBlueColor),
                    ),
                  ),
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
                      "Product Name",
                      style: TextStyle(color: AppConstants.darkBlueColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Date",
                      style: TextStyle(color: AppConstants.darkBlueColor),
                    ),
                  ),
                ],
                rows: List.generate(
                  5,
                  (index) => recentFileDataRow(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow() {
  return DataRow(
    cells: [
      DataCell(Text("123456")),
      DataCell(Text("123456")),
      DataCell(Text("ddogukan")),
      DataCell(Text("Macbook Pro")),
      DataCell(Text("6 Mayıs 2021")),
    ],
  );
}
