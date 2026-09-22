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
      color: kOffWhite,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 80,
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _AboutLeft()),
                const SizedBox(width: 50),
                Expanded(flex: 5, child: _AboutRight()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AboutLeft(),
                const SizedBox(height: 48),
                _AboutRight(),
              ],
            ),
    );
  }
}

class _AboutLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionLabel('ABOUT DEGOPLAY'),
        yellowDivider(),
        Text(
          'What is DEGOPLAY?',
          style: headingStyle(size: 36),
        ),
        const SizedBox(height: 20),
        Text(
          'DEGOPLAY is a community-focused Web3 project created to bring people together around digital culture, entertainment, blockchain technology, and decentralized communities.',
          style: GoogleFonts.inter(
            fontSize: 15,
            color: kTextMuted,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'The project aims to build more than a token. DEGOPLAY is designed as an ecosystem where community members can participate, create, connect, and contribute.',
          style: GoogleFonts.inter(
            fontSize: 15,
            color: kTextMuted,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 20),

        // Philosophy highlight box
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: kPurpleSoft,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kPurple.withOpacity(0.35)),
          ),
          child: Row(
            children: [
              const Text('💡 ', style: TextStyle(fontSize: 20)),
              Expanded(
                child: Text(
                  'Our philosophy is simple: Build together. Grow together.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: kPurpleDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'DEGOPLAY starts with community and gradually expands into products, partnerships, digital experiences, and other Web3 initiatives.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: kTextMuted,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),

        // Tags
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _TagChip('COMMUNITY'),
            _TagChip('CULTURE'),
            _TagChip('WEB3 ECOSYSTEM'),
            _TagChip('AFRICA TO WORLD'),
          ],
        ),
      ],
    );
  }
}

class _AboutRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vision Section
          Row(
            children: [
              const Text('🌍 ', style: TextStyle(fontSize: 22)),
              Text(
                'Our Vision',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: kTextDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'To create a globally recognized African-born Web3 brand that connects communities across borders.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: kTextMuted,
              height: 1.6,
            ),
          ),
          const Divider(color: kBorderColor, height: 32),

          // Mission Section
          Row(
            children: [
              const Text('🚀 ', style: TextStyle(fontSize: 22)),
              Text(
                'Our Mission',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: kTextDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _MissionItem('Build an active and welcoming community.'),
          _MissionItem('Create useful Web3 products and experiences.'),
          _MissionItem('Encourage creativity and participation.'),
          _MissionItem('Develop a recognizable global brand.'),
          _MissionItem('Make the ecosystem increasingly useful over time.'),

          const SizedBox(height: 24),

          // Visual Bottom: Mascot & Dose Up Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 180,
                  child: Image.asset(
                    'assets/images/ed.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              _DoseUpBadge(),
            ],
          ),
        ],
      ),
    );
  }
}

class _MissionItem extends StatelessWidget {
  final String text;
  const _MissionItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 10),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: kPurple,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: kTextMuted,
                height: 1.5,
              ),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: kPurpleSoft,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: kPurple.withOpacity(0.25)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: kPurpleDark,
          letterSpacing: 1.2,
        ),
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
        onTap: () => openUrl('https://dexscreener.com/bsc/0xad9684bc26780176fcb39b0d6749904a5dc2f3dc'),
        child: AnimatedScale(
          scale: _hovered ? 1.06 : 1.0,
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
              width: 110,
              height: 110,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
