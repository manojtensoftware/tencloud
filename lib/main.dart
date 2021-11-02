import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:ten_cloud/loginpage/loginpage_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'home_page/home_page_widget.dart';
import 'accountsearch/accountsearch_widget.dart';
import 'profile/profile_widget.dart';
import 'orderlistbyagent/orderlistbyagent_widget.dart';
import 'recieptlist/recieptlist_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<TenCloudFirebaseUser> userStream;
  TenCloudFirebaseUser initialUser;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = tenCloudFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TenCloud',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Color(0xFFFBC02D),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginpageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'Accountsearch': AccountsearchWidget(),
      'profile': ProfileWidget(),
      'Orderlistbyagent': OrderlistbyagentWidget(),
      'Recieptlist': RecieptlistWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervisor_account_sharp,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.supervisor_account_outlined,
              size: 30,
            ),
            label: 'Ledger',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.person_rounded,
              size: 30,
            ),
            label: 'Profile',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_sharp,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
            label: 'Orders',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.rupeeSign,
              size: 24,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.rupeeSign,
              size: 24,
            ),
            label: 'Reciepts',
            tooltip: '',
          )
        ],
        backgroundColor: Color(0xE6000000),
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFFFBC02D),
        unselectedItemColor: Color(0xFFFBC02D),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
