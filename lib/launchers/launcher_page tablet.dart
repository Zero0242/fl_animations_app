import 'package:animations_app/models/layout_model.dart';
import 'package:animations_app/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final screen = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Diseños en flutter - Tablet')),
      drawer: const _MenuPrincipal(),
      body: Row(
        children: [
          const SizedBox(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 10,
            height: double.infinity,
            color: (appTheme.darkTheme)
                ? Colors.grey
                : appTheme.currentTheme.colorScheme.secondary,
          ),
          Expanded(
            child: screen.currentPage,
          ),
        ],
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      itemCount: pageRoutes.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) =>
          Divider(color: appTheme.primaryColorLight),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.primaryColorLight,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: appTheme.primaryColorLight,
        ),
        onTap: () {
          final screen = Provider.of<LayoutModel>(context, listen: false);

          screen.currentPage = pageRoutes[index].page;
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final accentColor = appTheme.colorScheme.secondary;

    final proveedor = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text(
                  'P  C',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(child: _ListaOpciones()),
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: accentColor),
            title: const Text('Dark mode'),
            trailing: Switch.adaptive(
              value: proveedor.darkTheme,
              onChanged: (state) => proveedor.darkTheme = state,
              activeColor: accentColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_to_home_screen, color: accentColor),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
              value: proveedor.customTheme,
              onChanged: (state) => proveedor.customTheme = state,
              activeColor: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
