import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/navigation/index.dart'
    show SidebarNavigationItem, CustomSidebarNavigationClipper;
import 'package:FitnessApp/router/index.dart' show Routes;

class SidebarNavigationLayout extends StatefulWidget {
  @override
  _SidebarNavigationLayoutState createState() =>
      _SidebarNavigationLayoutState();
}

class _SidebarNavigationLayoutState extends State<SidebarNavigationLayout>
    with SingleTickerProviderStateMixin<SidebarNavigationLayout> {
  AnimationController _animationController;
  bool _isSidebarNavigationOpen;
  final double _dividerHeight = 40.0;
  final double _dividerThickness = 2.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      debugLabel: "SidebarNavigationAnimation",
    );

    _isSidebarNavigationOpen = false;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _toggle() {
    setState(() {
      _isSidebarNavigationOpen = !_isSidebarNavigationOpen;
      _isSidebarNavigationOpen
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return AnimatedPositioned(
      duration: _animationController.duration,
      top: 0,
      right: _isSidebarNavigationOpen ? 0 : _screenSize.width - 45,
      bottom: 0,
      left: _isSidebarNavigationOpen ? 0 : -_screenSize.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.indigo,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SidebarNavigationItem(
                    itemText: 'FirstScreen',
                    routeName: Routes.firstScreen,
                    func: _toggle,
                  ),
                  Divider(
                    height: this._dividerHeight,
                    thickness: this._dividerThickness,
                  ),
                  SidebarNavigationItem(
                    itemText: 'SecondScreen',
                    routeName: Routes.secondScreen,
                    func: _toggle,
                  ),
                  Divider(
                    height: this._dividerHeight,
                    thickness: this._dividerThickness,
                  ),
                  SidebarNavigationItem(
                    itemText: 'ThirdScreen',
                    routeName: Routes.thirdScreen,
                    func: _toggle,
                  ),
                  Divider(
                    height: this._dividerHeight,
                    thickness: this._dividerThickness,
                  ),
                  SidebarNavigationItem(
                    itemText: 'FourthScreen',
                    routeName: Routes.fourthScreen,
                    func: _toggle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment(0, -0.9),
            child: ClipPath(
              clipper: CustomSidebarNavigationClipper(),
              child: Container(
                width: 35,
                height: 110,
                alignment: Alignment.centerLeft,
                color: Colors.indigo,
                child: GestureDetector(
                  onTap: () => _toggle(),
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    color: Colors.white,
                    progress: _animationController,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
