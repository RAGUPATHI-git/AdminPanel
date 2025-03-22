import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/utils/device_utility.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // gradient: DGradients.flightGet,
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.white, width: 1),
          )),
      padding: const EdgeInsets.symmetric(
          horizontal: DSizes.md, vertical: DSizes.sm),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          color: Colors.white,
        ),
        automaticallyImplyLeading:
            !DeviceUtility.isDesktopScreen(context) ? false : false,
        leading: !DeviceUtility.isDesktopScreen(context)
            ? IconButton(
                onPressed: () {
                  scaffoldKey?.currentState?.openDrawer();
                },
                icon: const Icon(Icons.dashboard))
            : null,
        actions: [
          if (!DeviceUtility.isDesktopScreen(context))
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          //notification button
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          const SizedBox(
            width: DSizes.spaceBtwItems / 2,
          ),
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 15, // Image radius
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200/300.jpg'),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      if (DeviceUtility.isDesktopScreen(context))
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // controller.loading.value
                            //     ? const Rshimmer(
                            //         height: 10, width: 120, radius: 5)
                            //     : Text(
                            //         controller.user.value.firstName.isNotEmpty
                            //             ? controller.user.value.firstName
                            //             : "",
                            //         style: const TextStyle(
                            //             fontWeight: FontWeight.w600),
                            //       ),
                            // controller.loading.value
                            //     ? const Rshimmer(
                            //         height: 10, width: 120, radius: 5)
                            //     : Text(controller.user.value.email.isNotEmpty
                            //         ? controller.user.value.email
                            //         : ""),
                          ],
                        ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(DeviceUtility.appBarHeight + 15);
}
