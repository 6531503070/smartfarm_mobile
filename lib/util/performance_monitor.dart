import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PerformanceMonitor {
  static final Map<String, DateTime> _pageLoadTimes = {};
  static final Map<String, int> _pageVisitCount = {};

  // Track page load time
  static void trackPageLoad(String pageName) {
    _pageLoadTimes[pageName] = DateTime.now();
    _pageVisitCount[pageName] = (_pageVisitCount[pageName] ?? 0) + 1;

    if (kDebugMode) {
      developer.log(
          '📱 Page Loaded: $pageName (Visit #${_pageVisitCount[pageName]})');
    }
  }

  // Track page unload time
  static void trackPageUnload(String pageName) {
    final loadTime = _pageLoadTimes[pageName];
    if (loadTime != null) {
      final duration = DateTime.now().difference(loadTime);
      if (kDebugMode) {
        developer.log(
            '📱 Page Unloaded: $pageName (Duration: ${duration.inMilliseconds}ms)');
      }
      _pageLoadTimes.remove(pageName);
    }
  }

  // Get memory usage info
  static void logMemoryUsage() {
    if (kDebugMode) {
      // This is a basic memory check - in production you might want to use
      // more sophisticated memory monitoring
      developer.log('🧠 Memory check - Active pages: ${_pageLoadTimes.length}');
      developer.log('🧠 Page visit counts: $_pageVisitCount');
    }
  }

  // Clear all tracking data
  static void clearTracking() {
    _pageLoadTimes.clear();
    _pageVisitCount.clear();
  }

  // Get current active pages
  static List<String> getActivePages() {
    return _pageLoadTimes.keys.toList();
  }

  // Get page visit statistics
  static Map<String, int> getPageVisitStats() {
    return Map.from(_pageVisitCount);
  }
}

// Mixin for automatic performance tracking
mixin PerformanceTracking<T extends StatefulWidget> on State<T> {
  String get pageName => widget.runtimeType.toString();

  @override
  void initState() {
    super.initState();
    PerformanceMonitor.trackPageLoad(pageName);
  }

  @override
  void dispose() {
    PerformanceMonitor.trackPageUnload(pageName);
    super.dispose();
  }
}
