import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/rooms.dart';
import 'package:flutter_fic12_onlineshop/core/components/search.dart';
import 'package:flutter_fic12_onlineshop/core/components/stories.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _seacrhController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _seacrhController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _seacrhController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 56,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                  right: 16,
                ),
                child: Center(
                  child: Text(
                    'OP Warnet Store',
                    style: heading1semi,
                  ),
                ),
              ),
              Search(seacrhController: _seacrhController),
              const Stories(),
              const Rooms(),
              const TitleSection(
                name: 'popular',
              ),
            ],
          ),
        ),
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
              icon: SvgPicture.asset(
                Assets.icons.bag.path,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? colorBlack : colorGiratina400,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.heart.path,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 2 ? colorBlack : colorGiratina400,
                    BlendMode.srcIn,
                  )),
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
