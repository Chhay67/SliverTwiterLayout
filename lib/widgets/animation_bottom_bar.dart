import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimationBottomBar extends StatefulWidget {
  const AnimationBottomBar({
    super.key,
    required this.child,
    required this.scrollController,
    this.height = kBottomNavigationBarHeight,
  });

  final Widget child;
  final ScrollController scrollController;
  final double height;

  @override
  State<AnimationBottomBar> createState() => _AnimationBottomBarState();
}

class _AnimationBottomBarState extends State<AnimationBottomBar> {
  late ValueNotifier<bool> _isBottomVisible;

  @override
  void initState() {
    super.initState();
    _isBottomVisible = ValueNotifier<bool>(true); // Initial state
    widget.scrollController.addListener(_onScrollListener);
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
    if (!_isBottomVisible.value) {
      _isBottomVisible.value = true; // Update using value
    }
  }

  void _hideBottomBar() {
    if (_isBottomVisible.value) {
      _isBottomVisible.value = false; // Update using value
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollListener);
    _isBottomVisible.dispose(); // Dispose of the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isBottomVisible,
      builder: (context, isVisible, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          height: isVisible ? widget.height : 0,
          child: Wrap(
            children: [
              widget.child,
            ],
          ),
        );
      },
    );
  }
}