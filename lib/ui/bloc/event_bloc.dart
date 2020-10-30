

import 'dart:async';

import 'package:hackathon_gc/data/event_repository.dart';
import 'package:hackathon_gc/data/model/event.dart';

class EventBloc {

  var eventRepository = EventRepository();


  final _eventsController = StreamController<List<EventModel>>.broadcast();

  Stream<List<EventModel>> get events => _eventsController.stream;

  void getEvents() async {
    var events = await eventRepository.getEvents();
    _eventsController.sink.add(events);
  }

}