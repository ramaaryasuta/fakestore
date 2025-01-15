import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../cart/cubit/cart_cubit.dart';
import '../../cart/ui/cart_page.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';
import 'widgets/product_card.dart';
import 'widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<HomeCubit>().getProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FakeStore'),
        elevation: 2,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CartPage();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Icon(Icons.shopping_cart),
                  ),
                  if (context.watch<CartCubit>().cart.isNotEmpty)
                    Container(
                      width: 14,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        context.watch<CartCubit>().cart.length.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeLoaded) {
                    return MasonryGridView.builder(
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return ProductCard(
                            product: product,
                            title: product.title,
                            price: product.price.toString(),
                            description: product.description,
                            image: product.imageUrl,
                            isFirst: index == 0,
                          );
                        });
                  } else {
                    return Center(child: Text('Something went wrong'));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
