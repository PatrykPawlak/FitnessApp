import 'package:flutter/material.dart';
import 'package:FitnessApp/ui/navigation/custom_sidebar_navigation_clipper.dart';
import 'package:FitnessApp/ui/navigation/sidebar_navigation_item.dart';

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
                    itemText: 'Option 1',
                    func: this._toggle,
                  ),
                  Divider(
                    height: this._dividerHeight,
                    thickness: this._dividerThickness,
                  ),
                  SidebarNavigationItem(
                    itemText: 'Option 2',
                    func: this._toggle,
                  ),
                  Divider(
                    height: this._dividerHeight,
                    thickness: this._dividerThickness,
                  ),
                  SidebarNavigationItem(
                    itemText: 'Option 3',
                    func: this._toggle,
                  ),
                  Divider(
                    height: this._dividerHeight,
                    thickness: this._dividerThickness,
                  ),
                  SidebarNavigationItem(
                    itemText: 'Option 4',
                    func: this._toggle,
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
