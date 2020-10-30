import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String id;
  String name;
  String description;
  String company;
  String phoneNumber;
  String email;
  String address;
  String poster;
  GeoPoint coordinates;
  DateTime start;

  DocumentReference reference;

  EventModel(
      {this.id,
        this.name,
        this.description,
        this.company,
        this.poster,
        this.phoneNumber,
        this.email,
        this.address,
        this.coordinates,
        this.start});

  factory EventModel.fromJson(Map<dynamic, dynamic> json) =>
      _EventModelFromJson(json);

  Map<String, dynamic> toJson() => _EventModelToJson(this);

  Map<String, dynamic> toMap() => _EventModelToMap(this);

  factory EventModel.fromDB(Map<String, dynamic> table) {
    return EventModel(
        id: table['eventId'],
        name: table['name'],
        description: table['description'],
        company: table['company'],
        poster: table['poster'],
        phoneNumber: table['phoneNumber'],
        email: table['email'],
        address: table['address'],
        coordinates: table['coordinates'] != null ? GeoPoint(
            double.parse(table['coordinates'].toString().split(' ')[0]),
            double.parse(table['coordinates'].toString().split(' ')[1])) : null,
        start: DateTime.parse(table['start']));
  }

  @override
  String toString() => "Event <$name>";
}

EventModel _EventModelFromJson(Map<dynamic, dynamic> json) {
  return EventModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    poster: json['poster'] as String,
    company: json['company'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
    address: json['address'] as String,
    coordinates: json['coordinates'] as GeoPoint,
    start: json['start'] == null ? null : (json['start'] as Timestamp).toDate(),
  );
}

Map<String, dynamic> _EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'company': instance.company,
      'poster': instance.poster,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'coordinates': instance.coordinates,
      'start': instance.start,
    };

Map<String, dynamic> _EventModelToMap(EventModel instance) => <String, dynamic>{
  'eventId': instance.id,
  'name': instance.name,
  'description': instance.description,
  'company': instance.company,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'address': instance.address,
  'coordinates': instance.coordinates != null
      ? '${instance.coordinates.latitude} ${instance.coordinates.longitude}'
      : null,
  'start': instance.start.toIso8601String(),
};
