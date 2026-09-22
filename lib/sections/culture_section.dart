import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class CultureSection extends StatelessWidget {
  const CultureSection({super.key});

  static const _layers = [
    {
      'icon': '🐭',
      'title': 'DEGOPLAY',
      'badge': 'CORE',
      'desc': 'The central brand and community uniting players, creators, and believers worldwide.',
      'color': 0xFF7C3AED,
    },
    {
      'icon': '🪙',
      'title': '\$DEGO',
      'badge': 'TOKEN',
      'desc': 'The native ecosystem token powering access, rewards, and on-chain participation.',
      'color': 0xFF9333EA,
    },
    {
      'icon': '👥',
      'title': 'DEGOPLAY FAM',
      'badge': 'COMMUNITY',
      'desc': 'Our passionate global community bringing together creators, builders, traders, and enthusiasts.',
      'color': 0xFF0284C7,
    },
    {
      'icon': '🎨',
      'title': 'DEGOPLAY CREATIVE',
      'badge': 'CULTURE',
      'desc': 'Community art, memes, character lore, interactive media, and digital culture.',
      'color': 0xFFC026D3,
    },
    {
      'icon': '🛠️',
      'title': 'DEGOPLAY LABS',
      'badge': 'PRODUCTS',
      'desc': 'Future decentralized products, games, utility tools, and Web3 experiments.',
      'color': 0xFF059669,
    },
    {
      'icon': '🌍',
      'title': 'DEGOPLAY AFRICA',
      'badge': 'INITIATIVE',
      'desc': 'Community initiatives connecting African builders and local Web3 hubs with the wider world.',
      'color': 0xFFEA580C,
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
          // Header
          sectionLabel('THE ECOSYSTEM'),
          yellowDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The DEGOPLAY Ecosystem',
                      style: headingStyle(size: 36),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'DEGOPLAY is designed to grow in layers — starting with strong community culture and expanding into digital experiences, products, and global initiatives.',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: kTextMuted,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),

          // Layer Grid
          _LayerGrid(layers: _layers, isWide: isWide),
        ],
      ),
    );
  }
}

class _LayerGrid extends StatelessWidget {
  final List<Map<String, dynamic>> layers;
  final bool isWide;

  const _LayerGrid({required this.layers, required this.isWide});

  @override
  Widget build(BuildContext context) {
    if (isWide) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.45,
        ),
        itemCount: layers.length,
        itemBuilder: (context, index) => _LayerCard(layer: layers[index]),
      );
    } else {
      return Column(
        children: layers
            .map(
              (l) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _LayerCard(layer: l),
              ),
            )
            .toList(),
      );
    }
  }
}

class _LayerCard extends StatefulWidget {
  final Map<String, dynamic> layer;
  const _LayerCard({required this.layer});

  @override
  State<_LayerCard> createState() => _LayerCardState();
}

class _LayerCardState extends State<_LayerCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Color(widget.layer['color'] as int);

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
            color: _hovered ? color.withOpacity(0.6) : kBorderColor,
            width: _hovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered ? color.withOpacity(0.15) : Colors.black.withOpacity(0.03),
              blurRadius: _hovered ? 20 : 8,
              offset: Offset(0, _hovered ? 8 : 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.layer['icon'] as String, style: const TextStyle(fontSize: 32)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: color.withOpacity(0.4)),
                  ),
                  child: Text(
                    widget.layer['badge'] as String,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: color,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              widget.layer['title'] as String,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.layer['desc'] as String,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: kTextMuted,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
