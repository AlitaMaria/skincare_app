import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Store;

import '../../services/api_services.dart';
import '../../services/models/character_list_model.dart';


part 'characterlist.g.dart';


class CharacterListing = _characterListing with _$CharacterListing;

abstract class _characterListing with Store {
  // Observable to track loading state
  @observable
  bool _isTapped = false;

  @computed
  bool get isTapped => _isTapped;


  @observable
  int _currentPage = 1;

  @computed
  int get currentPage => _currentPage;

  @observable
  bool _hasException = false;

  @computed
  bool get hasException => _hasException;

  @observable
  ObservableList<String> _favorites = ObservableList<String>();

  @computed
  ObservableList<String> get favorites => _favorites;

  @observable
  ObservableList<Result> _wishlistItems = ObservableList<Result>();

  @computed
  ObservableList<Result> get wishlistItems => _wishlistItems;

  @observable
  int refreshCounter=0;

  // Observable for character list model
  @observable
  CharacterListModel? _characterListModel;

  @computed
  CharacterListModel? get characterListModel => _characterListModel;

  // Action to update exception status
  @action
  void putException(bool value) => _hasException = value;

  // Action to update loading state
  @action
  void tappingId(bool value) => _isTapped = value;

  @action
  void setPage(int value) => _currentPage = value;



  @action
  void toggleFavorite(String id, Result item) {
    if (_wishlistItems.contains(item)) {
      _favorites.remove(id);
      _wishlistItems.remove(item);

    } else {
       _favorites.add(id);
      _wishlistItems.add(item);
    }
  }

  @action
void refreshPage(){
    refreshCounter++;
  }  // Action to fetch characters from API
  @action
  Future<void> card(BuildContext context, {int currentPage = 1}) async {
    tappingId(true);
    putException(false);

    try {
      final graphQlClient = GraphQLProvider.of(context);

      final result = await graphQlClient.value.query(
        QueryOptions(
          document: APIServices.pageNavigation,
          variables: {'page': _currentPage},
        ),
      );

      if (result.hasException || result.data == null) {
        putException(true);
      } else {
        _characterListModel = CharacterListModel.fromJson(result.data!);
      }
    } catch (e) {
      print(e);
      putException(true);
    } finally {
      tappingId(false);
    }
  }
}
