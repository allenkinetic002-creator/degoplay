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
      color: const Color(0xFF111111),
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 24,
        vertical: 80,
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: _TokenLeft()),
                const SizedBox(width: 60),
                Expanded(flex: 4, child: _CoinRight()),
              ],
            )
          : Column(
              children: [
                _TokenLeft(),
                const SizedBox(height: 48),
                _CoinRight(),
              ],
            ),
    );
  }
}

class _TokenLeft extends StatelessWidget {
  static const _contractAddress = '0x6C4e9893C3EA05594e5cf26E7B813a07a2B564B0';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TokenHeaderLogo(contractAddress: _contractAddress),
        const SizedBox(height: 28),
        _TokenRow(
          imageAsset: 'assets/images/shrek.png',
          label: 'Contract Address',
          value: '${_contractAddress.substring(0, 12)}...${_contractAddress.substring(_contractAddress.length - 6)}',
          isAddress: true,
          fullText: _contractAddress,
        ),
        const Divider(color: Colors.white10, height: 32),
        _TokenRow(
          imageAsset: 'assets/images/shrek2.png',
          label: 'Network',
          value: 'BNB Chain',
        ),
        const Divider(color: Colors.white10, height: 32),
        _DexRow(),
        const Divider(color: Colors.white10, height: 32),
        _ChartRow(),
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
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          backgroundColor: kYellow,
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
          scale: _hovered ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 180),
          alignment: Alignment.centerLeft,
          child: Tooltip(
            message: _copied ? 'Copied!' : 'Click to copy contract address',
            child: SizedBox(
              height: 76,
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
  final String imageAsset;
  final String label;
  final String value;
  final bool isAddress;
  final String? fullText;

  const _TokenRow({
    required this.imageAsset,
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
        SizedBox(
          width: 44,
          height: 44,
          child: Image.asset(imageAsset, fit: BoxFit.contain),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.robotoMono(
              fontSize: 13,
              color: isAddress ? kYellow : kWhite,
              fontWeight: FontWeight.w500,
            ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 44,
          height: 44,
          child: Image.asset('assets/images/shrek3.png', fit: BoxFit.contain),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 150,
          child: Text(
            'DEX Links',
            style: GoogleFonts.inter(fontSize: 14, color: Colors.white54),
          ),
        ),
        _DexChip('PancakeSwap', '🥞', url: 'https://dexscreener.com/bsc/0xf471d46afdc6b29726d6e32e81b6ccc604f48129'),
        const SizedBox(width: 10),
        _DexChip('DexScreener', '📊', url: 'https://dexscreener.com/bsc/0xf471d46afdc6b29726d6e32e81b6ccc604f48129'),
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
            color: _hovered ? kYellow.withOpacity(0.15) : kDarkGray,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: _hovered ? kYellow.withOpacity(0.5) : Colors.white12,
            ),
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
                  color: _hovered ? kYellow : Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartRow extends StatefulWidget {
  @override
  State<_ChartRow> createState() => _ChartRowState();
}

class _ChartRowState extends State<_ChartRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 44,
          height: 44,
          child: Image.asset('assets/images/shrek4.png', fit: BoxFit.contain),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 150,
          child: Text(
            'Chart',
            style: GoogleFonts.inter(fontSize: 14, color: Colors.white54),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: GestureDetector(
            onTap: () => openUrl('https://dexscreener.com/bsc/0xf471d46afdc6b29726d6e32e81b6ccc604f48129'),
            child: Row(
              children: [
                Text('↗ ', style: TextStyle(color: _hovered ? kYellow : Colors.white54, fontSize: 14)),
                Text(
                  'View Chart',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _hovered ? kYellow : Colors.white54,
                    decoration: TextDecoration.underline,
                    decorationColor: _hovered ? kYellow : Colors.white30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
      child: Icon(
        _copied ? Icons.check : Icons.copy_rounded,
        color: _copied ? Colors.greenAccent : Colors.white38,
        size: 16,
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
                kYellow.withOpacity(0.22),
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
