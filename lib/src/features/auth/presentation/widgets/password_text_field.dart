import 'package:ai_coach_sportivo/src/features/auth/presentation/widgets/password_strength_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_dimensions.dart';
import 'package:ai_coach_sportivo/src/core/constants/app_durations.dart';

/// Widget riutilizzabile per i campi password con visibilità toggleabile
class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled = true,
    this.errorText,
    this.helperText,
    this.showStrengthIndicator = false,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool enabled;
  final String? errorText;
  final String? helperText;
  final bool showStrengthIndicator;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppDurations.normal,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });

    if (_obscureText) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: AppDurations.normal,
          child: TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            textInputAction: widget.textInputAction,
            enabled: widget.enabled,
            decoration: InputDecoration(
              labelText: widget.labelText,
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return IconButton(
                    icon: AnimatedSwitcher(
                      duration: AppDurations.fast,
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        key: ValueKey(_obscureText),
                      ),
                    ),
                    onPressed: widget.enabled
                        ? _togglePasswordVisibility
                        : null,
                  );
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              ),
              errorText: widget.errorText,
              helperText: widget.helperText,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingM,
                vertical: AppDimensions.paddingS,
              ),
            ),
            validator: widget.validator,
            onChanged: (value) {
              widget.onChanged?.call(value);
              // Trigger rebuild for strength indicator
              if (widget.showStrengthIndicator) {
                setState(() {});
              }
            },
            onFieldSubmitted: widget.onFieldSubmitted,
          ),
        ),

        // Password strength indicator
        if (widget.showStrengthIndicator)
          PasswordStrengthIndicator(password: widget.controller.text),
      ],
    );
  }
}
