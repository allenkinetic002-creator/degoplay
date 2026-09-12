import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class CultureSection extends StatelessWidget {
  const CultureSection({super.key});

  static const _pillars = [
    {
      'image': 'assets/images/kodak.png',
      'title': 'Network',
      'desc': 'Real connections.\nWorldwide presence.',
    },
    {
      'image': 'assets/images/kodak1.png',
      'title': 'Humor',
      'desc': 'Great energy.\nEndless laughter.',
    },
    {
      'image': 'assets/images/kodak2.png',
      'title': 'Expression',
      'desc': 'Imagination. Ideas.\nInspiration.',
    },
    {
      'image': 'assets/images/kodak3.png',
      'title': 'Engagement',
      'desc': 'Everyone has a role\nto play.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0D0D0D),
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 80,
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 4, child: _CultureLeft()),
                const SizedBox(width: 60),
                Expanded(
                  flex: 6,
                  child: _PillarGrid(pillars: _pillars),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CultureLeft(),
                const SizedBox(height: 48),
                _PillarGrid(pillars: _pillars),
              ],
            ),
    );
  }
}

class _CultureLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // F- Character illustration behind text
        Positioned(
          right: -20,
          top: -10,
          bottom: -20,
          child: IgnorePointer(
            child: Opacity(
              opacity: 0.22,
              child: Image.asset(
                'assets/images/f_minus.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionLabel('The DANA Culture'),
            yellowDivider(),
            Text(
              'Built by People.\nPowered by Community.',
              style: headingStyle(size: 36),
            ),
            const SizedBox(height: 20),
            Text(
              'DANA is more than a token — it\'s a culture. We\'re here for the memes, the creativity, and the people who make it all happen.',
              style: bodyStyle(),
            ),
          ],
        ),
      ],
    );
  }
}

class _PillarGrid extends StatelessWidget {
  final List<Map<String, String>> pillars;
  const _PillarGrid({required this.pillars});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final int crossAxisCount = width > 950 ? 4 : (width > 550 ? 2 : 1);
    final double aspectRatio = width > 950 ? 0.72 : (width > 550 ? 0.9 : 1.2);
    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: aspectRatio,
      children: pillars.map((p) => _PillarCard(p)).toList(),
    );
  }
}

class _PillarCard extends StatefulWidget {
  final Map<String, String> data;
  const _PillarCard(this.data);

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: const Color(0xFF161616),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? kYellow.withOpacity(0.5)
                  : Colors.white.withOpacity(0.06),
              width: _hovered ? 2 : 1,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: kYellow.withOpacity(0.15),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                // Image fills the top portion
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      widget.data['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Title & description at the bottom
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF1A1A1A),
                        Color(0xFF111111),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.data['title']!,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kYellow,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.data['desc']!,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: Colors.white54,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
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
}
