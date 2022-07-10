import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StateWrapper extends StatefulWidget {
  final Function initState;
  final Function disposeState;
  final Function onAppResume;
  final Function onAppPaused;
  final Function onAppInactive;
  final Function onAppDetached;
  final Widget child;

  StateWrapper({
    required this.initState,
    required this.disposeState,
    required this.onAppResume,
    required this.onAppPaused,
    required this.onAppInactive,
    required this.onAppDetached,
    required this.child,
  });

  @override
  _StateWrapperState createState() => _StateWrapperState();
}

class _StateWrapperState extends State<StateWrapper> with WidgetsBindingObserver {
  void initFunction() async {
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      await SchedulerBinding.instance.endOfFrame;
      if (widget.initState != null) {
        widget.initState();
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    initFunction();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (widget.onAppResume != null) {
          print('resumed');
          widget.onAppResume();
        }
        break;
      case AppLifecycleState.inactive:
        if (widget.onAppInactive != null) {
          print('inactive');
          widget.onAppInactive();
        }
        break;
      case AppLifecycleState.paused:
        if (widget.onAppPaused != null) {
          print('pause');
          widget.onAppPaused();
        }
        break;
      case AppLifecycleState.detached:
        if (widget.onAppDetached != null) {
          print('detached');
          widget.onAppDetached();
        }
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (widget.disposeState != null) {
      widget.disposeState();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
