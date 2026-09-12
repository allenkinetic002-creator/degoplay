import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class FooterSection extends StatelessWidget {
  final Function(double)? onNavTap;
  const FooterSection({super.key, this.onNavTap});

  static const _navMap = {
    'Home': 0.0,
    'About': 700.0,
    'Token': 1400.0,
    'Roadmap': 2000.0,
    'Community': 2600.0,
  };

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFF080808),
      child: Column(
        children: [
          // Top footer
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 60 : 24,
              vertical: 40,
            ),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _FooterBrand(onTap: () => onNavTap?.call(0.0)),
                      const Spacer(),
                      _FooterNav(navMap: _navMap, onNavTap: onNavTap),
                      const SizedBox(width: 60),
                      _FooterSocials(),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _FooterBrand(onTap: () => onNavTap?.call(0.0)),
                      const SizedBox(height: 32),
                      _FooterNav(navMap: _navMap, onNavTap: onNavTap),
                      const SizedBox(height: 32),
                      _FooterSocials(),
                    ],
                  ),
          ),

          // Divider
          Container(
            height: 1,
            color: Colors.white.withOpacity(0.06),
          ),

          // Bottom bar
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 60 : 24,
              vertical: 20,
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 10,
              children: [
                Text(
                  '© 2025 DANA COIN. All rights reserved.',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white24,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('✨ ', style: TextStyle(fontSize: 12)),
                    Text(
                      'A Dose of Crypto Culture.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: kYellow.withOpacity(0.6),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  final VoidCallback? onTap;
  const _FooterBrand({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Image.asset(
              'assets/images/dana3.png',
              height: 38,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'A Dose of Crypto Culture.',
          style: GoogleFonts.inter(
            fontSize: 13,
            color: Colors.white38,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 16),
        // BNB Chain badge
        Row(
          children: [
            Image.asset(
              'assets/images/bnb.png',
              height: 20,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterNav extends StatelessWidget {
  final Map<String, double> navMap;
  final Function(double)? onNavTap;
  const _FooterNav({required this.navMap, this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: navMap.entries
          .map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _FooterLink(
                label: entry.key,
                onTap: () => onNavTap?.call(entry.value),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  const _FooterLink({required this.label, this.onTap});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: _hovered ? kYellow : Colors.white38,
            fontWeight: _hovered ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _FooterSocials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Community & Links',
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white54,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _SocialChipImg(imageAsset: 'assets/images/telegram.png', label: 'Telegram', url: 'https://t.me/SCF_Degens'),
            _SocialChipX(),
            _SocialChipImg(imageAsset: 'assets/images/whatsapp.png', label: 'WhatsApp', url: 'https://chat.whatsapp.com/Gpd3q6d02FwIkFM1FOCf7W'),
            _SocialChip(icon: Icons.bar_chart_rounded, label: 'DexScreener', url: 'https://dexscreener.com/bsc/0xf471d46afdc6b29726d6e32e81b6ccc604f48129'),
          ],
        ),
      ],
    );
  }
}

class _SocialChip extends StatefulWidget {
  final IconData icon;
  final String label;
  final String? url;
  const _SocialChip({required this.icon, required this.label, this.url});

  @override
  State<_SocialChip> createState() => _SocialChipState();
}

class _SocialChipState extends State<_SocialChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          if (widget.url != null) {
            openUrl(widget.url!);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? kYellow.withOpacity(0.12) : const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? kYellow.withOpacity(0.4) : Colors.white12,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: _hovered ? kYellow : Colors.white54, size: 16),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: _hovered ? kYellow : Colors.white54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialChipX extends StatefulWidget {
  @override
  State<_SocialChipX> createState() => _SocialChipXState();
}

class _SocialChipXState extends State<_SocialChipX> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => openUrl('https://x.com/ardanadose'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? kYellow.withOpacity(0.12) : const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? kYellow.withOpacity(0.4) : Colors.white12,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: _hovered ? 1.0 : 0.7,
                child: Image.asset(
                  'assets/images/x.png',
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Twitter',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: _hovered ? kYellow : Colors.white54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialChipImg extends StatefulWidget {
  final String imageAsset;
  final String label;
  final String? url;
  const _SocialChipImg({required this.imageAsset, required this.label, this.url});

  @override
  State<_SocialChipImg> createState() => _SocialChipImgState();
}

class _SocialChipImgState extends State<_SocialChipImg> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          if (widget.url != null) {
            openUrl(widget.url!);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? kYellow.withOpacity(0.12) : const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? kYellow.withOpacity(0.4) : Colors.white12,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.imageAsset,
                width: 16,
                height: 16,
                fit: BoxFit.contain,
                color: _hovered ? kYellow : Colors.white54,
              ),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: _hovered ? kYellow : Colors.white54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
