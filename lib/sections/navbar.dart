import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../url_helper.dart';
import '../theme.dart';

class NavBar extends StatefulWidget {
  final Function(double) onNavTap;

  const NavBar({super.key, required this.onNavTap});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String _active = 'Home';

  final List<Map<String, dynamic>> _navItems = [
    {'label': 'Home', 'offset': 0.0},
    {'label': 'About', 'offset': 750.0},
    {'label': 'Ecosystem', 'offset': 1550.0},
    {'label': 'Token', 'offset': 2300.0},
    {'label': 'Roadmap', 'offset': 3450.0},
    {'label': 'Community', 'offset': 4300.0},
    {'label': 'FAQ', 'offset': 5300.0},
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 960;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: kWhite.withOpacity(0.96),
          border: const Border(
            bottom: BorderSide(
              color: kBorderColor,
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 50 : 16,
          ),
          child: Row(
            children: [
              // Logo
              _BrandLogo(onTap: () => widget.onNavTap(0.0)),
              const Spacer(),
              // Nav links (desktop)
              if (isWide) ...[
                ...(_navItems.map((item) => _NavLink(
                      label: item['label'],
                      isActive: _active == item['label'],
                      onTap: () {
                        setState(() => _active = item['label']);
                        widget.onNavTap(item['offset']);
                      },
                    ))),
                const SizedBox(width: 16),
                // Social icons
                _SocialIconBtn(
                  asset: 'assets/images/telegram.png',
                  onTap: () => openUrl('https://t.co/GMgJniaUhy'),
                ),
                const SizedBox(width: 4),
                _SocialIconBtn(
                  asset: 'assets/images/x.png',
                  onTap: () => openUrl('https://x.com/DegoPlaay'),
                ),
                const SizedBox(width: 4),
                _SocialIconBtn(
                  asset: 'assets/images/whatsapp.png',
                  onTap: () => openUrl('https://t.co/GMgJniaUhy'),
                ),
                const SizedBox(width: 16),
              ],
              // Join Community / Buy $DEGO
              _NavActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const _BrandLogo({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Image.asset(
          'assets/images/dana3.png',
          height: 44,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
              color: widget.isActive
                  ? kPurple
                  : (_hovered ? kTextDark : kTextMuted),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIconBtn extends StatefulWidget {
  final String asset;
  final VoidCallback onTap;
  const _SocialIconBtn({required this.asset, required this.onTap});

  @override
  State<_SocialIconBtn> createState() => _SocialIconBtnState();
}

class _SocialIconBtnState extends State<_SocialIconBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: _hovered ? 1.0 : 0.65,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(widget.asset, width: 20, height: 20, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

class _NavActionButtons extends StatefulWidget {
  @override
  State<_NavActionButtons> createState() => _NavActionButtonsState();
}

class _NavActionButtonsState extends State<_NavActionButtons> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => openUrl('https://dexscreener.com/bsc/0xad9684bc26780176fcb39b0d6749904a5dc2f3dc'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          decoration: BoxDecoration(
            color: _hovered ? kPurpleDark : kPurple,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: kPurple.withOpacity(0.35),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Buy \$DEGO',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_forward_rounded, size: 14, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
