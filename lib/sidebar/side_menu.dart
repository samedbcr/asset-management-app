import 'package:asset_management_app/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.sidebarColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: DrawerHeader(
              child: Text(
                "CROSS - PLATFORM",
                style:
                    CustomTextHeadline.headLine5.copyWith(color: Colors.white),
              ),
            ),
          ),
          SidebarListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/dashboard.svg",
            press: () {
              Navigator.pushNamed(context, "/dashboard");
            },
          ),
          SidebarListTile(
            title: "Assets",
            svgSrc: "assets/icons/assets.svg",
            press: () {
              Navigator.pushNamed(context, "/assets");
            },
          ),
          SidebarListTile(
            title: "Licenses",
            svgSrc: "assets/icons/license.svg",
            press: () {
              Navigator.pushNamed(context, "/licenses");
            },
          ),
          SidebarListTile(
            title: "Employees",
            svgSrc: "assets/icons/employee.svg",
            press: () {
              Navigator.pushNamed(context, "/employees");
            },
          ),
          SidebarListTile(
            title: "Order Requests",
            svgSrc: "assets/icons/orderRequest.svg",
            press: () {
              Navigator.pushNamed(context, "/order_requests");
            },
          ),
          SidebarListTile(
            title: "All Activities",
            svgSrc: "assets/icons/activity.svg",
            press: () {
              Navigator.pushNamed(context, "/all_activities");
            },
          ),
        ],
      ),
    );
  }
}

class SidebarListTile extends StatelessWidget {
  const SidebarListTile({
    Key key,
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: SvgPicture.asset(
        svgSrc,
        width: 24,
        height: 24,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: CustomTextHeadline.headLine5.copyWith(color: Colors.white),
      ),
    );
  }
}
