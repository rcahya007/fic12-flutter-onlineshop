import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/components/rooms.dart';
import 'package:flutter_fic12_onlineshop/core/components/search.dart';
import 'package:flutter_fic12_onlineshop/core/components/stories.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _seacrhController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
