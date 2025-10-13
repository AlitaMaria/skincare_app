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
  static final getEpisodeCharacters=gql(r'''
  query GetEpisode($id: ID!) {
  episode(id: $id) {
    id
    name
    characters {
      name
      gender
      image
    }
  }
}

  ''');

  static final getsearch=gql(r'''
  query getCharacters($Search: String){
  characters(filter:{name: $Search}){
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

  static final pageNavigation=gql(r'''
  
  query characters($page: Int) {
  
  characters(page: $page) {
    info {
      count
      pages
      next
      prev
    }
    results {
      
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
}
