import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sections/navbar.dart';
import 'sections/hero_section.dart';
import 'sections/vision_section.dart';
import 'sections/culture_section.dart';
import 'sections/token_section.dart';
import 'sections/roadmap_section.dart';
import 'sections/cta_section.dart';
import 'sections/footer_section.dart';

void main() {
  runApp(const DanaApp());
}

class DanaApp extends StatelessWidget {
  const DanaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DANA Coin – A Dose of Crypto Culture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFFD700),
          surface: const Color(0xFF0D0D0D),
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
      ),
      home: const DanaHomePage(),
    );
  }
}

class DanaHomePage extends StatefulWidget {
  const DanaHomePage({super.key});

  @override
  State<DanaHomePage> createState() => _DanaHomePageState();
}

class _DanaHomePageState extends State<DanaHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage('assets/images/dana4.png'), context);
    precacheImage(const AssetImage('assets/images/dana_coin.jpg'), context);
    precacheImage(const AssetImage('assets/images/face.png'), context);
    precacheImage(const AssetImage('assets/images/bnb.png'), context);
    precacheImage(const AssetImage('assets/images/x.png'), context);
    precacheImage(const AssetImage('assets/images/telegram.png'), context);
    precacheImage(const AssetImage('assets/images/whatsapp.png'), context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 70),
                const HeroSection(),
                const VisionSection(),
                const CultureSection(),
                const TokenSection(),
                const RoadmapSection(),
                const CtaSection(),
                FooterSection(onNavTap: scrollToSection),
              ],
            ),
          ),
          NavBar(onNavTap: scrollToSection),
        ],
      ),
    );
  }
}
