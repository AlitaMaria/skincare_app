import 'package:graphql_flutter/graphql_flutter.dart';

class APIServices {
  static String baseUrl = 'https://rickandmortyapi.com/graphql';
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static final getEpisodes = gql(r'''
query GetEpisodes($page: Int) {
  episodes(page: $page) {
    info {
      count
      pages
    }
    results {
      id
      name
      air_date
      episode
      characters {
        id
        name
        image
      }
    }
  }
}

''');

  static final getCharacters = gql(r'''
query getCharacters{
  characters{
    results{
      id
      name
      gender
      species
      status
      image
    }
  }
}



''');

  static final getCharacterDetail = gql(r'''
query characterById($id: ID!) {
  character(id: $id) {
    id
    name
    gender
    image
    status
    species
    origin {
      name
      dimension
    }
    location{
      name
      type
      dimension
      
    }
    created
    episode {
      id
      name
      air_date
    }
  }
}

''');
}
