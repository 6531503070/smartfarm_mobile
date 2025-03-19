import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TempMetric extends StatefulHookWidget {
  const TempMetric({Key? key}) : super(key: key);

  @override
  State<TempMetric> createState() => _TempMetricState();
}

class _TempMetricState extends State<TempMetric> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 420,
          height: 160,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 420,
                  height: 160,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFCFCFD),
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
                left: 285.79,
                top: 18,
                child: SizedBox(
                  width: 45.08,
                  child: Text(
                    '77%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF0D1814),
                      fontSize: 20,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.40,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 249,
                top: 46,
                child: SizedBox(
                  width: 118.67,
                  child: Opacity(
                    opacity: 0.50,
                    child: Text(
                      'Soil moisture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.32,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 43,
                child: SizedBox(
                  width: 112,
                  height: 74,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '34',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 52,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                        TextSpan(
                          text: '°c',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                left: 88,
                top: 98,
                child: Text(
                  '⭣1%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF008D3F),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 125,
                child: Text(
                  'vs previous 30 days',
                  textAlign: TextAlign.center,
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
                left: 36,
                top: 7,
                child: Text(
                  'Avg. temperature',
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
                left: 270,
                top: 94,
                child: Text(
                  '6 mph/s',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF0D1814),
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.40,
                  ),
                ),
              ),
              Positioned(
                left: 257,
                top: 122,
                child: SizedBox(
                  width: 102.67,
                  child: Opacity(
                    opacity: 0.50,
                    child: Text(
                      'Wind speed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.32,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 210,
                top: 18,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                  width: 118,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.black.withValues(alpha: 51),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}