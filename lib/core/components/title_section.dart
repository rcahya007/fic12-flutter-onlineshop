import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class TitleSection extends StatelessWidget {
  final String name;
  const TitleSection({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Text(
        name,
        style: heading2semi,
      ),
    );
  }
}
