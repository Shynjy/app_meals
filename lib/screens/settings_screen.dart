import 'package:app_meals/models/settings.dart';
import 'package:flutter/material.dart';

// Rotas
import '../utils/app_routes.dart';

// Tipos
import '../models/settings.dart';

// Widgets
import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;

  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // código criado para fazer funcionar o botao return no drawer
      onWillPop: () async {
        if (_key.currentState.isDrawerOpen) {
          Navigator.of(context).pop();
          return false;
        }
        Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
        return true;
      },
      child: Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text('Configurações'),
          ),
          drawer: MainDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Configutações',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _createSwitch(
                      'Sem Glutén',
                      'Só exibe refeição sem glutén.',
                      settings.isGlutenFree,
                      (value) => setState(() => settings.isGlutenFree = value),
                    ),
                    _createSwitch(
                      'Sem Lactose',
                      'Só exibe refeição sem lactose.',
                      settings.isLactoseFree,
                      (value) => setState(() => settings.isLactoseFree = value),
                    ),
                    _createSwitch(
                      'Vegana',
                      'Só exibe refeições veganas.',
                      settings.isVegan,
                      (value) => setState(() => settings.isVegan = value),
                    ),
                    _createSwitch(
                      'Vegetariana',
                      'Só exibe refeições vegetarianas.',
                      settings.isVegetarian,
                      (value) => setState(() => settings.isVegetarian = value),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
