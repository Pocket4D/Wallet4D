import 'package:flutter/material.dart';

/// Our custom fork of https://pub.dev/packages/modal_progress_hud adding a fading effect
///
/// wrapper around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// The progress indicator can be turned on or off using [showOverlay]
///
/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget
///
/// The color of the modal barrier can be set using [color]
///
/// The opacity of the modal barrier can be set using [opacity]
///
/// HUD=Heads Up Display
///
class OverlayModal extends StatefulWidget {
  final bool showOverlay;
  final bool preventBackbutton;
  final double opacity;
  final Color color;
  final Widget overlayWidget;
  final Widget child;
  final Function onShow;
  final Function onClose;

  OverlayModal(
      {@required this.showOverlay,
      @required this.child,
      this.preventBackbutton = false,
      this.opacity = 0.5,
      this.overlayWidget = const Center(child: CircularProgressIndicator()),
      this.color,
      this.onShow,
      this.onClose});

  @override
  _OverlayModalState createState() => _OverlayModalState();
}

class _OverlayModalState extends State<OverlayModal> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool _overlayVisible;

  _OverlayModalState();

  @override
  void initState() {
    super.initState();
    _overlayVisible = false;
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      // ignore: unnecessary_statements
      status == AnimationStatus.forward ? setState(() => {_overlayVisible = true}) : null;
      // ignore: unnecessary_statements
      status == AnimationStatus.dismissed ? setState(() => {_overlayVisible = false}) : null;
    });
    if (widget.showOverlay) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(OverlayModal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.showOverlay && widget.showOverlay) {
      widget.onShow();
      _controller.forward();
    }

    if (oldWidget.showOverlay && !widget.showOverlay) {
      widget.onClose();
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    widgets.add(widget.child);

    if (_overlayVisible == true) {
      final modal = FadeTransition(
        opacity: _animation,
        child: Stack(
          children: <Widget>[
            Opacity(
              child: ModalBarrier(
                dismissible: false,
                color: widget.color ?? Theme.of(context).colorScheme.background,
              ),
              opacity: widget.opacity,
            ),
            widget.overlayWidget,
          ],
        ),
      );
      widgets.add(modal);
    }

    return WillPopScope(
        onWillPop: () async {
          if (widget.preventBackbutton) {
            return false;
          }
          return true;
        },
        child: Stack(children: widgets));
  }
}
