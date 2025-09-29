

class Person {
  Person({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  Person.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
Person copyWith({  num? page,
  List<Results>? results,
  num? totalPages,
  num? totalResults,
}) => Person(  page: page ?? this.page,
  results: results ?? this.results,
  totalPages: totalPages ?? this.totalPages,
  totalResults: totalResults ?? this.totalResults,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

/// adult : false
/// gender : 1
/// id : 3164807
/// known_for_department : "Acting"
/// name : "Yoon Yool"
/// original_name : "윤율"
/// popularity : 33.1661
/// profile_path : "/21kdujBeL2hrJ50RyMxmuEsHZAT.jpg"
/// known_for : [{"adult":false,"backdrop_path":"/ein8yLBzWn6GllqfeagclestBUe.jpg","id":865463,"title":"24 Year Old Yoon Yul's Sexy Breasts","original_title":"24살윤율의섹시한젖가슴","overview":"Rookie actor Yunyul! Although she looks innocent, her secret private life is revealed in detail.  Sexy glamor rookie actor Yunyul’s breathtaking talk begins! Yunyul, who has a beautiful model body line and a bursting breast, but with a face that combines soft innocence and contradictory charm!  It boasts a voluptuous, powerful hardware since its debut early and came to the hottest Newcomer together many fans successfully her first interview with the film anchakhan the debut of receive the love of 2020  from an episode from the debut course she speaks to date Her anti-war charm, honestly revealing her usual dating course with the opposite sex she dreamed of! The honest interview of 24-year-old Yunyul begins.","poster_path":"/qvGkjlLjTy1nxClxpw2BiUS6jHB.jpg","media_type":"movie","original_language":"ko","genre_ids":[18,10749],"popularity":10.9218,"release_date":"2021-03-01","video":false,"vote_average":7.3,"vote_count":19},{"adult":false,"backdrop_path":"/xk6r10zcCwbGCD5etRiCBuUTzen.jpg","id":854670,"title":"Invited Delivery Man","original_title":"초대받은 배달부","overview":"Sexually lustful pizza delivery woman, Seung-ha VS customer who wants to swap, Yoon-yool. The Hye-jin couple, who advocate free sex, point to the pizza delivery man Ji-yeong and Dal-soo as partners to enjoy with them, and execute an erotic operation. When Ji-yeong arrives, Hye-jin's husband shows off his erection, and when Dal-soo arrives, he seduces her with his chest and erotic poses. During the delivery, Ji-yeong witnesses Hye-jin and Jeong-woo, a Chinese restaurant delivery man, having a love affair at the entrance of an apartment.","poster_path":"/arRlboIzWHDkOLn6nWR42KqI4qL.jpg","media_type":"movie","original_language":"ko","genre_ids":[10749,18],"popularity":11.134,"release_date":"2020-12-25","video":true,"vote_average":8.1,"vote_count":7},{"adult":false,"backdrop_path":"/edWLroWMgRObxyX7r9CYek5Gtsf.jpg","id":938092,"title":"Call Center Accepts Everything","original_title":"다 받아주는 콜센터","overview":"Female employees of the call center work as customer counselors for a company that sells adult products. Under the company's policy of unconditionally satisfying customers, the hardships of employees who always have to endure the customer's power abuse continue. Manager Jang and new employee Yoo-ri, who have long endured and worked under team leader Kang, who wields female employees with his own power, appear in front of Joo-ri. Yoo0ri, who was in charge of Gyejinsang, one of the company's blacklists, as soon as she came. And Joo-ri, who made an unexpected friend with foreign customer Kenny.","poster_path":"/o1FtZCiFtdxdbQ4NlttPhJlRTQ7.jpg","media_type":"movie","original_language":"ko","genre_ids":[18,10749],"popularity":3.5993,"release_date":"2021-10-05","video":false,"vote_average":5,"vote_count":3}]

class Results {
  Results({
      this.adult, 
      this.gender, 
      this.id, 
      this.knownForDepartment, 
      this.name, 
      this.originalName, 
      this.popularity, 
      this.profilePath, 
      this.knownFor,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor?.add(KnownFor.fromJson(v));
      });
    }
  }
  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  List<KnownFor>? knownFor;
Results copyWith({  bool? adult,
  num? gender,
  num? id,
  String? knownForDepartment,
  String? name,
  String? originalName,
  num? popularity,
  String? profilePath,
  List<KnownFor>? knownFor,
}) => Results(  adult: adult ?? this.adult,
  gender: gender ?? this.gender,
  id: id ?? this.id,
  knownForDepartment: knownForDepartment ?? this.knownForDepartment,
  name: name ?? this.name,
  originalName: originalName ?? this.originalName,
  popularity: popularity ?? this.popularity,
  profilePath: profilePath ?? this.profilePath,
  knownFor: knownFor ?? this.knownFor,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    if (knownFor != null) {
      map['known_for'] = knownFor?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class KnownFor {
  KnownFor({
      this.adult, 
      this.backdropPath, 
      this.id, 
      this.title, 
      this.originalTitle, 
      this.overview, 
      this.posterPath, 
      this.mediaType, 
      this.originalLanguage, 
      this.genreIds, 
      this.popularity, 
      this.releaseDate, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  KnownFor.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  num? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  String? originalLanguage;
  List<num>? genreIds;
  num? popularity;
  String? releaseDate;
  bool? video;
  num? voteAverage;
  num? voteCount;
KnownFor copyWith({  bool? adult,
  String? backdropPath,
  num? id,
  String? title,
  String? originalTitle,
  String? overview,
  String? posterPath,
  String? mediaType,
  String? originalLanguage,
  List<num>? genreIds,
  num? popularity,
  String? releaseDate,
  bool? video,
  num? voteAverage,
  num? voteCount,
}) => KnownFor(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  id: id ?? this.id,
  title: title ?? this.title,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  posterPath: posterPath ?? this.posterPath,
  mediaType: mediaType ?? this.mediaType,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  genreIds: genreIds ?? this.genreIds,
  popularity: popularity ?? this.popularity,
  releaseDate: releaseDate ?? this.releaseDate,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['title'] = title;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['original_language'] = originalLanguage;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = releaseDate;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}