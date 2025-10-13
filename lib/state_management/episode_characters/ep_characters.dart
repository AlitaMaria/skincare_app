import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Store;
import 'package:mobx/mobx.dart';
import 'package:skincare_task/services/api_services.dart';

import '../../services/models/episode_characters.dart';

part 'ep_characters.g.dart';

class EpisodeCharactersMob = _EpisodeCharactersMob with _$EpisodeCharactersMob;

abstract class _EpisodeCharactersMob with Store {
  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  bool _hasException = false;

  @computed
  bool get hasException => _hasException;

  @observable
  EpisodeCharactersModel? _episodeCharactersModel;

  @computed
  EpisodeCharactersModel? get episodeCharactersModel => _episodeCharactersModel;

  @action
  void setLoading(bool value) => _isLoading = value;

  @action
  void setException(bool value) => _hasException = value;

  @action
  Future<void> getEpCharacters(BuildContext context, {required String id}) async {
    setLoading(true);
    setException(false);

    try {
      final graphQlClient = GraphQLProvider.of(context);

      final result = await graphQlClient.value.query(
        QueryOptions(
          document: APIServices.getEpisodeCharacters,
          variables: {"id": id},

        ),
      );

      if (result.hasException || result.data == null) {
        setException(true);
      } else {
        // log(jsonEncode(result.data));

        _episodeCharactersModel = EpisodeCharactersModel.fromJson(result.data!);
      }
    } catch (e) {
      setException(true);
      print("GetEpisodeCharactersError: $e");
    } finally {
      setLoading(false);
      // debugPrint(_episodeCharactersModel?.toJson().toString());


    }
  }
}
