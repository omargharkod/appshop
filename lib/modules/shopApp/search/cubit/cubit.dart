import 'package:app/modules/shopApp/search/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/shopapp/search_model.dart';
import '../../../../shared/componants/constants.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(SearchInitialStates());
  static SearchCubit get(context)=>BlocProvider.of(context);
  SearchModel? searchModel;
  void Search(String text){
    emit(SearchLoadingStates());
    DioHelper.postData(url:SEARCH,token: token, data: {
      'text':text,
    }).then((value){
      searchModel=SearchModel.fromJson(value.data);
      emit(SearchSuccesslStates());
    }).catchError((error){
      emit(SearchErrorStates());
    });
  }

}