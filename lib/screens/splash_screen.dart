import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bali_travel/screens/home_screen.dart';
// Import layar home Anda nanti di sini

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Gambar Latar Belakang
          Image.asset('assets/images/Bali.jpg', fit: BoxFit.cover),

          // 2. Teks Judul (Aspen) di atas
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Bali \n Travel',
                textAlign:TextAlign.center,
                style: GoogleFonts.caveat(
                  // Contoh font script
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
          ),

          // 3. Konten Bawah (Teks & Tombol)
          Positioned(
            bottom: 40,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plan your',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Luxurious\nVacation',
                  style: GoogleFonts.montserrat(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 24),
                // Tombol Explore
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent, // Warna tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      // Navigasi ke Layar Home
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      'Explore',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
