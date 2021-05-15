import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  static const String routeName = 'wallet4d://web';

  static final RegExp linkRegExp = RegExp(
    r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\'
    r'.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
  );

  @override
  _WebPageState createState() => _WebPageState();
}

class WebPageArguments {
  const WebPageArguments({
    required this.url,
    this.title = '',
    this.withAppBar = true,
    this.withProgressBar = true,
  });

  final String url;
  final String title;
  final bool withAppBar;
  final bool withProgressBar;
}

class _WebPageState extends State<WebPage> {
  late final WebPageArguments _arguments = ModalRoute.of(context)!.settings.arguments! as WebPageArguments;

  final ValueNotifier<int?> _progress = ValueNotifier<int?>(0);
  late final ValueNotifier<String> _url = ValueNotifier<String>(_arguments.url);
  late final ValueNotifier<String> _title = ValueNotifier<String>(_arguments.title);

  WebViewController? _controller;
  Timer? _progressTimer;

  @override
  void dispose() {
    _url.dispose();
    _title.dispose();
    _progress.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }

  void _onPageChanged(String url) {
    _url.value = url;
    _controller?.getTitle().then((title) => _title.value = title ?? _title.value);
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
      builder: (_, progress, __) => AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: progress != null
            ? LinearProgressIndicator(
                value: progress / 100,
                minHeight: 2,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = WebView(
      initialUrl: _url.value,
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onPageStarted: _onPageChanged,
      onPageFinished: _onPageChanged,
      onProgress: _updateProgress,
      onWebViewCreated: (controller) => _controller = controller,
    );
    if (_arguments.withProgressBar) {
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
    if (_arguments.withAppBar) {
      child = Scaffold(
        appBar: AppBar(
          title: ValueListenableBuilder<String>(
            valueListenable: _title,
            builder: (_, title, __) => Text(title),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () => _controller?.reload(),
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
          centerTitle: true,
        ),
        body: child,
      );
    }
    return child;
  }
}
