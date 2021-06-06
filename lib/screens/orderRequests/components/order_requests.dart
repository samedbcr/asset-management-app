import 'package:admin/theme/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:admin/controllers/OrderRequestsController.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import 'package:intl/intl.dart';

class OrderRequests extends StatelessWidget {
  final OrderRequestsController _controller = OrderRequestsController();

  OrderRequests({
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
              child: _callOrderRequestsStream(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _callOrderRequestsStream() {
    return StreamBuilder(
      stream: _controller.getOrderRequets(),
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
                assets[index]["user_name"],
              ),
            ),
          ),
          DataCell(
            Text(
              assets[index]["product_name"].toString(),
            ),
          ),
          DataCell(
            Text(DateFormat.yMMMd()
                .format(DateTime.parse(
                    assets[index]["updated_at"].toDate().toString()))
                .toString()),
          ),
          DataCell(
            Row(
              children: [
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
