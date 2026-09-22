import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class RoadmapSection extends StatelessWidget {
  const RoadmapSection({super.key});

  static const _phases = [
    {
      'num': '01',
      'title': 'PHASE 01\nTHE BEGINNING',
      'subtitle': 'Foundation',
      'goal': '🐭 Goal: Create the foundation.',
      'items': [
        'DEGOPLAY brand creation',
        'Website launch',
        'Community channels & presence',
        'Token development & deployment',
        'Smart contract verification',
        'Initial community campaigns',
        'Whitepaper release',
      ],
      'active': true,
    },
    {
      'num': '02',
      'title': 'PHASE 02\nCOMMUNITY',
      'subtitle': 'Build the Family',
      'goal': '🌍 Goal: Turn followers into an active community.',
      'items': [
        'Community events & X Spaces',
        'Creative campaigns & contests',
        'Memes and digital content hub',
        'Contributor & ambassador program',
        'Web3 community partnerships',
      ],
      'active': false,
    },
    {
      'num': '03',
      'title': 'PHASE 03\nECOSYSTEM',
      'subtitle': 'Build the DEGOPLAY World',
      'goal': '🚀 Goal: Give the community something to use.',
      'items': [
        'DEGOPLAY ecosystem portal',
        'Community dashboard',
        'Token utility features',
        'Digital collectibles & NFTs',
        'Community reward system',
        'Partner integrations & tools',
      ],
      'active': false,
    },
    {
      'num': '04',
      'title': 'PHASE 04\nEXPANSION',
      'subtitle': 'Africa → Global',
      'goal': '🌎 Goal: Take DEGOPLAY into a global Web3 brand.',
      'items': [
        'International community expansion',
        'Major ecosystem partnerships',
        'Additional blockchain integrations',
        'Developer & community grants',
        'Global campaigns & initiatives',
        'New DEGOPLAY products',
      ],
      'active': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: kWhite,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionLabel('ROADMAP'),
          yellowDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Development Roadmap',
                      style: headingStyle(size: 36),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Concrete targets for building a sustainable, long-term Web3 ecosystem.',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: kTextMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),

          // Phase Cards
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _phases
                      .map(
                        (p) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _PhaseCard(phase: p),
                          ),
                        ),
                      )
                      .toList(),
                )
              : Column(
                  children: _phases
                      .map(
                        (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _PhaseCard(phase: p),
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}

class _PhaseCard extends StatefulWidget {
  final Map<String, dynamic> phase;
  const _PhaseCard({required this.phase});

  @override
  State<_PhaseCard> createState() => _PhaseCardState();
}

class _PhaseCardState extends State<_PhaseCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.phase['active'] as bool;
    final items = widget.phase['items'] as List<String>;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _hovered ? kWhite : kOffWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive
                ? kPurple
                : (_hovered ? kPurpleLight : kBorderColor),
            width: isActive ? 1.8 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? kPurple.withOpacity(0.12)
                  : (_hovered ? Colors.black.withOpacity(0.06) : Colors.black.withOpacity(0.02)),
              blurRadius: _hovered || isActive ? 18 : 6,
              offset: Offset(0, _hovered || isActive ? 6 : 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.phase['num'] as String,
                  style: GoogleFonts.inter(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: isActive ? kPurple : Colors.black26,
                  ),
                ),
                if (isActive)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: kPurpleSoft,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: kPurpleLight),
                    ),
                    child: Text(
                      'IN PROGRESS',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: kPurpleDark,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),

            // Phase Title
            Text(
              widget.phase['title'] as String,
              style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: kTextDark,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.phase['subtitle'] as String,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: kPurpleDark,
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: kBorderColor),
            const SizedBox(height: 12),

            // Items
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: TextStyle(color: isActive ? kPurple : Colors.black38),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: kTextMuted,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),
            Divider(color: kBorderColor),
            const SizedBox(height: 8),

            // Goal
            Text(
              widget.phase['goal'] as String,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isActive ? kPurpleDark : kTextMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
