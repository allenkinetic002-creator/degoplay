import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class TokenSection extends StatelessWidget {
  const TokenSection({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Token Overview & Coin Mascot
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(flex: 5, child: _TokenLeft()),
                    SizedBox(width: 60),
                    Expanded(flex: 4, child: _CoinRight()),
                  ],
                )
              : Column(
                  children: const [
                    _TokenLeft(),
                    SizedBox(height: 48),
                    _CoinRight(),
                  ],
                ),

          const SizedBox(height: 60),
          Divider(color: kBorderColor),
          const SizedBox(height: 50),

          // Token Utility Section
          _TokenUtilitySection(isWide: isWide),

          const SizedBox(height: 60),
          Divider(color: kBorderColor),
          const SizedBox(height: 50),

          // Tokenomics Section
          _TokenomicsSection(isWide: isWide),
        ],
      ),
    );
  }
}

class _TokenLeft extends StatelessWidget {
  const _TokenLeft();
  static const _contractAddress = '0x04f0a170F95Bf48f3DA756ab9684068CcDa6485D';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionLabel('TOKEN'),
        yellowDivider(),
        _TokenHeaderLogo(contractAddress: _contractAddress),
        const SizedBox(height: 16),
        Text(
          '\$DEGO is the native community token of the DEGOPLAY ecosystem.\nThe token is designed to support participation within the ecosystem rather than relying solely on speculation.',
          style: GoogleFonts.inter(
            fontSize: 15,
            color: kTextMuted,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),

        _TokenRow(
          icon: '💼',
          label: 'BSC Wallet / Contract',
          value: '${_contractAddress.substring(0, 10)}...${_contractAddress.substring(_contractAddress.length - 6)}',
          isAddress: true,
          fullText: _contractAddress,
        ),
        Divider(color: kBorderColor, height: 28),
        const _TokenRow(
          icon: '⛓️',
          label: 'Network',
          value: 'BNB Chain (BEP-20)',
        ),
        Divider(color: kBorderColor, height: 28),
        const _TokenRow(
          icon: '🔢',
          label: 'Decimals',
          value: '18',
        ),
        Divider(color: kBorderColor, height: 28),
        _DexRow(),
      ],
    );
  }
}

class _TokenHeaderLogo extends StatefulWidget {
  final String contractAddress;
  const _TokenHeaderLogo({required this.contractAddress});

  @override
  State<_TokenHeaderLogo> createState() => _TokenHeaderLogoState();
}

class _TokenHeaderLogoState extends State<_TokenHeaderLogo> {
  bool _hovered = false;
  bool _copied = false;

  void _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.contractAddress));
    setState(() => _copied = true);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Contract address copied to clipboard!',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          backgroundColor: kPurple,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _copy,
        child: AnimatedScale(
          scale: _hovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 180),
          alignment: Alignment.centerLeft,
          child: Tooltip(
            message: _copied ? 'Copied!' : 'Click to copy \$DEGO contract address',
            child: SizedBox(
              height: 70,
              child: Image.asset(
                'assets/images/open.png',
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TokenRow extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final bool isAddress;
  final String? fullText;

  const _TokenRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isAddress = false,
    this.fullText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 14),
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: GoogleFonts.inter(fontSize: 14, color: kTextMuted),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isAddress ? kPurple : kTextDark,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (isAddress && fullText != null) ...[
          const SizedBox(width: 8),
          _CopyIconBtn(text: fullText!),
        ],
      ],
    );
  }
}

class _DexRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('📊', style: TextStyle(fontSize: 20)),
        const SizedBox(width: 14),
        SizedBox(
          width: 140,
          child: Text(
            'DEX Links',
            style: GoogleFonts.inter(fontSize: 14, color: kTextMuted),
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 8,
          children: const [
            _DexChip('PancakeSwap', '🥞', url: 'https://dexscreener.com/bsc/0xad9684bc26780176fcb39b0d6749904a5dc2f3dc'),
            _DexChip('DexScreener', '📈', url: 'https://dexscreener.com/bsc/0xad9684bc26780176fcb39b0d6749904a5dc2f3dc'),
            _DexChip('BscScan', '⛓️', url: 'https://bscscan.com/address/0x04f0a170F95Bf48f3DA756ab9684068CcDa6485D'),
          ],
        ),
      ],
    );
  }
}

class _DexChip extends StatefulWidget {
  final String label;
  final String icon;
  final String? url;
  const _DexChip(this.label, this.icon, {this.url});

  @override
  State<_DexChip> createState() => _DexChipState();
}

class _DexChipState extends State<_DexChip> {
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered ? kPurpleSoft : kWhite,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: _hovered ? kPurple : kBorderColor,
            ),
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
              Text(widget.icon, style: const TextStyle(fontSize: 13)),
              const SizedBox(width: 5),
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

class _CopyIconBtn extends StatefulWidget {
  final String text;
  const _CopyIconBtn({required this.text});

