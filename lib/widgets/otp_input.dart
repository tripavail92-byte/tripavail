import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripavail/utils/theme/constants/app_radii.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;
  final Function(String)? onChanged;

  const OtpInput({
    super.key,
    this.length = 6,
    required this.onCompleted,
    this.onChanged,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.length,
      (index) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String _getOtp() {
    return _controllers.map((c) => c.text).join();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1) {
      // Move to next field
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      // Move to previous field on delete
      _focusNodes[index - 1].requestFocus();
    }

    // Handle paste
    if (value.length > 1) {
      _handlePaste(value, index);
    }

    final otp = _getOtp();
    widget.onChanged?.call(otp);

    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }

  void _handlePaste(String value, int startIndex) {
    final digits = value
        .split('')
        .where((c) => c.isNotEmpty)
        .toList();
    for (
      int i = 0;
      i < digits.length && (startIndex + i) < widget.length;
      i++
    ) {
      _controllers[startIndex + i].text = digits[i];
    }

    final nextIndex = (startIndex + digits.length).clamp(
      0,
      widget.length - 1,
    );
    _focusNodes[nextIndex].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 45,
          height: 56,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: AppRadii.m,
                borderSide: BorderSide(
                  color: isDark
                      ? const Color(0xFF555555)
                      : const Color(0xFFDDDDDD),
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppRadii.m,
                borderSide: BorderSide(
                  color: isDark
                      ? const Color(0xFF555555)
                      : const Color(0xFFDDDDDD),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: AppRadii.m,
                borderSide: BorderSide(
                  color: theme.primaryColor,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: isDark
                  ? const Color(0xFF3C3C3C)
                  : Colors.white,
            ),
            onChanged: (value) => _onChanged(value, index),
            onTap: () {
              if (_controllers[index].text.isNotEmpty) {
                _controllers[index]
                    .selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: _controllers[index].text.length,
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
