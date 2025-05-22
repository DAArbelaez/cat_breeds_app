import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/constants/icons.dart';
import 'package:flutter/material.dart';

/// A horizontal, scrollable list of chips with left/right arrow buttons
/// that appear when there's more content off-screen.
class ScrollableChipRow extends StatefulWidget {
  final List<String> items;
  final TextStyle? textStyle;
  final Color? chipColor;
  final double height;
  final double chipSpacing;

  const ScrollableChipRow({
    super.key,
    required this.items,
    this.textStyle,
    this.chipColor,
    this.height = Dimens.d32,
    this.chipSpacing = Dimens.d8,
  });

  @override
  State<ScrollableChipRow> createState() => _ScrollableChipRowState();
}

class _ScrollableChipRowState extends State<ScrollableChipRow> {
  late final ScrollController _ctrl;
  bool _canScrollLeft = false;
  bool _canScrollRight = false;

  @override
  void initState() {
    super.initState();
    _ctrl = ScrollController()..addListener(_updateArrows);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateArrows());
  }

  @override
  void dispose() {
    _ctrl.removeListener(_updateArrows);
    _ctrl.dispose();
    super.dispose();
  }

  void _updateArrows() {
    if (!_ctrl.hasClients) return;
    final max = _ctrl.position.maxScrollExtent;
    final offset = _ctrl.offset;
    setState(() {
      _canScrollLeft = offset > Dimens.d0;
      _canScrollRight = offset < max;
    });
  }

  void _scrollBy(double delta) {
    final newOffset = (_ctrl.offset + delta).clamp(0.0, _ctrl.position.maxScrollExtent);
    _ctrl.animateTo(newOffset, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          ListView.separated(
            controller: _ctrl,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: widget.chipSpacing),
            itemCount: widget.items.length,
            separatorBuilder: (_, __) => SizedBox(width: widget.chipSpacing),
            itemBuilder: (_, i) {
              return Chip(
                label: Text(widget.items[i], style: widget.textStyle),
                backgroundColor: widget.chipColor,
                visualDensity: VisualDensity.compact,
              );
            },
          ),

          // left arrow
          if (_canScrollLeft)
            Positioned(
              left: Dimens.d0,
              top: Dimens.d0,
              bottom: Dimens.d0,
              child: _ArrowButton(icon: AppIcons.arrowBack, onTap: () => _scrollBy(-100)),
            ),

          // right arrow
          if (_canScrollRight)
            Positioned(
              right: Dimens.d0,
              top: Dimens.d0,
              bottom: Dimens.d0,
              child: _ArrowButton(icon: AppIcons.arrowForward, onTap: () => _scrollBy(100)),
            ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.d24,
      color: Colors.white.withValues(alpha: 0.7),
      child: InkWell(onTap: onTap, child: Center(child: icon)),
    );
  }
}
