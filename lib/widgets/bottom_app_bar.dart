import 'package:SmartMeat/screens/tutorialWifi.dart';
import 'package:SmartMeat/screens/tutorial_screen.dart';
import 'package:SmartMeat/tabs/home_tab.dart';
import 'package:flutter/material.dart';

class BottomApp extends StatelessWidget {
  const BottomApp();
  @override
  Widget build(BuildContext context) {
    Widget _buildBottomBar() => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: ModalRoute.of(context).settings.name == ('/home')
                        ? Color.fromARGB(255, 169, 0, 52)
                        : Colors.grey[700],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new HomeTab()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.wifi,
                    size: 32,
                    color:
                        ModalRoute.of(context).settings.name == ('/tutorial1')
                            ? Color.fromARGB(255, 169, 0, 52)
                            : Colors.grey[700],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new TutorialWifi()));
                  },
                ),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: 32,
                    color: ModalRoute.of(context).settings.name == ('/settings')
                        ? Color.fromARGB(255, 169, 0, 52)
                        : Colors.grey[700],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications_active,
                    size: 32,
                    // color: _controller.page.round() ==
                    //         1000 // alterar quando a pagina for criada
                    //     ? Color.fromARGB(255, 169, 0, 52)
                    //     : Colors.grey[700],
                  ),
                  onPressed: () {
                    // setState(() {});
                  },
                )
              ],
            ),
            height: 60,
          ),
        );
    return _buildBottomBar();
  }
}
