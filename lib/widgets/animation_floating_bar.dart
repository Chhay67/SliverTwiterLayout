import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimationFloatingBar extends StatefulWidget {
  const AnimationFloatingBar(
      {super.key,
      required this.floatingActionButton,
      required this.scrollController});
  final ScrollController scrollController;
  final Widget floatingActionButton;
  @override
  State<AnimationFloatingBar> createState() => _AnimationFloatingBarState();
}

class _AnimationFloatingBarState extends State<AnimationFloatingBar> {
  bool _isShowActingButton = true;

  @override
  void initState() {
    widget.scrollController.addListener(_onScrollListener);
    super.initState();
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
    setState(() {
      _isShowActingButton = true;
    });
  }

  void _hideActionBar() {
    setState(() {
      _isShowActingButton = false;
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isShowActingButton ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: widget.floatingActionButton,
    );
  }
}
