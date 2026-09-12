import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

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
      constraints: const BoxConstraints(minHeight: 640),
      decoration: const BoxDecoration(
        color: kBlack,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 60 : 24,
              vertical: 60,
            ),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 5, child: _LeftContent(fadeAnim: _fadeAnim)),
                      const SizedBox(width: 40),
                      const Expanded(
                        flex: 5,
                        child: _MascotImage(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _LeftContent(fadeAnim: _fadeAnim),
                      const SizedBox(height: 40),
                      const _MascotImage(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _LeftContent extends StatelessWidget {
  final Animation<double> fadeAnim;
  const _LeftContent({required this.fadeAnim});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnim,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // DANA Hero Graphic Title
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370, maxHeight: 185),
            child: Image.asset(
              'assets/images/dana4.png',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
          const SizedBox(height: 20),

          // Description
          Text(
            'DANA is a community-driven token on BNB Chain\nbuilt around fun, participation, and a growing\nglobal community.',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: Colors.white60,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 36),

          // CTA Buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _HeroCTA(
                label: 'Buy \$DANA  →',
                isPrimary: true,
                onTap: () => openUrl('https://dexscreener.com/bsc/0xf471d46afdc6b29726d6e32e81b6ccc604f48129'),
              ),
              _HeroCTA(
                label: 'Join Community',
                iconAsset: 'assets/images/face.png',
                isPrimary: false,
                onTap: () => openUrl('https://www.whatsapp.com/channel/0029Vb8U9vT6hENyFyYDo61u'),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // BNB Chain badge
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24, width: 1.2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.06),
                ),
                child: Image.asset(
                  'assets/images/bnb.png',
                  height: 44,
                  fit: BoxFit.contain,
                ),
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
        children: [
          // Glow behind mascot
          Container(
            width: 420,
            height: 420,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  kYellow.withOpacity(0.18),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // DANA Mascot
          Image.asset(
            'assets/images/dana1.png',
            fit: BoxFit.contain,
          ),
          // DANA Graffiti stickers beside mascot
          Positioned.fill(
            child: Image.asset(
              'assets/images/dana2.png',
              fit: BoxFit.contain,
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
          constraints: const BoxConstraints(minHeight: 52),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered ? Colors.amber : kYellow)
                : Colors.transparent,
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : Colors.white.withOpacity(_hovered ? 0.5 : 0.25),
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
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 10),
              ],
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: widget.isPrimary ? kBlack : kWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
