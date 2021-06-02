import 'package:admin/controllers/AssetsController.dart';
import 'package:admin/theme/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../extensions/string_extension.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Assets extends StatelessWidget {
  final AssetsController _controller = AssetsController();

  Assets({
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
      stream: _controller.getAssets(),
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
              return Text("Assets is Empty!");
            }
            break;
          default:
            return Text('Active');
        }
      },
    );
  }

  DataTable buildDataTable(List<QueryDocumentSnapshot> assets) {
    return DataTable(
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
      rows: recentFileDataRow(assets),
    );
  }

  List<DataRow> recentFileDataRow(List<QueryDocumentSnapshot> assets) {
    return List.generate(
      assets.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text(assets[index].id),
          ),
          DataCell(
            ListTile(
              title: Text(
                assets[index]["name"],
              ),
              subtitle: Text(
                assets[index]["description"],
                style: TextStyle(color: AppConstants.greenColor),
              ),
            ),
          ),
          DataCell(
            Text(
              assets[index]["type"].toString().capitalize(),
            ),
          ),
          DataCell(
            Text(
              assets[index]["quantity"].toString(),
            ),
          ),
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
      ),
    );
  }
}
