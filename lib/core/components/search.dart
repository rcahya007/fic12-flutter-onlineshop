import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required TextEditingController seacrhController,
  }) : _seacrhController = seacrhController;

  final TextEditingController _seacrhController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: _seacrhController,
        style: body1reg,
        decoration: InputDecoration(
          filled: true,
          fillColor: colorGiratina100,
          hintText: 'Search Products',
          hintStyle: body1reg.copyWith(
            color: colorGiratina500,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SvgPicture.asset(
              Assets.icons.search.path,
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                colorGiratina500,
                BlendMode.srcIn,
              ),
              fit: BoxFit.scaleDown,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
