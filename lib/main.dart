import 'package:flutter/material.dart';
import 'b2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FacebookHomeScreen(),
    );
  }
}

class FacebookHomeScreen extends StatefulWidget {
  @override
  _FacebookHomeScreenState createState() => _FacebookHomeScreenState();
}

class _FacebookHomeScreenState extends State<FacebookHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'facebook',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DigitalClock()),
              );
            },

          ),
        ],
      ),
      body: ListView(
        children: [
          _buildPostInputSection(),
          _buildStoriesSection(),
          _buildSamplePost(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.blue : Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: _selectedIndex == 1 ? Colors.blue : Colors.black),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: _selectedIndex == 2 ? Colors.blue : Colors.black),
            label: 'Dating',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _selectedIndex == 3 ? Colors.blue : Colors.black),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: _selectedIndex == 4 ? Colors.blue : Colors.black),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildPostInputSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/457737499_482191057944918_7457650582918272959_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=ZcyJgF9is7QQ7kNvgFTxux6&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=Agcmm3pvK4oIjzN9BijQFMI&oh=00_AYAWMjC9-uDlnZNXbu3MW0XlGVMjNVp6vb2VrRI5cFPojQ&oe=6713DE24'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Bạn đang nghĩ gì?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStory('Tạo câu chuyện', 'https://mtv.vn/uploads/2023/02/25/meo-gg.jpg', true),
          _buildStory('Trần Quân', 'https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/457737499_482191057944918_7457650582918272959_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=ZcyJgF9is7QQ7kNvgFTxux6&_nc_zt=23&_nc_ht=scontent.fhan15-2.fna&_nc_gid=Agcmm3pvK4oIjzN9BijQFMI&oh=00_AYAWMjC9-uDlnZNXbu3MW0XlGVMjNVp6vb2VrRI5cFPojQ&oe=6713DE24'),
          _buildStory('Lê Nhật Lệ', 'https://khoinguonsangtao.vn/wp-content/uploads/2022/09/hinh-anh-em-be-de-thuong-nhat.jpg'),
          _buildStory('Đàm Quang Hùng', 'https://khoinguonsangtao.vn/wp-content/uploads/2022/09/hinh-anh-em-be-de-thuong-nhat.jpg'),
          _buildStory('Trần Đức Bo', 'https://tse3.mm.bing.net/th?id=OIP.Kfqp6nBLx0rcxtRKnyjtaQHaMy&pid=Api&P=0&h=220'),
          _buildStory('Huấn  Hoa Hồng', 'https://tse4.mm.bing.net/th?id=OIP.9tmFGAOzZ2wFmlp9tsEAsQHaIV&pid=Api&P=0&h=220'),
          _buildStory('Đàm Vĩnh Hưng', 'https://tse4.mm.bing.net/th?id=OIP.vAKwbKVv_wcZzvVVBva_jgHaLH&pid=Api&P=0&h=220'),
        ],
      ),
    );
  }

  Widget _buildStory(String name, String imageUrl, [bool isCreateStory = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 80,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isCreateStory)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add, color: Colors.white, size: 15),
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSamplePost() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPostHeader('Nguyễn Sơn', 'Mua Bán, Thanh Lý Đàn Piano, Organ...', 'https://tse3.mm.bing.net/th?id=OIP.YoclUhSAXQS5J-4MU8iPZAHaHa&pid=Api&P=0&h=220'),
          _buildPostContent('E cần thanh lý đàn kawai pw950, đàn dễ lâu e ko có thời gian học.'),
          _buildPostImage('https://tse1.mm.bing.net/th?id=OIP.5MicIg9ikjmt7KXUK18KxQHaEK&pid=Api&P=0&h=220'),
          _buildPostImage('https://tse3.mm.bing.net/th?id=OIP.AYdeGnW2C2TEf0ArmFuaDwHaGd&pid=Api&P=0&h=220'),
          _buildLikeCommentShareSection(),
          _buildPostHeader('Nguyễn BI CI', 'Mua Bán, Thanh Lý PC, Laptop...', 'https://tse3.mm.bing.net/th?id=OIP.tZaJxU6VSZ7897D1SeBn2QAAAA&pid=Api&P=0&h=220'),
          _buildPostContent('E cần thanh lý 2 bộ PC , chiến mọi thể loại game cho ae nhà mình luôn.'),
          _buildPostImage('https://tse4.mm.bing.net/th?id=OIP.36iQEt8I6KeadlozSx-U7QHaEK&pid=Api&P=0&h=220'),
          _buildPostImage('https://tse2.mm.bing.net/th?id=OIP.AxWLGPeYcJhydSU7qL40WQHaE6&pid=Api&P=0&h=220'),
          _buildLikeCommentShareSection(),
        ],
      ),
    );
  }

  Widget _buildPostHeader(String userName, String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(title, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPostContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(content),
    );
  }

  Widget _buildPostImage(String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      height: 200, // Chiều cao của hình ảnh
    );
  }

  Widget _buildLikeCommentShareSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLikeButton(),
        _buildCommentButton(),
        _buildShareButton(),
      ],
    );
  }

  Widget _buildLikeButton() {
    return Row(
      children: [
        Icon(Icons.thumb_up, color: Colors.grey),
        SizedBox(width: 5),
        Text('Thích', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildCommentButton() {
    return Row(
      children: [
        Icon(Icons.comment, color: Colors.grey),
        SizedBox(width: 5),
        Text('Bình luận', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildShareButton() {
    return Row(
      children: [
        Icon(Icons.share, color: Colors.grey),
        SizedBox(width: 5),
        Text('Chia sẻ', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
