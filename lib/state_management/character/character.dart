import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Store;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:skincare_task/services/api_services.dart';
import 'package:skincare_task/services/models/get_character_details.dart';

part 'character.g.dart';


class CharacterData = _character with _$CharacterData;

abstract class _character with Store {

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  bool _hasException = false;

  @computed
  bool get hasException => _hasException;

  @observable
  CharacterListModel? _characterDetailModel;

  @computed
  CharacterListModel? get characterDetailModel => _characterDetailModel;

  @action
  void putLoading(bool value) => _isLoading = value;

  @action
  void putException(bool value) => _hasException = value;

  @action
  Future<void> getCharacterById(BuildContext context, {required String id}) async{
    putLoading(true);
    putException(false);
    try{
      final graphQlClient = GraphQLProvider.of(context);
      final result = await graphQlClient.value.query(QueryOptions(document: APIServices.getCharacterDetail, variables: {"id": id}));

      if(result.hasException || result.data?['character'] == null) {
        putException(true);
      } else {
        _characterDetailModel = CharacterListModel.fromJson(result.data!['character']);
      }

    } catch(e){
      print("getCharacterByIdError: $e");
    } finally {
      putLoading(false);
    }
  }


}