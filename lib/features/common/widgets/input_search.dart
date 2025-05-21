import 'dart:async';
import 'package:cat_breeds_app/core/constants/palette.dart';
import 'package:cat_breeds_app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cat_breeds_app/core/constants/icons.dart';

/// A reusable search input field.
class InputSearch extends StatefulWidget {
  /// Called after the user stops typing for [debounceDuration].
  final ValueChanged<String> onSearchChanged;

  final VoidCallback? onClear;

  /// Duration to wait after the last keystroke before firing [onSearchChanged].
  final Duration debounceDuration;

  /// Placeholder text for the input field.
  final String hintText;

  const InputSearch({
    super.key,
    required this.onSearchChanged,
    this.onClear,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.hintText = 'Search...',
  });

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  /// Controller for the TextField to read and clear its current value.
  final TextEditingController _controller = TextEditingController();

  /// Timer used to debounce user input.
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    // Cancel any pending debounce timer and dispose of the controller.
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  /// Handles each keystroke, resetting the debounce timer.
  void _onChanged(String value) {
    // If a previous debounce is active, cancel it.
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Start a new debounce timer.
    _debounce = Timer(widget.debounceDuration, () {
      // Invoke the search callback once the user pauses typing.
      widget.onSearchChanged(value);
    });
  }

  /// Clears the text field and triggers both clear and search callbacks.
  void _onClear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onSearchChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
      textCapitalization: TextCapitalization.sentences,
      style: AppTextStyle.bodySmall,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        hintStyle: AppTextStyle.bodySmall.copyWith(color: Palette.grey),
        prefixIcon: AppIcons.search,
        suffixIcon: _controller.text.isNotEmpty ? IconButton(icon: AppIcons.clear, onPressed: _onClear) : null,
      ),
    );
  }
}
