// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/bloc/logout/logout_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(
                16,
              ),
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Assets.icons.settings.path,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      colorBlack,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            const TitleSection(name: 'my account'),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Column(
                children: [
                  const UserContent(),
                  UserSectionMenu(
                    urlAssetIcon: Assets.icons.bag.path,
                    title: 'My orders',
                    numberNotif: 14,
                  ),
                  UserSectionMenu(
                    urlAssetIcon: Assets.icons.user.path,
                    title: 'My Details',
                  ),
                  UserSectionMenu(
                    urlAssetIcon: Assets.icons.pin.path,
                    title: 'Address book',
                  ),
                  UserSectionMenu(
                    urlAssetIcon: Assets.icons.card.path,
                    title: 'Payment Methods',
                  ),
                  BlocConsumer<LogoutBloc, LogoutState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          loaded: () {
                            context.goNamed('home');
                          },
                          error: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  message,
                                ),
                              ),
                            );
                          });
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return UserSectionMenu(
                            urlAssetIcon: Assets.icons.logout.path,
                            title: 'Sign out',
                            onTap: () {
                              context
                                  .read<LogoutBloc>()
                                  .add(const LogoutEvent.logout());
                            },
                          );
                        },
                        loading: () {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class UserSectionMenu extends StatelessWidget {
  final String urlAssetIcon;
  final String title;
  final int? numberNotif;
  final VoidCallback? onTap;
  const UserSectionMenu({
    Key? key,
    required this.urlAssetIcon,
    required this.title,
    this.numberNotif,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              urlAssetIcon,
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                colorBlack,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: body1reg,
              ),
            ),
            numberNotif != null
                ? Text(
                    numberNotif.toString(),
                    style: body1reg.copyWith(
                      color: colorGiratina500,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class UserContent extends StatelessWidget {
  const UserContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 9.5,
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: colorGiratina500,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://i.pravatar.cc/300?img=1',
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanya Morenko',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: body1semi,
                ),
                Text(
                  '+7 912 323-32-12',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: body2reg.copyWith(
                    color: colorGiratina500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
