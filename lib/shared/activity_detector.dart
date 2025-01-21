import 'dart:async';

import 'package:flutter/cupertino.dart';

class ActivityDetector extends StatefulWidget {
  const ActivityDetector({super.key,required this.onShouldNavigate,required this.child});
  final Widget child;
  final Function() onShouldNavigate;

  @override
  State<ActivityDetector> createState() => _ActivityDetectorState();
}

class _ActivityDetectorState extends State<ActivityDetector> {
  late Timer? _timer;

  @override
  void initState() {
    start();
    super.initState();
  }

  void start(){


    _timer = Timer.periodic(const Duration(minutes: 1), _logScreenOut);

  }

  void stop(){

    _timer?.cancel();
    _timer = null;

  }
  void reset(){
    stop();
    start();
  }

  void _logScreenOut(Timer timer){
    stop();
    widget.onShouldNavigate.call();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        reset();
      },
      onPanDown: (details) {
        reset();
      },
      onScaleStart: (details) {
        reset();
      },
      child: widget.child,
    );
  }
}


