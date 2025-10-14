import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Store;

import '../../services/api_services.dart';
import '../../services/models/character_list_model.dart';
part 'detailcharacter.g.dart';


class DetailCharacter =_DetailCharacter with _$DetailCharacter;
abstract class _DetailCharacter with Store{

  @observable
  bool _istapped=false;

  @computed
  bool get istapped=>_istapped;

  @observable
  bool _hasException= false;

@computed
bool get hasException=>_hasException;

@observable
CharacterListModel? _characterListModel;

@computed
CharacterListModel? get characterListModel=>_characterListModel;

  @action
  void putException(bool value) => _hasException = value;

 @action
  void tapingId(bool value) => _istapped = value;

 @action
  Future<void> card(BuildContext context)async{
   tapingId(true);
   putException(false);
   try{
     final graphQlClient = GraphQLProvider.of(context);
     final result = await graphQlClient.value.query(QueryOptions(document: APIServices.getCharacters));
   if(result.hasException|| result.data==null){
     putException(true);
     }
   else{
     _characterListModel=CharacterListModel.fromJson(result.data!);
     }

   }catch(e){
     print(e);
     }
   finally {
     tapingId(false);
   }



 }
}