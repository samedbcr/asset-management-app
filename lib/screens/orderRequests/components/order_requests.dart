import 'package:admin/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class OrderRequests extends StatelessWidget {
  const OrderRequests({
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
                  DataColumn(
                    label: Text(
                      "Action",
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
      DataCell(Text("123123123")),
      DataCell(Text("ddogukanaydin")),
      DataCell(Text("Macbook Pro")),
      DataCell(Text("06/05/2021")),
      DataCell(
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.check_box,
                  color: AppConstants.greenColor,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    ],
  );
}