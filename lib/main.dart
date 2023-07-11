import 'package:animations_app/routes/routes.dart';
import 'package:animations_app/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(2),
      child: const AppState(),
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations Playground App',
      //theme: ThemeData.dark(useMaterial3: true).copyWith(appBarTheme: const AppBarTheme(centerTitle: true)),
      theme: theme.currentTheme,
      themeAnimationCurve: Curves.bounceOut,
      themeAnimationDuration: const Duration(milliseconds: 600),
      home: const LauncherPage(),
    );
  }
}

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diseños en flutter')),
      drawer: const _MenuPrincipal(),
      body: const _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pageRoutes.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: Colors.blue),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing: const FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => pageRoutes[index].page,
            ),
          );
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal();

  @override
  Widget build(BuildContext context) {
    final proveedor = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Column(
        children: [
          const SafeArea(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  'P  C',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(child: _ListaOpciones()),
          ListTile(
            leading: const Icon(Icons.lightbulb_outline, color: Colors.blue),
            title: const Text('Dark mode'),
            trailing: Switch.adaptive(
              value: proveedor.darkTheme,
              onChanged: (state) => proveedor.darkTheme = state,
              activeColor: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_to_home_screen, color: Colors.blue),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
              value: proveedor.customTheme,
              onChanged: (state) => proveedor.customTheme = state,
              activeColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
