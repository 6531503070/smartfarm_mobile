import 'package:flutter/material.dart';
import 'package:smartfarm_mobile/util/performance_monitor.dart';

class DebugOverlay extends StatefulWidget {
  final Widget child;

  const DebugOverlay({Key? key, required this.child}) : super(key: key);

  @override
  State<DebugOverlay> createState() => _DebugOverlayState();
}

class _DebugOverlayState extends State<DebugOverlay> {
  bool _showDebugInfo = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_showDebugInfo)
          Positioned(
            top: 50,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Debug Info',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Active Pages: ${PerformanceMonitor.getActivePages().length}',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    'Visit Stats: ${PerformanceMonitor.getPageVisitStats()}',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        Positioned(
          top: 10,
          right: 10,
          child: FloatingActionButton.small(
            onPressed: () {
              setState(() {
                _showDebugInfo = !_showDebugInfo;
              });
              PerformanceMonitor.logMemoryUsage();
            },
            child:
                Icon(_showDebugInfo ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ],
    );
  }
}
