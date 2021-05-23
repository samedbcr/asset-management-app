import 'package:admin/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Assets extends StatelessWidget {
  const Assets({
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
                dataRowHeight: 100,
                columns: [
                  DataColumn(
                    label: Text(
                      "AssetID",
                      style: TextStyle(color: AppConstants.darkBlueColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Asset Name",
                      style: TextStyle(color: AppConstants.darkBlueColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Product Type",
                      style: TextStyle(color: AppConstants.darkBlueColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Quantity",
                      style: TextStyle(color: AppConstants.darkBlueColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Options",
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
      DataCell(ListTile(
        title: Text("Macbook Pro"),
        subtitle: Text(
          "Macbook Pro 13 inch",
          style: TextStyle(color: AppConstants.greenColor),
        ),
      )),
      DataCell(Text("Laptop")),
      DataCell(Text("20")),
      DataCell(
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: AppConstants.greenColor,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    ],
  );
}
