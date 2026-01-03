import 'package:azteron_case/core/constants/app_assets.dart';
import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageInputField extends StatefulWidget {
  const MessageInputField({
    required this.onSend,
    this.isLoading = false,
    super.key,
  });

  final ValueChanged<String> onSend;
  final bool isLoading;

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _hasText = false;
  bool _isFocused = false;

  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });

    if (_focusNode.hasFocus) {
      _animationController.forward();
    } else if (!_hasText) {
      _animationController.reverse();
    }
  }

  void _handleSend() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onSend(_controller.text);
      _controller.clear();
      setState(() => _hasText = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final assets = AppAssets.instance;
    final primaryColor = context.colorScheme.primary;
    final inputBackground = context.appColors.receivedBubble;

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: context.bottomPadding + 12,
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Text input field with mic icon
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: inputBackground,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      onChanged: (text) {
                        final hasText = text.trim().isNotEmpty;
                        if (hasText != _hasText) {
                          setState(() => _hasText = hasText);
                          if (hasText && !_isFocused) {
                            _animationController.forward();
                          }
                        }
                      },
                      onSubmitted: (_) => _handleSend(),
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 4,
                      minLines: 1,
                      style: context.textTheme.bodyLarge,
                      decoration: InputDecoration(
                        hintText: context.l10n.typeMessage,
                        hintStyle: context.textTheme.bodyLarge?.copyWith(
                          color: context.appColors.textTertiary,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  // Mic icon - fades out when has text
                  AnimatedOpacity(
                    opacity: _hasText ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: _hasText ? 0 : 48,
                      child: _hasText
                          ? null
                          : IconButton(
                              onPressed: () {
                                // Voice input - not implemented
                              },
                              icon: SvgPicture.asset(
                                assets.micIcon,
                                width: 22,
                                height: 22,
                                colorFilter: ColorFilter.mode(
                                  primaryColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Send button - animated appearance
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final showButton = _isFocused || _hasText;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: showButton ? 60 : 0,
                child: showButton
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Opacity(
                            opacity: _fadeAnimation.value,
                            child: child,
                          ),
                        ),
                      )
                    : null,
              );
            },
            child: _SendButton(
              onPressed: _hasText ? _handleSend : null,
              isLoading: widget.isLoading,
              icon: assets.sendIcon,
              primaryColor: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// Circular send button with paper plane icon.
class _SendButton extends StatelessWidget {
  const _SendButton({
    required this.onPressed,
    required this.isLoading,
    required this.icon,
    required this.primaryColor,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final String icon;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: onPressed != null
              ? primaryColor
              : primaryColor.withValues(alpha: 0.5),
          shape: BoxShape.circle,
          boxShadow: onPressed != null
              ? [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
        ),
      ),
    );
  }
}
