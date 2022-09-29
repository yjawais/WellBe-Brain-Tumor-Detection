//import 'package:amazon_clone/constants/global_variables.dart';

//import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:major_proj_sbj/features/home/screens/home_screen.dart';
//import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

void updatePage(int page){
  setState(() {
    _page=page;
  });
}

List<Widget> pages=[
const HomeScreen(),
Center(child: const Text("Account")),
Center(child: const Text("history")),

];


  @override
  Widget build(BuildContext context) {
    //final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: Colors.blue,         //GlobalVariables.selectedNavBarColor,
        unselectedItemColor: Colors.black,        //GlobalVariables.unselectedNavBarColor,
        backgroundColor: Colors.white,        //GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? Colors.blue//GlobalVariables.selectedNavBarColor
                          : Colors.white,// GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.home_outlined,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 1
                       ? Colors.blue//GlobalVariables.selectedNavBarColor
                          : Colors.white,// GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.person_outline_outlined,
                ),
              ),
              label: ''),
         BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 2
                                            ? Colors.blue//GlobalVariables.selectedNavBarColor
                          : Colors.white,// GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                   Icons.analytics_outlined,
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
