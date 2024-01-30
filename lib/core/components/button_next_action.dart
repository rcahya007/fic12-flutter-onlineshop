import 'package:flutter/widgets.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class ButtonNextAction extends StatelessWidget {
  final String textButton;
  final VoidCallback onTap;
  const ButtonNextAction({
    Key? key,
    required this.onTap,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorCharizard400,
        ),
        child: Center(
          child: Text(
            textButton,
            style: body1semi,
          ),
        ),
      ),
    );
  }
}