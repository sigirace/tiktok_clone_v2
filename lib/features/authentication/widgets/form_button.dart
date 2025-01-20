import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class FormButton extends StatelessWidget {
  final Widget? widget;
  final bool disabled;
  final String? text;
  final Function? callback;

  const FormButton({
    super.key,
    required this.disabled,
    this.widget,
    this.text,
    this.callback,
  });

  void _onTap(BuildContext context) {
    if (widget == null) {
      if (callback != null) {
        callback!();
      }
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {disabled ? null : _onTap(context)},
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color: disabled
                ? Colors.grey.shade300
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(Sizes.size5),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: disabled ? Colors.grey.shade400 : Colors.white,
              fontWeight: FontWeight.w600,
            ),
            child: Text(text ?? "Next"),
          ),
        ),
      ),
    );
  }
}
