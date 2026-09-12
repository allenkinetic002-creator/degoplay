import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class VisionSection extends StatelessWidget {
  const VisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFF111111),
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 80,
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _LeftVision()),
                const SizedBox(width: 60),
                Expanded(flex: 5, child: _RightVision()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LeftVision(),
                const SizedBox(height: 48),
                _RightVision(),
              ],
            ),
    );
  }
}

class _LeftVision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionLabel('Our Vision'),
        yellowDivider(),
        Text(
          'A Global Community\nDriven by Culture.',
          style: headingStyle(size: 38),
        ),
        const SizedBox(height: 20),
        Text(
          'Our vision is to make DANA a global community-driven crypto brand built around culture, creativity, and participation — where everyone gets a dose of DANA.',
          style: bodyStyle(),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            _TagChip('CULTURE'),
            const SizedBox(width: 8),
            _TagChip('CREATIVITY'),
            const SizedBox(width: 8),
            _TagChip('COMMUNITY'),
          ],
        ),
      ],
    );
  }
}

class _RightVision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: kDarkGray,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionLabel('What is DANA?'),
                const SizedBox(height: 12),
                Text(
                  'More Than a Token.',
                  style: headingStyle(size: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  'DANA is a community-powered token on BNB Chain created to bring people together around a simple idea: everyone needs a dose of DANA.',
                  style: bodyStyle(size: 15),
                ),
                const SizedBox(height: 24),
                _DoseUpBadge(),
              ],
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 240,
            height: 260,
            child: Image.asset(
              'assets/images/ed.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  const _TagChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Colors.white38,
        letterSpacing: 1.5,
      ),
    );
  }
}

class _DoseUpBadge extends StatefulWidget {
  @override
  State<_DoseUpBadge> createState() => _DoseUpBadgeState();
}

class _DoseUpBadgeState extends State<_DoseUpBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => openUrl('https://dexscreener.com/bsc/0xf471d46afdc6b29726d6e32e81b6ccc604f48129'),
        child: AnimatedScale(
          scale: _hovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 180),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: kYellow.withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : [],
            ),
            child: Image.asset(
              'assets/images/dose_up.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
