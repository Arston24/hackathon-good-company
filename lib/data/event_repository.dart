


import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/event.dart';

class EventRepository {

  final db = FirebaseFirestore.instance;

  Future<List<EventModel>> getEvents() async {
    var events = <EventModel>[];
    var docs = await db.collection('events').getDocuments();
    docs.docs.forEach((element) {
      events.add(EventModel.fromJson(element.data()));
    });
    return events;
  }


  Future<EventModel> getEvent(String eventId) async {
    var doc = await db.collection('events').doc(eventId).get();
    return EventModel.fromJson(doc.data());
  }


}