import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({
    Key? key,
    required this.url,
    this.title = 'Wallet4D',
    this.withAppBar = true,
    this.withProgressBar = true,
  }) : super(key: key);

  final String url;
  final String title;
  final bool withAppBar;
  final bool withProgressBar;

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late String url = widget.url;
  late String title = widget.title;

  final ValueNotifier<int?> _progress = ValueNotifier<int?>(0);

  Timer? _progressTimer;

  @override
  void dispose() {
    _progress.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }

  void _updateProgress(int progress) {
    _progress.value = progress;
    if (progress == 100) {
      _progressTimer?.cancel();
      _progressTimer = Timer(const Duration(seconds: 1), () {
        _progress.value = null;
      });
    }
  }

  Widget _progressBar(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: _progress,
      builder: (_, int? progress, __) => AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: progress != null ? LinearProgressIndicator(
          value: progress / 100,
          minHeight: 2,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        ) : const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onProgress: _updateProgress,
    );
    if (widget.withProgressBar) {
      child = Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(child: child),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            child: _progressBar(context),
          ),
        ],
      );
    }
    if (widget.withAppBar) {
      child = Scaffold(
        appBar: AppBar(title: Text(title), centerTitle: true),
        body: child,
      );
    }
    return child;
  }
}
