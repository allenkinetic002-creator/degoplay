import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onExploreTap;
  const HeroSection({super.key, this.onExploreTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeCtrl;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
    _fadeCtrl.forward();
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kBlack,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 60 : 24,
          vertical: 50,
        ),
        child: Column(
          children: [
            // Top Hero Row
            isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _LeftContent(
                          fadeAnim: _fadeAnim,
                          onExploreTap: widget.onExploreTap,
                        ),
                      ),
                      const SizedBox(width: 40),
                      const Expanded(
                        flex: 5,
                        child: _MascotImage(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _LeftContent(
                        fadeAnim: _fadeAnim,
                        onExploreTap: widget.onExploreTap,
                      ),
                      const SizedBox(height: 40),
                      const _MascotImage(),
                    ],
                  ),

            const SizedBox(height: 60),

            // Why DEGOPLAY Feature Section
            _WhyDegoplaySection(isWide: isWide),
          ],
        ),
      ),
    );
  }
}

class _LeftContent extends StatelessWidget {
  final Animation<double> fadeAnim;
  final VoidCallback? onExploreTap;
  const _LeftContent({required this.fadeAnim, this.onExploreTap});

  void _showWhitepaperDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Text('🐭 ', style: TextStyle(fontSize: 24)),
            Text(
              'DEGOPLAY Whitepaper',
              style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: kTextDark),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'One Community. One Ecosystem. One Journey.',
              style: GoogleFonts.inter(color: kPurple, fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              'The official DEGOPLAY Whitepaper detailing our full vision, BEP-20 tokenomics, ecosystem utility layers, and global roadmap will be released during Phase 01.\n\nJoin our community channels to participate in the early contributor program and receive the first release.',
              style: GoogleFonts.inter(color: kTextMuted, fontSize: 13, height: 1.6),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Close', style: GoogleFonts.inter(color: kTextMuted)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
              openUrl('https://x.com/DegoPlaay');
            },
            child: const Text('Join Community'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnim,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tagline badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: kYellow.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kYellow.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🌍 ', style: TextStyle(fontSize: 14)),
                Text(
                  'From Africa to the World.',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kYellow,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Hero Graphic Title
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440, maxHeight: 150),
            child: Image.asset(
              'assets/images/fa.png',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
          const SizedBox(height: 18),

          // Core Description
          Text(
            'A community-driven Web3 ecosystem built around culture, creativity, entertainment, and decentralized participation.\n\nDEGOPLAY brings people together through community, digital culture, blockchain technology, and an ecosystem designed to grow with its members.',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: kTextMuted,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),

          // Short Tagline
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: kPurpleSoft,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kPurple.withOpacity(0.25)),
            ),
            child: Text(
              'One Community. One Ecosystem. One Journey.',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: kPurpleDark,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // CTA Buttons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _HeroCTA(
                label: 'Explore DEGOPLAY  ↓',
                isPrimary: true,
                onTap: onExploreTap ?? () => openUrl('https://dexscreener.com/bsc/0xad9684bc26780176fcb39b0d6749904a5dc2f3dc'),
              ),
              _HeroCTA(
                label: 'Join Community',
                iconAsset: 'assets/images/face.png',
                isPrimary: false,
                onTap: () => openUrl('https://x.com/DegoPlaay'),
              ),
              _HeroCTA(
                label: 'Read Whitepaper',
                isPrimary: false,
                onTap: () => _showWhitepaperDialog(context),
              ),
            ],
          ),
          const SizedBox(height: 36),

          // BNB Chain badge & BSC Wallet
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor, width: 1.2),
                  borderRadius: BorderRadius.circular(10),
                  color: kOffWhite,
                ),
                child: Image.asset(
                  'assets/images/bnb.png',
                  height: 34,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'BEP-20 on BNB Chain',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kTextMuted,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 3),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => openUrl('https://bscscan.com/address/0x04f0a170F95Bf48f3DA756ab9684068CcDa6485D'),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'BSC Wallet: 0x04f0...485D',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: kYellow,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.open_in_new_rounded, size: 12, color: kYellow.withOpacity(0.8)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MascotImage extends StatelessWidget {
  const _MascotImage();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 560, maxWidth: 620),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Glow behind mascot
          Container(
            width: 420,
            height: 420,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  kPurple.withOpacity(0.18),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // DEGOPLAY Primary Mascot
          Image.asset(
            'assets/images/dana1.png',
            fit: BoxFit.contain,
          ),
          // Character in cocktail glass beside mascot on the left
          Positioned(
            left: 10,
            bottom: 15,
            width: 220,
            height: 240,
            child: Image.asset(
              'assets/images/fb.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _WhyDegoplaySection extends StatelessWidget {
  final bool isWide;
  const _WhyDegoplaySection({required this.isWide});

  static const _features = [
    {
      'icon': '🌍',
      'title': 'Global Community',
      'desc': 'Born from an African community and built for people everywhere.',
    },
    {
      'icon': '🐭',
      'title': 'Strong Identity',
      'desc': 'DEGOPLAY has a recognizable character, culture, and community identity.',
    },
    {
      'icon': '⛓️',
      'title': 'Web3 Powered',
      'desc': 'Blockchain technology provides transparent ownership and on-chain participation.',
    },
    {
      'icon': '🤝',
      'title': 'Community First',
      'desc': "The community isn't an afterthought — it is the core of the ecosystem.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Why DEGOPLAY?',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: kTextDark,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 2,
                width: 60,
                color: kYellow,
              ),
            ],
          ),
          const SizedBox(height: 20),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _features
                      .map(
                        (f) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _FeatureCard(
                              icon: f['icon']!,
                              title: f['title']!,
                              desc: f['desc']!,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              : Column(
                  children: _features
                      .map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _FeatureCard(
                            icon: f['icon']!,
                            title: f['title']!,
                            desc: f['desc']!,
                          ),
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 26)),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: kTextDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: kTextMuted,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroCTA extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final String? iconAsset;
  final VoidCallback onTap;

  const _HeroCTA({
    required this.label,
    required this.isPrimary,
    this.iconAsset,
    required this.onTap,
  });

  @override
  State<_HeroCTA> createState() => _HeroCTAState();
}

class _HeroCTAState extends State<_HeroCTA> {
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
          constraints: const BoxConstraints(minHeight: 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered ? kPurpleDark : kPurple)
                : (_hovered ? kPurpleSoft : Colors.transparent),
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : (_hovered ? kPurple : kBorderColor),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.iconAsset != null) ...[
                Image.asset(
                  widget.iconAsset!,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: widget.isPrimary ? Colors.white : kTextDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
