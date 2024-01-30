// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:badges/badges.dart' as badges;

class MainWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainWrapper({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _goToBranch(_selectedIndex);
  }

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: colorGiratina200,
              width: 1,
            ),
          ),
        ),
        height: 64,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.logotype.path,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0 ? colorBlack : colorGiratina400,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                return state.maybeWhen(
                  loaded: (products) {
                    final totalQuantity = products.fold(
                        0,
                        (previousValue, element) =>
                            previousValue + element.quantity);
                    return totalQuantity > 0
                        ? badges.Badge(
                            position: badges.BadgePosition.topEnd(
                              top: -10,
                              end: -12,
                            ),
                            badgeStyle: const badges.BadgeStyle(
                              borderSide: BorderSide(
                                color: colorBlack,
                                width: 1,
                              ),
                            ),
                            badgeContent: Text(
                              '$totalQuantity',
                              style: body3reg.copyWith(
                                  color: colorWhite, fontSize: 10),
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.bag.path,
                              colorFilter: ColorFilter.mode(
                                _selectedIndex == 1
                                    ? colorBlack
                                    : colorGiratina400,
                                BlendMode.srcIn,
                              ),
                            ),
                          )
                        : SvgPicture.asset(
                            Assets.icons.bag.path,
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 1
                                  ? colorBlack
                                  : colorGiratina400,
                              BlendMode.srcIn,
                            ),
                          );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (message) => Center(
                    child: Text(message),
                  ),
                  orElse: () => const SizedBox(),
                );
              }),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.heart.path,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2 ? colorBlack : colorGiratina400,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.user.path,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 3 ? colorBlack : colorGiratina400,
                    BlendMode.srcIn,
                  )),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
