import 'package:firstproject/models/shop_app/search_model.dart';
import 'package:firstproject/modules/shop_app/shop_search/cubit/states.dart';
import 'package:firstproject/shared/components/constants.dart';
import 'package:firstproject/shared/network/remote/dio_helper.dart';
import 'package:firstproject/shared/network/remote/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit <SearchStates>
{
  SearchCubit():super(SearchInitialState()) ;
  static SearchCubit get(context)=>BlocProvider.of(context) ;

  SearchModel searchModel ;
  void userSearch(
  {
  @required String text
}
      )
  {
    emit(SearchLoadingState()) ;
    DioHelper.postData(path: SEARCH , data: {
      'text':text
    } ,authorization: token)
    .then((value){
      searchModel = SearchModel.fromJson(value.data) ;
      emit(SearchSuccessState()) ;
    })
    .catchError((error){
      print (error.toString()) ;
      emit(SearchErrorState()) ;
    });
  }

}