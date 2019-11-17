import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomApp extends StatefulWidget {
  const BottomApp();

  @override
  _BottomAppState createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {
  bool notificationState = false;

  Future checkNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationState = (prefs.getBool('notificacao'));
    });
  }

  Future _alterarStatusNotificacao(bool active) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notificacao', active);
    setState(() {
      notificationState = active;
    });
  }

  @override
  void initState() {
    super.initState();
    checkNotification();
  }

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
                    ModalRoute.of(context).settings.name != ('/home')
                        ? Navigator.pushNamed(context, '/home')
                        : null;
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
                    ModalRoute.of(context).settings.name != ('/tutorial1')
                        ? Navigator.pushNamed(context, '/tutorial1')
                        : null;
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
                  onPressed: () {
                    ModalRoute.of(context).settings.name != ('/settings')
                        ? Navigator.pushNamed(context, '/settings')
                        : null;
                  },
                ),
                IconButton(
                  icon: notificationState
                      ? Icon(
                          Icons.notifications_active,
                          size: 32,
                          color: Colors.grey[700],
                        )
                      : Icon(
                          Icons.notifications_off,
                          size: 32,
                          color: Colors.grey[700],
                        ),
                  onPressed: () {
                    _alterarStatusNotificacao(!notificationState);
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
