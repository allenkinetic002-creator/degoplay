import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: kYellow,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 70,
      ),
      child: isWide
          ? Row(
              children: [
                // Mascot
                SizedBox(
                  width: 220,
                  height: 240,
                  child: Image.asset(
                    'assets/images/dana5.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),
                // Center content
                Column(
                  children: [
                    Image.asset(
                      'assets/images/ready.png',
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Join the DANA community and be part of something bigger.',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: kBlack.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    _CtaBtn(
                      onTap: () => openUrl('https://www.whatsapp.com/channel/0029Vb8U9vT6hENyFyYDo61u'),
                    ),
                  ],
                ),
                const Spacer(),
                // Right badge
                Column(
                  children: [
                    Image.asset(
                      'assets/images/meat.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    Image.asset(
                      'assets/images/danafam.png',
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  width: 160,
                  height: 180,
                  child: Image.asset(
                    'assets/images/dana5.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/images/ready.png',
                  height: 85,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                Text(
                  'Join the DANA community and be part of something bigger.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: kBlack.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                _CtaBtn(
                  onTap: () => openUrl('https://www.whatsapp.com/channel/0029Vb8U9vT6hENyFyYDo61u'),
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
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xFF1A1A1A) : kBlack,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: kBlack.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/face.png',
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Text(
                'Join Community  →',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kYellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
