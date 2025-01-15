import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/auth/cubits/auth_cubit.dart';
import '../pages/home/cubits/home_cubit.dart';
import '../pages/cart/cubit/cart_cubit.dart';
import 'locale/locale_cubit.dart';

List<BlocProvider> providers = [
  BlocProvider<LocaleCubit>(
    create: (context) => LocaleCubit(),
  ),
  BlocProvider<HomeCubit>(
    create: (context) => HomeCubit(),
  ),
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(),
  ),
  BlocProvider<CartCubit>(create: (context) => CartCubit()),
];
