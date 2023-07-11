import 'package:app_system/domain/providers/homeController.dart';
import 'package:app_system/domain/providers/init.dart';
import 'package:app_system/ui/routes/fluroRouter.dart';
import 'package:app_system/ui/routes/navigationService.dart';
import 'package:app_system/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideMenu extends StatefulHookConsumerWidget {
  const SideMenu({super.key});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch<HomeController>(providerHome);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 120,
            ),
          ),
          DrawerListTile(
            title: "Home",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              NavigationService.navigateTo('/');
              provider.controlMenu();
            },
            isSelect: provider.currentPage == Flurorouter.dashboard,
          ),
          for (var modulo in provider.permisosModulo) ...[
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(modulo.nomPry, style: h3),
            ),
            for (var menu in provider.permisosMenu.where(
                (element) => element.codPry.startsWith(modulo.codPry))) ...[
              if (menu.clsPry == "M") ...[
                ExpansionTile(
                  title: Text(
                    menu.nomPry,
                    style: h5,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  children: [
                    for (var item in provider.permisosItem.where((element) =>
                        element.codPry.startsWith(menu.codPry) &&
                        element.clsPry == "I")) ...[
                      DrawerListTile(
                        title: item.nomPry,
                        svgSrc: "assets/icons/menu_setting.svg",
                        press: () {
                          provider.currentPage = menu.urlPry;
                          NavigationService.navigateTo(item.urlPry);
                          //provider.controlCloseMenu();
                        },
                      ),
                    ]
                  ],
                ),
              ] else ...[
                DrawerListTile(
                  title: menu.nomPry,
                  svgSrc: "assets/icons/menu_dashbord.svg",
                  press: () {
                    provider.currentPage = menu.urlPry;
                    NavigationService.navigateTo(menu.urlPry);
                    //InitProvider.homeController.controlCloseMenu();
                  },
                ),
              ]
            ]
          ],
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    this.isSelect = false,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8),
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding),
        color: isSelect ? bgColor : Colors.transparent,
      ),
      child: ListTile(
        onTap: press,

        //selected: isSelect,
        //tileColor: isSelect ? Colors.cyan : Colors.transparent,
        leading: SvgPicture.asset(
          svgSrc,
          color: isSelect ? Colors.white : Colors.black,
          width: 14,
          height: 14,
        ),
        //textColor: isSelect ? Colors.white : Colors.black,
        title: Text(
          title,
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isSelect ? Colors.white : Colors.black,
          ),
          //style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
