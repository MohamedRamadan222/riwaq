import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/constants/app_styles.dart';
import 'package:riwaq/core/di/injection_container.dart';
import 'package:riwaq/features/home/presentation/cubit/home_cubit.dart';
import 'package:riwaq/features/home/presentation/cubit/home_state.dart';
import '../widgets/category_ships.dart';
import '../widgets/custom_card_home.dart';
import '../widgets/custom_grid_view.dart';
import '../widgets/custom_promo_card.dart';
import '../widgets/custom_text_field_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  late final HomeCubit _cubit = sl<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.getProducts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        leading: Icon(CupertinoIcons.bell),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الموقع الحالى',
                  style: TextStyle(color: Colors.grey, fontSize: 9),
                ),
                Gap(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_rounded, size: 19),
                    Gap(5),
                    Text(
                      'تحديد الموقع',
                      style: AppStyles.bold13.copyWith(fontSize: 11),
                    ),
                    Gap(5),
                    Icon(Icons.location_on_outlined, size: 19),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final isLoading = state is HomeLoading;

          return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Gap(20),
                CustomTextFieldHome(
                  controller: _searchController,
                  hintText: 'ابحث عن كتاب او مؤلف',
                ),
                Gap(20),
                CustomPromoCard(),
                Gap(20),
                CustomCardHome(),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عرض الكل',
                      style: AppStyles.bold13.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Text('تصفح بالاقسام', style: AppStyles.bold13),
                  ],
                ),
                Gap(20),
                CategorySelector(),
                Gap(20),
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: CircularProgressIndicator(),
                  )
                else if (state is HomeSuccess)
                  CustomGridView(products: state.products),
              ],
            ),
          ),
        ),
      );
        },
      ),
      ),
    );
  }
}
