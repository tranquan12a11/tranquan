import 'dart:async';  // Thêm thư viện Timer
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: DigitalClock(),
      ),
    ),
  ));
}

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late Timer timer;
  late DateTime currentTime;

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();  // Lấy thời gian hiện tại

    // Đặt Timer cập nhật mỗi giây
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        currentTime = DateTime.now();  // Cập nhật thời gian
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();  // Hủy Timer khi không sử dụng nữa
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Lấy giờ, phút hiện tại
    String hour = currentTime.hour.toString().padLeft(2, '0');
    String minute = currentTime.minute.toString().padLeft(2, '0');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Digit(number: int.parse(hour[0])),
        SizedBox(width: 10),
        Digit(number: int.parse(hour[1])),
        SizedBox(width: 10),
        Colon(),
        SizedBox(width: 10),
        Digit(number: int.parse(minute[0])),
        SizedBox(width: 10),
        Digit(number: int.parse(minute[1])),
      ],
    );
  }
}

class Colon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 10, height: 10, color: Colors.pink),
        SizedBox(height: 10),
        Container(width: 10, height: 10, color: Colors.pink),
      ],
    );
  }
}

class Digit extends StatelessWidget {
  final int number;
  Digit({required this.number});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DigitPainter(number),
      size: Size(50, 100),
    );
  }
}

class DigitPainter extends CustomPainter {
  final int number;
  DigitPainter(this.number);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint onPaint = Paint()..color = Colors.pink;
    final Paint offPaint = Paint()..color = Colors.grey;

    final segments = [
      Rect.fromLTWH(10, 0, size.width - 20, 10), // top
      Rect.fromLTWH(0, 10, 10, size.height / 2 - 15), // top-left
      Rect.fromLTWH(size.width - 10, 10, 10, size.height / 2 - 15), // top-right
      Rect.fromLTWH(10, size.height / 2 - 5, size.width - 20, 10), // middle
      Rect.fromLTWH(0, size.height / 2 + 5, 10, size.height / 2 - 15), // bottom-left
      Rect.fromLTWH(size.width - 10, size.height / 2 + 5, 10, size.height / 2 - 15), // bottom-right
      Rect.fromLTWH(10, size.height - 10, size.width - 20, 10), // bottom
    ];

    final segmentStatus = [
      [true, true, true, false, true, true, true],
      [false, false, true, false, false, true, false],
      [true, false, true, true, true, false, true],
      [true, false, true, true, false, true, true],
      [false, true, true, true, false, true, false],
      [true, true, false, true, false, true, true],
      [true, true, false, true, true, true, true],
      [true, false, true, false, false, true, false],
      [true, true, true, true, true, true, true],
      [true, true, true, true, false, true, true],
    ];

    for (int i = 0; i < 7; i++) {
      canvas.drawRect(segments[i], segmentStatus[number][i] ? onPaint : offPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
