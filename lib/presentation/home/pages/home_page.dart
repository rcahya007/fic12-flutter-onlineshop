import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/components.dart';
import 'package:flutter_fic12_onlineshop/core/router/app_router.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/special_offer_product/special_offer_product_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/widgets/banner_slider.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/widgets/organism/menu_categories.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/widgets/organism/product_list.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/widgets/title_content.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  final List<String> banners1 = [
    Assets.images.banner1.path,
    Assets.images.banner1.path,
  ];
  final List<String> banners2 = [
    Assets.images.banner2.path,
    Assets.images.banner2.path,
    Assets.images.banner2.path,
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    // context.read<AllProductBloc>().add(const AllProductEvent.getAllProducts());
    // context
    //     .read<BestSellerProductBloc>()
    //     .add(const BestSellerProductEvent.getBestSellerProducts());
    // context
    //     .read<SpecialOfferProductBloc>()
    //     .add(const SpecialOfferProductEvent.getSpecialOfferProducts());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OP-Warnet Store'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.notification.svg(height: 24.0),
          ),
          IconButton(
            onPressed: () {
              context.goNamed(
                RouteConstants.cart,
                pathParameters: PathParameters().toMap(),
              );
            },
            icon: Assets.icons.cart.svg(height: 24.0),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SearchInput(
            controller: searchController,
            onTap: () {
              context.pushReplacementNamed(
                RouteConstants.root,
                pathParameters: PathParameters(
                  rootTab: RootTab.explore,
                ).toMap(),
              );
            },
          ),
          const SpaceHeight(16.0),
          BannerSlider(items: banners1),
          const SpaceHeight(12.0),
          TitleContent(
            title: 'Rooms',
            onSeeAllTap: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.amber,
                width: 80,
                height: 76,
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: const Color(0xff51B1A6),
                          width: 1,
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC1C9D1),
                              blurRadius: 10,
                              offset: Offset(0, 2))
                        ],
                      ),
                      child: const Icon(
                        Icons.app_registration_outlined,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Bestseller',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.amber,
                width: 80,
                height: 76,
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: const Color(0xff51B1A6),
                          width: 1,
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC1C9D1),
                              blurRadius: 10,
                              offset: Offset(0, 2))
                        ],
                      ),
                      child: const Icon(
                        Icons.app_registration_outlined,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Bestseller',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.amber,
                width: 80,
                height: 76,
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: const Color(0xff51B1A6),
                          width: 1,
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC1C9D1),
                              blurRadius: 10,
                              offset: Offset(0, 2))
                        ],
                      ),
                      child: const Icon(
                        Icons.app_registration_outlined,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Bestseller',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.amber,
                width: 80,
                height: 76,
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: const Color(0xff51B1A6),
                          width: 1,
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC1C9D1),
                              blurRadius: 10,
                              offset: Offset(0, 2))
                        ],
                      ),
                      child: const Icon(
                        Icons.widgets_outlined,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Bestseller',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // BlocBuilder<AllProductBloc, AllProductState>(
          //   builder: (context, state) {
          //     return state.maybeWhen(
          //       loaded: (products) => ProductList(
          //         title: 'Featured Product',
          //         onSeeAllTap: () {},
          //         items: products.sublist(0, 2),
          //       ),
          //       loading: () => const Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //       error: (message) => Center(
          //         child: Text(message),
          //       ),
          //       orElse: () => const SizedBox(),
          //     );
          //   },
          // ),
          const SpaceHeight(50.0),
          BannerSlider(items: banners2),
          const SpaceHeight(28.0),
          // BlocBuilder<BestSellerProductBloc, BestSellerProductState>(
          //   builder: (context, state) {
          //     return state.maybeWhen(
          //       loaded: (products) => ProductList(
          //         title: 'Best Sellers',
          //         onSeeAllTap: () {},
          //         items: products.sublist(0, 2),
          //       ),
          //       loading: () => const Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //       error: (message) => Center(
          //         child: Text(message),
          //       ),
          //       orElse: () => const SizedBox(),
          //     );
          //   },
          // ),
          // const SpaceHeight(50.0),
          // ProductList(
          //   title: 'New Arrivals',
          //   onSeeAllTap: () {},
          //   items: newArrivals,
          // ),
          // const SpaceHeight(50.0),
          // ProductList(
          //   title: 'Top Rated Product',
          //   onSeeAllTap: () {},
          //   items: topRatedProducts,
          // ),
          const SpaceHeight(50.0),
          // BlocBuilder<SpecialOfferProductBloc, SpecialOfferProductState>(
          //   builder: (context, state) {
          //     return state.maybeWhen(
          //       loaded: (products) => ProductList(
          //         title: 'Special Offers',
          //         onSeeAllTap: () {},
          //         items: products.sublist(0, 2),
          //       ),
          //       loading: () => const Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //       error: (message) => Center(
          //         child: Text(message),
          //       ),
          //       orElse: () => const SizedBox(),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
