import 'package:adminpanel/features/events/state/data/model.dart';

abstract class OurEventSampleDataSource{
  Future<List<OurEventModel>> fetchEvents();
}

class OurEventSampleDataSourceImpl extends OurEventSampleDataSource{
  @override
  Future<List<OurEventModel>> fetchEvents() async {
    await Future.delayed(Duration(seconds: 0));

    final List<OurEventModel> events =[
      OurEventModel(
        title: "Job Fair", 
        date: "April 15, 2025", 
        posterUrl: "https://marketplace.canva.com/EAGPwobWTG8/2/0/1131w/canva-blue-and-yellow-modern-job-fair-flyer-cb3YGfT3dKg.jpg"),
      OurEventModel(
        title: "Music Festival",
        date: "May 10, 2025",
        posterUrl: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/modern-music-event-poster-design-template-84e8234cb987682b79142b4839886e47_screen.jpg?ts=1637023328",
      ),
    ];
    return events;
  }
}



abstract class OtherEventSampleDataSource{
  Future<List<OtherEventModel>> fetchEvents();
}

class OtherEventSampleDataSourceImpl extends OtherEventSampleDataSource{
  @override
  Future<List<OtherEventModel>> fetchEvents() async {
    await Future.delayed(Duration(seconds: 0));

    final List<OtherEventModel> events =[
      OtherEventModel(
        title: "Tech Conference",
        date: "March 20, 2025",
        posterUrl: "https://static.vecteezy.com/system/resources/previews/041/180/849/non_2x/technology-event-poster-editor_template.jpeg",
      ),
      OtherEventModel(
        title: "Sports Day",
        date: "June 5, 2025",
        posterUrl: "https://thumbs.dreamstime.com/b/badminton-tournament-banner-template-design-d-realistic-isolated-shuttlecock-championship-invitation-horizontal-poster-351217871.jpg",
      ),
    ];
    return events;
  }
}