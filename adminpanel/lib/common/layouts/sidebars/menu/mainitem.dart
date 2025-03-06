import 'package:adminpanel/common/layouts/sidebars/menu/menuitem.dart';
import 'package:flutter/material.dart';

class Mainitem extends StatelessWidget {
  const Mainitem(
      {super.key,
      required this.title,
      required this.icon,
      required this.items});
  final String title;
  final String icon;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
          expansionAnimationStyle:
              AnimationStyle(duration: Duration(milliseconds: 300)),
          visualDensity: VisualDensity.comfortable,
          title: Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          // trailing: Image.asset(
          //   // ImageUrl.downArrow,
          //   // height: 20,
          //   // width: 30,
          // ),
          tilePadding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Adjust the indentation
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: items.map((item) {
            return RMenuItem(
                route: item.route, icon: item.icon, itemName: item.label);
          }).toList()),
    );
  }
}
