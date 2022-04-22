const apiKey = '2820f58b955da20704b0c366ff26889b';
const tmdb = 'https://api.themoviedb.org/3';

class TMDB {
  static const trending = '$tmdb/trending/all/day?api_key=$apiKey';
  static const imageId = 'https://image.tmdb.org/t/p/original';
  static const upComing = '$tmdb/movie/upcoming?api_key=$apiKey';
}
