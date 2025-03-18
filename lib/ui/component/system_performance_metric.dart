import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SystemPerformanceMetric extends StatefulHookWidget {
  const SystemPerformanceMetric({Key? key}) : super(key: key);

  @override
  State<SystemPerformanceMetric> createState() => _SystemPerformanceMetricState();
}

class _SystemPerformanceMetricState extends State<SystemPerformanceMetric> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 420,
          height: 362,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 420,
                  height: 362,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFCFCFD),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 248,
                top: 237,
                child: Text(
                  'Good',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF32AA27),
                    fontSize: 48,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.96,
                  ),
                ),
              ),
              Positioned(
                left: 99,
                top: 10,
                child: SizedBox(
                  width: 224,
                  child: Text(
                    'System Performance Metrics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 148,
                top: 53,
                child: Text(
                  'Labor Reduction',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 206,
                child: Text(
                  'Irrigation Efficiency',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                  ),
                ),
              ),
              Positioned(
                left: 265,
                top: 206,
                child: Text(
                  'Crop Health',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                  ),
                ),
              ),
              Positioned(
                left: 139,
                top: 153,
                child: SizedBox(
                  width: 142,
                  child: Opacity(
                    opacity: 0.50,
                    child: Text(
                      'Hours of manual labor saved.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.20,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 307,
                child: SizedBox(
                  width: 142,
                  child: Opacity(
                    opacity: 0.50,
                    child: Text(
                      'Proportion of optimal vs. wasted water usage.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.20,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 240,
                top: 307,
                child: SizedBox(
                  width: 142,
                  child: Opacity(
                    opacity: 0.50,
                    child: Text(
                      'Based on sensor data.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.20,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 237,
                child: Text(
                  'Good',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF32AA27),
                    fontSize: 48,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.96,
                  ),
                ),
              ),
              Positioned(
                left: 178,
                top: 83,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '19',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 48,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.96,
                        ),
                      ),
                      TextSpan(
                        text: 'hr.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}