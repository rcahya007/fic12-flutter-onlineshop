import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class SubTitleSection extends StatelessWidget {
  final String title;
  const SubTitleSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: heading2semi,
      ),
    );
  }
}
