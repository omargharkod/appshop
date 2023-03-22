import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../layout/shop/cubit/cubit.dart';
import '../../layout/shop/cubit/states.dart';
import '../../models/shopapp/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
      if (state is ShopSucsessCategoriesState) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildCatItem(
              ShopCubit.get(context).categoriesModel!.data!.data[index]),
          separatorBuilder: (context, index) {
            return Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            );
          },
          itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
        );
      }
      // if (state is ShopSucsessCategoriesState) {
      //   return ProductBuilder(ShopCubit.get(context).homeModel!,
      //       ShopCubit.get(context).categoriesModel!);
      // }
      else {
        return SpinKitThreeBounce(
          color: Colors.deepOrange,
          size: 30.0,
        );
      }
    });
  }

  Widget buildCatItem(DataModell model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(model.image!),
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              model.name!,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      );
}
