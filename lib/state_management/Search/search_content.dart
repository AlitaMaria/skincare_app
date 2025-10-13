import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart'hide Store;
import 'package:mobx/mobx.dart';
import 'package:skincare_task/services/api_services.dart';
import 'package:skincare_task/services/models/search_model.dart';
part 'search_content.g.dart';

class SearchContent=_SearchContent with _$SearchContent;
abstract class _SearchContent with Store{
  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  bool _hasException = false;

  @computed
  bool get hasException => _hasException;

  @observable
  Getsearchmodel? _searchModel;

  @computed
  Getsearchmodel? get searchModel => _searchModel;

  @action
  void setLoading(bool value) => _isLoading = value;

  @action
  void setException(bool value) => _hasException = value;

  @action
  void clearSearchModel() => _searchModel = null;

  @ action
  Future<void>getSearchCharacters(BuildContext context, {required String Search})async{
    setLoading(true);
    setException(false);
    try{
      final graphQlClient= GraphQLProvider.of(context);
      final result= await graphQlClient.value.query(QueryOptions(document: APIServices.getsearch,
      variables: {"Search":Search}));
      if(result.hasException|| result.data== null){
        setException(true);
      }else{
        _searchModel=Getsearchmodel.fromJson(result.data!);
      }
    }catch(e){
      setException(true);
      print("Error:$e");
    }finally{
      setLoading(false);
    }

  }

}