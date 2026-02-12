import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';

import 'app_router.dart';
import 'app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appLinks = AppLinks();
  final initialUri = await appLinks.getInitialLink();
  runApp(MyApp(initialUri: initialUri,));
}

class MyApp extends StatefulWidget {
  final Uri? initialUri;
  const MyApp({super.key,this.initialUri});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    _initDeepLinks();
  }

  void _initDeepLinks() async {
    // 1. Listen for ALL future links (Warm/Foreground)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('Incoming link: $uri');
      _navigateWithUri(uri);
    });

    // 2. Handle the initial link (Cold Start)
    // If you passed it via the constructor (widget.initialUri), use that!
    if (widget.initialUri != null) {
      debugPrint('Initial link from constructor: ${widget.initialUri}');
      _navigateWithUri(widget.initialUri!);
    } else {
      // Fallback check just in case
      final initial = await _appLinks.getInitialLink();
      if (initial != null) {
        _navigateWithUri(initial);
      }
    }
  }

  void _navigateWithUri(Uri uri) {
    var path = uri.path;

    if (path.startsWith('/deeplinking')) {
      path = path.replaceFirst('/deeplinking', '');
    }

    if (path.isEmpty) {
      path = '/';
    }

    // Ensure leading slash
    if (!path.startsWith('/')) {
      path = '/$path';
    }

    _appRouter.pushPath(path);
  }


  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        deepLinkTransformer: (uri) async {
          final path = uri.path.replaceFirst('/deeplinking', '');
          switch (path) {
            case '/home':
              _appRouter.push(MyHomeRoute());
              break;
            case '/notification':
              _appRouter.push(MyNotificationRoute());
              break;
            default:
              _appRouter.push(MyProfileRoute());
          }
          // Return anything just to satisfy signature
          return uri;
        },


      ),
    );

  }
}
