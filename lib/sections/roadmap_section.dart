import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class RoadmapSection extends StatelessWidget {
  const RoadmapSection({super.key});

  static const _phases = [
    {
      'num': '01',
      'title': 'Dose 01\nBirth',
      'desc': 'Launch, build the foundation, grow the community.',
    },
    {
      'num': '02',
      'title': 'Dose 02\nCommunity',
      'desc': 'More members, more voices, more DANA.',
    },
    {
      'num': '03',
      'title': 'Dose 03\nGrowth',
      'desc': 'Listings, partnerships, more utility, bigger visibility.',
    },
    {
      'num': '04',
      'title': 'Dose 04\nGlobal Dose',
      'desc': 'Take DANA worldwide. Become a recognized crypto brand.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: kBlack,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 280,
                      child: _RoadmapLeft(),
                    ),
                    const SizedBox(width: 48),
                    Expanded(child: _PhaseCards(phases: _phases)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _RoadmapLeft(),
                    const SizedBox(height: 40),
                    _PhaseCards(phases: _phases),
                  ],
                ),
        ],
      ),
    );
  }
}

class _RoadmapLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionLabel('Roadmap'),
        yellowDivider(),
        Text(
          'The Journey\nAhead.',
          style: headingStyle(size: 36),
        ),
        const SizedBox(height: 16),
        Text(
          "We're just getting started. Here's how we're building the DANA movement, step by step.",
          style: bodyStyle(),
        ),
      ],
    );
  }
}

class _PhaseCards extends StatelessWidget {
  final List<Map<String, String>> phases;
  const _PhaseCards({required this.phases});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    return isWide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: phases
                .asMap()
                .entries
                .map((e) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: e.key == 0 ? 0 : 12,
                        ),
                        child: _PhaseCard(
                          data: e.value,
                          index: e.key,
                          isActive: e.key == 0,
                        ),
                      ),
                    ))
                .toList(),
          )
        : Column(
            children: phases
                .asMap()
                .entries
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _PhaseCard(
                        data: e.value,
                        index: e.key,
                        isActive: e.key == 0,
                      ),
                    ))
                .toList(),
          );
  }
}

class _PhaseCard extends StatefulWidget {
  final Map<String, String> data;
  final int index;
  final bool isActive;

  const _PhaseCard({
    required this.data,
    required this.index,
    required this.isActive,
  });

  @override
  State<_PhaseCard> createState() => _PhaseCardState();
}

class _PhaseCardState extends State<_PhaseCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.isActive || _hovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: active ? kYellow.withOpacity(0.08) : kDarkGray,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: active ? kYellow.withOpacity(0.5) : Colors.white.withOpacity(0.07),
            width: active ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phase number badge
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: kYellow,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  widget.data['num']!,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: kBlack,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              widget.data['title']!,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: kWhite,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.data['desc']!,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.white54,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
