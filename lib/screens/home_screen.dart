import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Pastikan nama file ini sesuai dengan yang ada di komputer Anda
// Sebelumnya Anda memakai DetailScreen.dart (D besar), jika error ubah sesuai nama file Anda.
import 'package:bali_travel/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // 1. Ini adalah fungsi utama yang tidak boleh hilang (Widget build)
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildCategories(),
              const SizedBox(height: 30),
              _buildSectionTitle(title: 'Popular', showSeeAll: true),
              const SizedBox(height: 15),
              _buildPopularList(context, size),
              const SizedBox(height: 30),
              _buildSectionTitle(title: 'Recommended', showSeeAll: false),
              const SizedBox(height: 15),
              _buildRecommendedList(context, size),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  // 2. Fungsi-fungsi pembantu (Helper Widgets)
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bali Travel',
            style: GoogleFonts.montserrat(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF232323),
            ),
          ),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.blueAccent, size: 18),
              const SizedBox(width: 4),
              Text(
                'Bali, Indonesia',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            hintText: 'Find things to do',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            _buildCategoryItem('Location', isSelected: true),
            _buildCategoryItem('Hotels'),
            _buildCategoryItem('Food'),
            _buildCategoryItem('Adventure'),
            _buildCategoryItem('Activities'),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: isSelected ? null : Border.all(color: Colors.grey[200]!),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[500],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle({required String title, required bool showSeeAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF232323),
            ),
          ),
          if (showSeeAll)
            const Text(
              'See all',
              style: TextStyle(color: Colors.blueAccent, fontSize: 14),
            ),
        ],
      ),
    );
  }

  Widget _buildPopularList(BuildContext context, Size size) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildPopularCard(
              imageUrl: 'assets/images/bali handara.jpg',
              title: 'Bali Handara',
              rating: '4.1',
              size: size,
              context: context, // Mengirim context untuk navigasi
            );
          } else {
            return _buildPopularCard(
              imageUrl: 'assets/images/danau.jpg',
              title: 'Batur Lake',
              rating: '4.5',
              size: size,
              context: context, // Mengirim context untuk navigasi
            );
          }
        },
      ),
    );
  }

  // 3. Komponen Kartu Populer (Sudah dilengkapi GestureDetector)
  Widget _buildPopularCard({
    required String imageUrl,
    required String title,
    required String rating,
    required Size size,
    required BuildContext context, // Menerima context untuk navigasi
  }) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke DetailScreen saat kartu ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          width: size.width * 0.45,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(imageUrl, fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedList(BuildContext context, Size size) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildRecommendedCard(
              imageUrl: 'assets/images/lovina.jpg',
              title: 'Lovina',
              details: '2N/3D',
              size: size,
            );
          } else {
            return _buildRecommendedCard(
              imageUrl: 'assets/images/ubud.jpg',
              title: 'Ubud',
              details: '6N/7D',
              size: size,
            );
          }
        },
      ),
    );
  }

  Widget _buildRecommendedCard({
    required String imageUrl,
    required String title,
    required String details,
    required Size size,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A4A4A),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        details,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF232323),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavbar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}