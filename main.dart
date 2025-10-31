import 'package:flutter/material.dart';

void main() {
  runApp(const JokiApp());
}

class JokiApp extends StatelessWidget {
  const JokiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Joki Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const PembayaranPage(),
    const HistoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pembayaran'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          // Banner besar di atas
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gold and glory.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              alignment: Alignment.center,
              child: const Text(
                'Selamat Datang di JokiGame+ 🎮',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Bagian kategori
          gameCategory(context, 'Game Populer', [
            {'title': 'Mobile Legends', 'image': 'assets/ml.jpg'},
            {'title': 'PUBG Mobile', 'image': 'assets/pubg.jpg'},
            {'title': 'Free Fire', 'image': 'assets/ff.jpg'},
            {'title': 'Delta Force', 'image': 'assets/delta force.jpg'},
            {'title': 'Gold and Glory', 'image': 'assets/gold and glory.jpg'},
          ]),

          gameCategory(context, 'Game RPG', [
            {'title': 'Genshin Impact', 'image': 'assets/genshin.jpg'},
            {'title': 'Mobile Legends', 'image': 'assets/ml.jpg'},
            {'title': 'Honkai Impact 3', 'image': 'assets/honkai.jpg'},
            {'title': 'Wuthering Waves', 'image': 'assets/wuthering.jpg'},
          ]),

          gameCategory(context, 'Game Battle Royale', [
            {'title': 'PUBG Mobile', 'image': 'assets/pubg.jpg'},
            {'title': 'Free Fire', 'image': 'assets/ff.jpg'},
          ]),
        ],
      ),
    );
  }

  // Widget untuk kategori (judul + list horizontal)
  Widget gameCategory(BuildContext context, String title, List<Map<String, String>> games) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: games.map((game) {
                return Padding(
                  padding: const EdgeInsets.only(right: 11),
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(game['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        game['title']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman Pembayaran 💳',
          style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Riwayat Pesanan 🕒',
          style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