  @override
  State<_CopyIconBtn> createState() => _CopyIconBtnState();
}

class _CopyIconBtnState extends State<_CopyIconBtn> {
  bool _copied = false;

  void _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.text));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copy,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Icon(
          _copied ? Icons.check_circle_rounded : Icons.copy_rounded,
          color: _copied ? Colors.green : kTextMuted,
          size: 18,
        ),
      ),
    );
  }
}

class _CoinRight extends StatelessWidget {
  const _CoinRight();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // glow
        Container(
          width: 380,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110),
            gradient: RadialGradient(
              colors: [
                kPurple.withOpacity(0.18),
                Colors.transparent,
              ],
            ),
          ),
        ),
        SizedBox(
          width: 440,
          child: Image.asset(
            'assets/images/close.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class _TokenUtilitySection extends StatelessWidget {
  final bool isWide;
  const _TokenUtilitySection({required this.isWide});

  static const _utilities = [
    {
      'icon': '🎁',
      'title': 'Community Rewards',
      'desc': 'Reward community members for approved contributions, creative tasks, and activities.',
    },
    {
      'icon': '🔑',
      'title': 'Ecosystem Access',
      'desc': 'Use tokens for selected features, exclusive events, digital experiences, or future products.',
    },
    {
      'icon': '🗳️',
      'title': 'Community Participation',
      'desc': 'Token holders can participate in eligible community initiatives and governance proposals.',
    },
    {
      'icon': '🎮',
      'title': 'Digital Experiences',
      'desc': 'Future DEGOPLAY games, products, and decentralized tools may integrate \$DEGO directly.',
    },
    {
      'icon': '🤝',
      'title': 'Partnerships',
      'desc': 'Selected ecosystem partners may integrate \$DEGO into community campaigns and experiences.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('⚡ ', style: TextStyle(fontSize: 22)),
            Text(
              'Token Utility',
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
          'Designed to support participation within the ecosystem rather than relying solely on speculation.',
          style: GoogleFonts.inter(fontSize: 14, color: kTextMuted),
        ),
        const SizedBox(height: 24),
        isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _utilities
                    .map(
                      (u) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: _UtilityCard(
                            icon: u['icon']!,
                            title: u['title']!,
                            desc: u['desc']!,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            : Column(
                children: _utilities
                    .map(
                      (u) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _UtilityCard(
                          icon: u['icon']!,
                          title: u['title']!,
                          desc: u['desc']!,
                        ),
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }
}

class _UtilityCard extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;

  const _UtilityCard({
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
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: kTextDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: kTextMuted,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _TokenomicsSection extends StatelessWidget {
  final bool isWide;
  const _TokenomicsSection({required this.isWide});

  static const _allocations = [
    {'name': 'Community', 'pct': '30%', 'purpose': 'Community initiatives & rewards', 'color': 0xFF7C3AED},
    {'name': 'Liquidity', 'pct': '20%', 'purpose': 'Initial & future liquidity', 'color': 0xFF0284C7},
    {'name': 'Ecosystem', 'pct': '20%', 'purpose': 'Products & development', 'color': 0xFF059669},
    {'name': 'Marketing', 'pct': '10%', 'purpose': 'Global awareness & campaigns', 'color': 0xFFC026D3},
    {'name': 'Treasury', 'pct': '10%', 'purpose': 'Long-term ecosystem reserve', 'color': 0xFF9333EA},
    {'name': 'Team', 'pct': '5%', 'purpose': 'Core contributors (vested)', 'color': 0xFFDC2626},
    {'name': 'Partnerships', 'pct': '5%', 'purpose': 'Strategic ecosystem growth', 'color': 0xFF6366F1},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('🪙 ', style: TextStyle(fontSize: 22)),
            Text(
              'Tokenomics',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: kTextDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Built for Long-Term Ecosystem Development (Total: 100%)',
          style: GoogleFonts.inter(fontSize: 14, color: kPurpleDark, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),

        // Visual Progress Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 16,
            child: Row(
              children: _allocations
                  .map(
                    (a) => Expanded(
                      flex: int.parse((a['pct'] as String).replaceAll('%', '')),
                      child: Container(color: Color(a['color'] as int)),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Breakdown items
        isWide
            ? GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 2.2,
                ),
                itemCount: _allocations.length,
                itemBuilder: (context, i) => _TokenomicsCard(a: _allocations[i]),
              )
            : Column(
                children: _allocations
                    .map(
                      (a) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _TokenomicsCard(a: a),
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }
}

class _TokenomicsCard extends StatelessWidget {
  final Map<String, dynamic> a;
  const _TokenomicsCard({required this.a});

  @override
  Widget build(BuildContext context) {
    final color = Color(a['color'] as int);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 36,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a['name'] as String,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: kTextDark,
                      ),
                    ),
                    Text(
                      a['pct'] as String,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  a['purpose'] as String,
                  style: GoogleFonts.inter(fontSize: 11, color: kTextMuted),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
