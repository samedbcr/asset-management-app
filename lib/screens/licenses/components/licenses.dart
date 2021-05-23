import 'package:admin/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Licenses extends StatelessWidget {
  const Licenses({
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
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                    label: Text(
                      "LicenseID",
                      style: TextStyle(color: AppConstants.darkBlueColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Software",
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
                rows: List.generate(
                  10,
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
      DataCell(Text("Figma")),
      DataCell(Text("Design")),
      DataCell(Text("20")),
    ],
  );
}
