import 'package:flutter/material.dart';

/// Widget per indicatori di caricamento avanzati
class AdvancedLoadingIndicator extends StatefulWidget {
  const AdvancedLoadingIndicator({
    super.key,
    this.size = 50.0,
    this.strokeWidth = 4.0,
    this.color,
    this.backgroundColor,
    this.message,
  });

  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final String? message;

  @override
  State<AdvancedLoadingIndicator> createState() =>
      _AdvancedLoadingIndicatorState();
}

class _AdvancedLoadingIndicatorState extends State<AdvancedLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: widget.size,
          height: widget.size,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(widget.size / 2),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: _LoadingPainter(
                  progress: _animation.value,
                  color: widget.color ?? theme.colorScheme.primary,
                  strokeWidth: widget.strokeWidth,
                ),
              );
            },
          ),
        ),

        if (widget.message != null) ...[
          const SizedBox(height: 16),
          Text(
            widget.message!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

class _LoadingPainter extends CustomPainter {
  _LoadingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle
    final backgroundPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * 3.141592653589793 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2, // Start from top
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Widget per overlay di caricamento migliorato
class EnhancedLoadingOverlay extends StatelessWidget {
  const EnhancedLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingMessage,
    this.color,
  });

  final bool isLoading;
  final Widget child;
  final String? loadingMessage;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          AnimatedOpacity(
            opacity: isLoading ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              color: color ?? Colors.black.withValues(alpha: 0.3),
              child: Center(
                child: AdvancedLoadingIndicator(message: loadingMessage),
              ),
            ),
          ),
      ],
    );
  }
}
