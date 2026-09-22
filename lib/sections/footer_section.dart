import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class FooterSection extends StatelessWidget {
  final Function(double)? onNavTap;
  const FooterSection({super.key, this.onNavTap});

  static const _navMap = {
    'Home': 0.0,
    'About': 750.0,
    'Ecosystem': 1550.0,
    'Token': 2300.0,
    'Roadmap': 3350.0,
    'Community': 4150.0,
  };

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: kOffWhite,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Team Section
          _TeamSection(isWide: isWide),
          const SizedBox(height: 60),
          Divider(color: kBorderColor),
          const SizedBox(height: 50),

          // 2. Transparency Section
          _TransparencySection(isWide: isWide),
          const SizedBox(height: 60),
          Divider(color: kBorderColor),
          const SizedBox(height: 50),

          // 3. FAQ Section
          _FaqSection(isWide: isWide),
          const SizedBox(height: 60),
          Divider(color: kBorderColor),
          const SizedBox(height: 50),

          // 4. Main Footer Bar
          isWide
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

          const SizedBox(height: 40),
          Container(
            height: 1,
            color: kBorderColor,
          ),
          const SizedBox(height: 24),

          // Legal Disclaimer
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBorderColor),
            ),
            child: Text(
              'Disclaimer: DEGOPLAY is a community and technology project. Nothing on this website should be interpreted as financial advice, an investment offer, or a promise of financial returns. Digital assets can be volatile and may involve significant risk. Always conduct your own research (DYOR).',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: kTextMuted,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Copyright Bar
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 10,
            children: [
              Text(
                '© 2025 DEGOPLAY. All rights reserved.',
                style: GoogleFonts.inter(fontSize: 12, color: kTextMuted),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🐭 ', style: TextStyle(fontSize: 12)),
                  Text(
                    'One Community. One Ecosystem. One Journey.',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: kPurpleDark,
                      fontWeight: FontWeight.w600,
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

class _TeamSection extends StatelessWidget {
  final bool isWide;
  const _TeamSection({required this.isWide});

  static const _roles = [
    {
      'role': 'Founder & Project Lead',
      'desc': 'Building the DEGOPLAY vision and coordinating the ecosystem.',
      'icon': '👑',
    },
    {
      'role': 'Community Lead',
      'desc': 'Guiding the DEGOPLAY FAM, contributor programs, and community events.',
      'icon': '👥',
    },
    {
      'role': 'Blockchain / Dev',
      'desc': 'Smart contracts, dApps, on-chain integration, and tech infrastructure.',
      'icon': '💻',
    },
    {
      'role': 'Creative & Brand',
      'desc': 'Visual storytelling, character design, memes, and digital culture.',
      'icon': '🎨',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('👥 ', style: TextStyle(fontSize: 22)),
            Text(
              'The People Behind DEGOPLAY',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: kTextDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'DEGOPLAY is currently operated by an independent core team and community contributors. Team information and contributor rosters will continue to be published as the project develops.',
          style: GoogleFonts.inter(fontSize: 14, color: kTextMuted, height: 1.6),
        ),
        const SizedBox(height: 24),
        isWide
            ? Row(
                children: _roles
                    .map(
                      (r) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _RoleCard(
                            role: r['role']!,
                            desc: r['desc']!,
                            icon: r['icon']!,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            : Column(
                children: _roles
                    .map(
                      (r) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _RoleCard(
                          role: r['role']!,
                          desc: r['desc']!,
                          icon: r['icon']!,
                        ),
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String role;
  final String desc;
  final String icon;

  const _RoleCard({
    required this.role,
    required this.desc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 12),
          Text(
            role,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: kTextDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: GoogleFonts.inter(fontSize: 12, color: kTextMuted, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _TransparencySection extends StatelessWidget {
  final bool isWide;
  const _TransparencySection({required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🔎 ', style: TextStyle(fontSize: 22)),
              Text(
                'Transparency — Verify Everything',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: kTextDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'We believe community members should be able to independently verify important project information directly on-chain.',
            style: GoogleFonts.inter(fontSize: 14, color: kTextMuted),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              _VerifyBadge(
                label: 'BSC Wallet: 0x04f0...485D',
                icon: '💼',
                onTap: () => openUrl('https://bscscan.com/address/0x04f0a170F95Bf48f3DA756ab9684068CcDa6485D'),
              ),
              _VerifyBadge(
                label: 'BscScan Verified',
                icon: '⛓️',
                onTap: () => openUrl('https://bscscan.com/address/0x04f0a170F95Bf48f3DA756ab9684068CcDa6485D'),
              ),
              _VerifyBadge(
                label: 'DexScreener Live',
                icon: '📊',
                onTap: () => openUrl('https://dexscreener.com/bsc/0xad9684bc26780176fcb39b0d6749904a5dc2f3dc'),
              ),
              _VerifyBadge(
                label: 'PancakeSwap Pool',
                icon: '🥞',
                onTap: () => openUrl('https://dexscreener.com/bsc/0xad9684bc26780176fcb39b0d6749904a5dc2f3dc'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VerifyBadge extends StatefulWidget {
  final String label;
  final String icon;
  final VoidCallback onTap;

  const _VerifyBadge({required this.label, required this.icon, required this.onTap});

  @override
  State<_VerifyBadge> createState() => _VerifyBadgeState();
}

class _VerifyBadgeState extends State<_VerifyBadge> {
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered ? kPurpleSoft : kOffWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _hovered ? kPurple : kBorderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.icon, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _hovered ? kPurpleDark : kTextDark,
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.arrow_outward_rounded, size: 14, color: _hovered ? kPurple : kTextMuted),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqSection extends StatelessWidget {
  final bool isWide;
  const _FaqSection({required this.isWide});

  static const _faqs = [
    {
      'q': 'What is DEGOPLAY?',
      'a': 'DEGOPLAY is a community-focused Web3 ecosystem combining blockchain, digital culture, entertainment, and decentralized community participation.',
    },
    {
      'q': 'What is \$DEGO?',
      'a': '\$DEGO is the native utility token of the DEGOPLAY ecosystem, designed to support real ecosystem participation rather than relying solely on speculation.',
    },
    {
      'q': 'What blockchain is DEGOPLAY on?',
      'a': 'DEGOPLAY operates on BNB Chain (BEP-20) offering fast transaction speeds and ultra-low gas fees for our global community.',
    },
    {
      'q': 'What is the total supply?',
      'a': 'The total supply is fixed and verifiable on the official smart contract on BscScan.',
    },
    {
      'q': 'Where can I find the contract?',
      'a': 'The official contract address is 0x04f0a170F95Bf48f3DA756ab9684068CcDa6485D on BNB Chain. Always verify the address from official channels.',
    },
    {
      'q': 'Is DEGOPLAY only for Africa?',
      'a': 'No. DEGOPLAY has African roots and heritage, but is built for a global Web3 community connecting people everywhere.',
    },
    {
      'q': 'How can I join?',
      'a': 'Join our official WhatsApp channel, Telegram community, and follow our X (Twitter) to participate in events, Spaces, and contributor programs.',
    },
    {
      'q': 'What is coming next?',
      'a': 'Follow our 4-phase development roadmap. We are currently executing Phase 01 foundation milestones with community dashboard and utility rolling out in Phase 02 and 03.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('❓ ', style: TextStyle(fontSize: 22)),
            Text(
              'Frequently Asked Questions',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: kTextDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: _faqs
                          .sublist(0, 4)
                          .map((f) => _FaqCard(q: f['q']!, a: f['a']!))
                          .toList(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: _faqs
                          .sublist(4)
                          .map((f) => _FaqCard(q: f['q']!, a: f['a']!))
                          .toList(),
                    ),
                  ),
                ],
              )
            : Column(
                children: _faqs.map((f) => _FaqCard(q: f['q']!, a: f['a']!)).toList(),
              ),
      ],
    );
  }
}

class _FaqCard extends StatefulWidget {
  final String q;
  final String a;
  const _FaqCard({required this.q, required this.a});

  @override
  State<_FaqCard> createState() => _FaqCardState();
}

class _FaqCardState extends State<_FaqCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _expanded ? kPurple : kBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () => setState(() => _expanded = !_expanded),
            title: Text(
              widget.q,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: _expanded ? kPurpleDark : kTextDark,
              ),
            ),
            trailing: Icon(
              _expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
              color: _expanded ? kPurple : kTextMuted,
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.a,
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
              height: 48,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'From Africa to the World. 🌍🐭',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: kPurpleDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A community-driven Web3 ecosystem.',
          style: GoogleFonts.inter(fontSize: 13, color: kTextMuted),
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
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      children: navMap.entries
          .map(
            (entry) => GestureDetector(
              onTap: () => onNavTap?.call(entry.value),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  entry.key,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: kTextMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _FooterSocials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: [
        _SocialIconChip(
          icon: 'assets/images/whatsapp.png',
          label: 'WhatsApp',
          onTap: () => openUrl('https://t.co/GMgJniaUhy'),
        ),
        _SocialIconChip(
          icon: 'assets/images/telegram.png',
          label: 'Telegram',
          onTap: () => openUrl('https://t.co/GMgJniaUhy'),
        ),
        _SocialIconChip(
          icon: 'assets/images/x.png',
          label: 'X (Twitter)',
          onTap: () => openUrl('https://x.com/DegoPlaay'),
        ),
      ],
    );
  }
}

class _SocialIconChip extends StatefulWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _SocialIconChip({required this.icon, required this.label, required this.onTap});

  @override
  State<_SocialIconChip> createState() => _SocialIconChipState();
}

class _SocialIconChipState extends State<_SocialIconChip> {
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? kPurpleSoft : kWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _hovered ? kPurple : kBorderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(widget.icon, width: 18, height: 18, fit: BoxFit.contain),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _hovered ? kPurpleDark : kTextDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
