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
  final bool _isScrolled = false;
  String _active = 'Home';

  final List<Map<String, dynamic>> _navItems = [
    {'label': 'Home', 'offset': 0.0},
    {'label': 'About', 'offset': 700.0},
    {'label': 'Token', 'offset': 1400.0},
    {'label': 'Roadmap', 'offset': 2000.0},
    {'label': 'Community', 'offset': 2600.0},
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 70,
        decoration: BoxDecoration(
          color: _isScrolled
              ? kBlack.withOpacity(0.95)
              : kBlack.withOpacity(0.85),
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.07),
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 60 : 20,
          ),
          child: Row(
            children: [
              // Logo
              _DanaLogo(onTap: () => widget.onNavTap(0.0)),
              const Spacer(),
              // Nav links (hide on mobile)
              if (isWide) ...[
                ...(_navItems.map((item) => _NavLink(
                      label: item['label'],
                      isActive: _active == item['label'],
                      onTap: () {
                        setState(() => _active = item['label']);
                        widget.onNavTap(item['offset']);
                      },
                    ))),
                const SizedBox(width: 24),
                // Social icons
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => openUrl('https://t.me/SCF_Degens'),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/telegram.png', width: 22, height: 22, fit: BoxFit.contain, color: Colors.white60),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                _XIconBtn(
                  onTap: () => openUrl('https://x.com/ardanadose'),
                ),
                const SizedBox(width: 4),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => openUrl('https://chat.whatsapp.com/Gpd3q6d02FwIkFM1FOCf7W'),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/whatsapp.png', width: 22, height: 22, fit: BoxFit.contain, color: Colors.white60),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              // Buy button
              _BuyButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DanaLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const _DanaLogo({this.onTap});

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
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: widget.isActive || _hovered ? kYellow : Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: widget.isActive ? 20 : 0,
                decoration: BoxDecoration(
                  color: kYellow,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white60, size: 22),
    );
  }
}

class _XIconBtn extends StatefulWidget {
  final VoidCallback onTap;
  const _XIconBtn({required this.onTap});

  @override
  State<_XIconBtn> createState() => _XIconBtnState();
}

class _XIconBtnState extends State<_XIconBtn> {
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
          child: Image.asset(
            'assets/images/x.png',
            width: 22,
            height: 22,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _BuyButton extends StatefulWidget {
  @override
  State<_BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<_BuyButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => openUrl('https://dexscreener.com/bsc/0xf471d46afdc6b29726d6e32e81b6ccc604f48129'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered ? Colors.amber : kYellow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Buy \$DANA',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: kBlack,
            ),
          ),
        ),
      ),
    );
  }
}
