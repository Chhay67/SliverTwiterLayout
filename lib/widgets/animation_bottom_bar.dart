import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimationBottomBar extends StatefulWidget {
  const AnimationBottomBar(
      {super.key, required this.child, required this.scrollController});
  final Widget child;
  final ScrollController scrollController;

  @override
  State<AnimationBottomBar> createState() => _AnimationBottomBarState();
}

class _AnimationBottomBarState extends State<AnimationBottomBar> {
  bool _isBottomVisible = true;
  @override
  void initState() {
    widget.scrollController.addListener(_onScrollListener);
    super.initState();
  }

  void _onScrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _showBottomBar();
    } else if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _hideBottomBar();
    }
  }

  void _showBottomBar() {
    setState(() {
      _isBottomVisible = true;
    });
  }

  void _hideBottomBar() {
    setState(() {
      _isBottomVisible = false;
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: _isBottomVisible ? kBottomNavigationBarHeight : 0.0,
      child: Wrap(
        children: [
          widget.child,
        ],
      ),
    );
  }
}
