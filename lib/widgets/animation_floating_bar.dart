import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimationFloatingBar extends StatefulWidget {
  const AnimationFloatingBar({
    super.key,
    required this.floatingActionButton,
    required this.scrollController,
  });
  final ScrollController scrollController;
  final Widget floatingActionButton;
  @override
  State<AnimationFloatingBar> createState() => _AnimationFloatingBarState();
}

class _AnimationFloatingBarState extends State<AnimationFloatingBar> {
  late ValueNotifier<bool> _isShowActingButton;

  @override
  void initState() {
    super.initState();
    _isShowActingButton = ValueNotifier<bool>(true); // Initial state
    widget.scrollController.addListener(_onScrollListener);
  }

  void _onScrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _showActionBar();
    } else if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _hideActionBar();
    }
  }

  void _showActionBar() {
    if(!_isShowActingButton.value){
      _isShowActingButton.value = true;
    }
  }

  void _hideActionBar() {
    if(_isShowActingButton.value){
      _isShowActingButton.value = false;
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollListener);
    _isShowActingButton.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isShowActingButton,
      builder: (context, isVisible, child) {
        return AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: widget.floatingActionButton,
        );
      },
    );
  }
}