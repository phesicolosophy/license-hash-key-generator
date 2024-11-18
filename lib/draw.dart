import 'package:flutter/material.dart';
import 'package:licensehash_key_generator/root_page.dart';
import 'package:licensehash_key_generator/utils.dart';

class Draw extends StatelessWidget {
  const Draw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      color: Colors.white,
      width: 200,
      child: Column(
        children: [
          const FlutterLogo(size: 64.0),
          const SizedBox(height: 32.0),
          const Divider(),
          const Spacer(),
          TextButton(
            onPressed: () => Utils.goToReplace(context, RootPage.get(EnumRoot.home)),
            child: MenuDraw(Icons.home, 'HOME'),
          ),
          TextButton(
            onPressed: () => Utils.goTo(context, RootPage.get(EnumRoot.licenseKey)),
            child: const MenuDraw(Icons.key, 'LICENSE KEY'),
          ),
          TextButton(
            onPressed: () => Utils.goTo(context, RootPage.get(EnumRoot.jwtToken)),
            child: const MenuDraw(Icons.token, 'JWT TOKEN'),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => Utils.goTo(context, RootPage.get(EnumRoot.about)),
            child: const MenuDraw(Icons.all_inbox_outlined, 'ABOUT'),
          ),
        ],
      ),
    );
  }
}

class MenuDraw extends StatelessWidget {
  final IconData? icon;
  final String text;
  const MenuDraw(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon), const SizedBox(width: 8.0), Text(text)],
    );
  }
}
