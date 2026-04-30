import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Destination Image and Top Buttons
          Stack(
            clipBehavior: Clip.none, // Allow favorite icon to overflow
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Image.asset('assets/images/bali handara.jpg', fit: BoxFit.cover),
                ),
              ),
              
              // Back Button
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              
              // Favorite Button
              Positioned(
                bottom: -20,
                right: 24,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: const Icon(Icons.favorite, color: Colors.redAccent, size: 24),
                ),
              ),
            ],
          ),

          // Scrollable Detail Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bali Handara', style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Show Map', style: GoogleFonts.roboto(fontSize: 14, color: Colors.blueAccent, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 12),
                
                Text(
                  'Tempat wisata ikonik di Bali dengan gerbang khas dan pemandangan pegunungan yang indah.',
                  style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey[600], height: 1.5),
                ),
                const SizedBox(height: 24),
                
                Text('Facilities', style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                
                // Facilities Image
                Image.asset('assets/images/amenities.png', fit: BoxFit.contain),
              ],
            ),
          ),

          // Fixed Bottom Action Bar
          Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$199', style: GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text('Book Now', style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}