import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/bloc/check_auth/check_auth_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/pages/account_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_fic12_onlineshop/core/components/button_next_action.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:go_router/go_router.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckAuthBloc, CheckAuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          loaded: (user) {
            if (user) {
              return const AccountPage();
            } else {
              return Scaffold(
                body: SafeArea(
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
                                colorBlack, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ),
                    const TitleSection(
                      name: 'my account',
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.images.smiley.path,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'come on in',
                              style: heading2semi,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: Text(
                                  'view orders and update your details',
                                  style: body1reg.copyWith(
                                    color: colorGiratina500,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ButtonNextAction(
                        widgetInside: Text(
                          'Continue with phone / email',
                          style: body1semi,
                        ),
                        onTap: () {
                          context.goNamed('login');
                        },
                      ),
                    ),
                  ],
                )),
              );
            }
          },
        );
      },
    );
  }
}
