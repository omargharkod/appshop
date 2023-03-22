import 'package:app/layout/shop/cubit/cubit.dart';
import 'package:app/layout/shop/cubit/states.dart';
import 'package:app/models/shopapp/categories_model.dart';
import 'package:app/models/shopapp/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
      if (state is ShopSucsesshomeDataState) {
        return ProductBuilder(ShopCubit.get(context).homeModel!,
            ShopCubit.get(context).categoriesModel!, context);
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

  Widget ProductBuilder(
          HomeModel model, CategoriesModel categoriesModel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                      items: model.data!.banners
                          .map((e) => Image(
                                image: NetworkImage(
                                  '${e.image}',
                                ),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ))
                          .toList(),
                      options: CarouselOptions(
                        height: 250,
                        initialPage: 0,
                        reverse: false,
                        autoPlay: true,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CategoriesBuild(
                              categoriesModel.data!.data[index]);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 5,
                            ),
                        itemCount: categoriesModel.data!.data.length),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'New Product',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      childAspectRatio: 1 / 1.58,
                      children: List.generate(
                          model.data!.products.length,
                          (index) => ProductGridbuilder(
                              model.data!.products[index], context)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget ProductGridbuilder(ProductModel model, context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    model.image!,
                  ),
                  width: double.infinity,
                  height: 200,
                ),
                if (model.discount != 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.red,
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Text(
                  model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '${model.price!}',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.2,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.oldPrice!}',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.2,
                          color: Colors.grey[500],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id!);
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              ShopCubit.get(context).favorite[model.id!]==true ? Colors.deepOrange : Colors.grey,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ))
                  ],
                ),
              ]),
            )
          ],
        ),
      );
  Widget CategoriesBuild(DataModell model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
              model.image!,
            ),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(.8),
            width: 100,
            child: Text(
              model.name!,
              style: TextStyle(
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
}
