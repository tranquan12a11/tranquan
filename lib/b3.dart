import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Info Example'),
        ),
        body: Center(
          child: ProfileInfoCard(),
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  // Hàm mở liên kết khi nhấn vào
  Future<void> _launchLinkedIn() async {
    const url = 'https://www.facebook.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Không thể mở liên kết $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Phần hình ảnh đại diện
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://tse2.mm.bing.net/th?id=OIP.uv356bS3V2vPqq09778PGAHaLH&pid=Api&P=0&h=220',
            ),
          ),
          SizedBox(width: 16),
          // Phần thông tin bên phải hình ảnh
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Phần chữ Credit
              Text(
                'Credit',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 4),
              // Tên người dùng
              Text(
                'Patryk Serkowski',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              // Phần liên kết Linked In
              GestureDetector(
                onTap: _launchLinkedIn, // Gọi hàm mở liên kết khi nhấn
                child: Text(
                  'Linked In Contact',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
