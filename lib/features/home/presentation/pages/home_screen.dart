import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/constants/app_styles.dart';
import 'package:riwaq/core/di/injection_container.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';
import 'package:riwaq/features/home/presentation/cubit/home_cubit.dart';
import 'package:riwaq/features/home/presentation/cubit/home_state.dart';
import '../widgets/category_ships.dart';
import '../widgets/custom_card_home.dart';
import '../widgets/custom_grid_view.dart';
import '../widgets/custom_promo_card.dart';
import '../widgets/custom_text_field_home.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onAddBookPressed;

  const HomeScreen({super.key, this.onAddBookPressed});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final HomeCubit _cubit = sl<HomeCubit>();
  String? _selectedCategory;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _cubit.getProducts();
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() => _searchQuery = _searchController.text.trim());
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _cubit.loadMore();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  List<String> _getCategories(HomeState state) {
    if (state is! HomeSuccess) return const ['الكل'];
    final categories = state.products.map((p) => p.category).toSet().toList();
    return ['الكل', ...categories];
  }

  List<ProductEntity> _filteredProducts(List<ProductEntity> products) {
    List<ProductEntity> result = products;

    if (_searchQuery.isNotEmpty) {
      result = result
          .where(
            (p) =>
                p.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                p.brand.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    if (_selectedCategory != null && _selectedCategory != 'الكل') {
      result = result.where((p) => p.category == _selectedCategory).toList();
    }

    return result;
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is HomeLoading;

            return SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
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
                      CustomPromoCard(onActivatePressed: widget.onAddBookPressed),
                      Gap(20),
                      CustomCardHome(onAddPressed: widget.onAddBookPressed),
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
                      CategorySelector(
                        categories: _getCategories(state),
                        onCategorySelected: (category) {
                          setState(() => _selectedCategory = category);
                        },
                      ),
                      Gap(20),
                      if (isLoading)
                        const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: CircularProgressIndicator(),
                        )
                      else if (state is HomeSuccess)
                        Builder(
                          builder: (context) {
                            final filtered = _filteredProducts(state.products);
                            if (filtered.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Column(
                                  children: [
                                    Icon(
                                      CupertinoIcons.search,
                                      size: 60,
                                      color: Colors.grey.withValues(alpha: 0.4),
                                    ),
                                    const Gap(16),
                                    Text(
                                      'لا توجد نتائج مطابقة',
                                      style: AppStyles.bold13,
                                    ),
                                    const Gap(6),
                                    Text(
                                      'جرّب كلمة بحث اخرى',
                                      style: AppStyles.bold13.copyWith(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return Column(
                              children: [
                                CustomGridView(
                                  products: filtered,
                                  allProducts: state.products,
                                ),
                                if (state.isLoadingMore)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 16, bottom: 16),
                                    child: CircularProgressIndicator(),
                                  ),
                              ],
                            );
                          },
                        ),
                      const Gap(24),
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
