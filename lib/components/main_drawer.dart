import 'package:flutter/material.dart';

// Rotas
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(label,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    String isSettingPage;

    // Verifica rota atual
    Navigator.popUntil(context, (route) {
      // Atribui o valor da rota atual
      isSettingPage = route.settings.name;
      return true; // esse retorno é obrigatório
    });

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
              Icons.restaurant,
              'Refeições',
              isSettingPage == AppRoutes.HOME
                  ? () => Navigator.pop(context) // Fecha Drawer
                  : () => Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.HOME)),
          _createItem(
              Icons.settings,
              'Configurações',
              isSettingPage == AppRoutes.SETTINGS
                  ? () => Navigator.pop(context)
                  : () => Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.SETTINGS)),
        ],
      ),
    );
  }
}
