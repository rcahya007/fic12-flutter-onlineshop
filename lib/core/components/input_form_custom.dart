// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

// ignore: must_be_immutable
class InputFormCustom extends StatefulWidget {
  InputFormCustom({
    Key? key,
    required this.controller,
    required this.isPassword,
    this.validator,
    this.title,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final bool isPassword;
  bool? obscureText;
  final String? Function(String?)? validator;
  final String? title;
  final TextInputType? keyboardType;
  bool? readOnly;
  Function()? onTap;

  @override
  State<InputFormCustom> createState() => _InputFormCustomState();
}

class _InputFormCustomState extends State<InputFormCustom> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.obscureText!,
      style: body1reg,
      readOnly: widget.readOnly!,
      onTap: widget.onTap,
      decoration: InputDecoration(
        labelText: widget.title,
        labelStyle: body1reg.copyWith(
          color: colorGiratina500,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 9.5,
          horizontal: 16,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorGiratina100,
            width: 0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: colorGiratina300,
            width: 10,
          ),
        ),
        filled: true,
        fillColor: colorGiratina100,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(
                    () {
                      widget.obscureText = !widget.obscureText!;
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset(
                    widget.obscureText!
                        ? Assets.icons.eyeClosed.path
                        : Assets.icons.eye.path,
                    width: 24,
                    height: 24,
                    colorFilter:
                        const ColorFilter.mode(colorBlack, BlendMode.srcIn),
                  ),
                ),
              )
            : null,
        suffixIconConstraints: const BoxConstraints(),
      ),
    );
  }
}
