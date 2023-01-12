import 'package:flutter/material.dart';
import 'package:taskamo/data-models/event/events.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({
    Key? key,
    this.eventModel,
  }) : super(key: key);
  final EventModel? eventModel;

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  late TextEditingController title;
  late TextEditingController date;

  //TODO date picker
  //TODO if event null trigger create event then refresh
  //TODO else trigger edit event then refresh

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if(widget.eventModel != null){
    //   return Container();
    // }else{
    return Container();
    // }
  }
}
