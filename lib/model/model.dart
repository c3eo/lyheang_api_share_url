import 'dart:convert';

class User {
  final List<Result> results;

  User({
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      results: List<Result>.from(map['results']?.map((x) => Result.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

class Result {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final DateOfBirth dob;
  final String phone;
  final String cell;
  final Picture picture;

  Result({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.dob,
    required this.phone,
    required this.cell,
    required this.picture,
  });

  String get fullname => "${name.title} ${name.first} ${name.last}";

  String get information =>
      'Name: $fullname\nGender: $gender\nEmail: $email\nPhone: $phone';

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'name': name.toMap(),
      'location': location.toMap(),
      'email': email,
      'dob': dob.toMap(),
      'phone': phone,
      'cell': cell,
      'picture': picture.toMap(),
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      gender: map['gender'],
      name: Name.fromMap(map['name']),
      location: Location.fromMap(map['location']),
      email: map['email'],
      dob: DateOfBirth.fromMap(map['dob']),
      phone: map['phone'],
      cell: map['cell'],
      picture: Picture.fromMap(map['picture']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      title: map['title'],
      first: map['first'],
      last: map['last'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source));
}

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final Coordinate coordinates;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
  });

  String get location => '$city, $state, $country';

  Map<String, dynamic> toMap() {
    return {
      'street': street.toMap(),
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
      'coordinates': coordinates.toMap(),
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      street: Street.fromMap(map['street']),
      city: map['city'],
      state: map['state'],
      country: map['country'],
      postcode: map['postcode'],
      coordinates: Coordinate.fromMap(map['coordinates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));
}

class Coordinate {
  final String latitude;
  final String longitude;

  Coordinate({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Coordinate.fromMap(Map<String, dynamic> map) {
    return Coordinate(
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinate.fromJson(String source) =>
      Coordinate.fromMap(json.decode(source));
}

class Street {
  final int number;
  final String name;

  Street({
    required this.number,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
    };
  }

  factory Street.fromMap(Map<String, dynamic> map) {
    return Street(
      number: map['number'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Street.fromJson(String source) => Street.fromMap(json.decode(source));
}

class DateOfBirth {
  final String date;
  final int age;

  DateOfBirth({
    required this.date,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'age': age,
    };
  }

  factory DateOfBirth.fromMap(Map<String, dynamic> map) {
    return DateOfBirth(
      date: map['date'],
      age: map['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DateOfBirth.fromJson(String source) =>
      DateOfBirth.fromMap(json.decode(source));
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }

  factory Picture.fromMap(Map<String, dynamic> map) {
    return Picture(
      large: map['large'],
      medium: map['medium'],
      thumbnail: map['thumbnail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Picture.fromJson(String source) =>
      Picture.fromMap(json.decode(source));
}
