import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  static const _values = [
    {'icon': '🤝', 'title': 'Respect', 'desc': 'Everyone has a place in the community.'},
    {'icon': '🌍', 'title': 'Global Thinking', 'desc': 'Our roots may be African, but our community is global.'},
    {'icon': '💡', 'title': 'Creativity', 'desc': 'Memes, art, ideas, products and experiments all have a place.'},
    {'icon': '🚀', 'title': 'Building', 'desc': 'We want to build things rather than simply talk about them.'},
    {'icon': '🔎', 'title': 'Transparency', 'desc': 'Important project information is easy to find and verify.'},
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: kPurple,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 70,
      ),
      child: Column(
        children: [
          // Top row with mascots and main CTA
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Mascot
                    SizedBox(
                      width: 280,
                      height: 180,
                      child: Image.asset(
                        'assets/images/dana5.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Spacer(),
                    // Center content
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          Text(
                            'DEGOPLAY FAM 🐭',
                            style: GoogleFonts.inter(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'DEGOPLAY belongs to its community.\nOur community brings together creators, developers, traders, artists, Web3 enthusiasts, builders, and people simply interested in being part of something new.',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.9),
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          _CtaBtn(
                            onTap: () => openUrl('https://x.com/DegoPlaay'),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // Right badges
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/meat.png',
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 12),
                        Image.asset(
                          'assets/images/danafam.png',
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      width: 240,
                      height: 140,
                      child: Image.asset(
                        'assets/images/dana5.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'DEGOPLAY FAM 🐭',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'DEGOPLAY belongs to its community.\nOur community brings together creators, developers, traders, artists, Web3 enthusiasts, and builders.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _CtaBtn(
                      onTap: () => openUrl('https://x.com/DegoPlaay'),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/danafam.png',
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),

          const SizedBox(height: 48),

          // Community Values cards
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: kPurpleDark,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('🤝 ', style: TextStyle(fontSize: 20)),
                    Text(
                      'Our Community Values',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: kPurpleLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _values
                            .map(
                              (v) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: _ValueItem(
                                    icon: v['icon']!,
                                    title: v['title']!,
                                    desc: v['desc']!,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : Column(
                        children: _values
                            .map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: _ValueItem(
                                  icon: v['icon']!,
                                  title: v['title']!,
                                  desc: v['desc']!,
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueItem extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;

  const _ValueItem({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: Colors.white.withOpacity(0.8),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _CtaBtn extends StatefulWidget {
  final VoidCallback onTap;
  const _CtaBtn({required this.onTap});

  @override
  State<_CtaBtn> createState() => _CtaBtnState();
}

class _CtaBtnState extends State<_CtaBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered ? kPurpleSoft : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_hovered ? 0.25 : 0.15),
                blurRadius: _hovered ? 20 : 10,
                offset: Offset(0, _hovered ? 8 : 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/face.png',
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Text(
                'Join DEGOPLAY FAM  →',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kPurpleDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
