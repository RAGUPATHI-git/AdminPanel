import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/radio_button.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/events/edit%20events/domain/entities.dart';
import 'package:adminpanel/features/events/edit%20events/presentation/cubit/event_cubit.dart';
import 'package:adminpanel/features/events/edit%20events/presentation/screens/responsive%20screens/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEventsMobile extends StatefulWidget {
  const EditEventsMobile({super.key});

  @override
  State<EditEventsMobile> createState() => _EditEventsMobileState();
}

class _EditEventsMobileState extends State<EditEventsMobile> {

  String _selectedValue = 'Our College';
  String _searchQuery = '';
 
  @override
  void initState() {
    super.initState();
    context.read<OurEventCubit>().loadEvents();
    context.read<OtherEventCubit>().loadEvents();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("EDIT / DELETE EVENTS", style: DFont.title),
              Divider(thickness: 1),
              _buildRadioButton(),
              SizedBox(height: 10),
              _buildSearchInput(),
              SizedBox(height: DSizes.xl,),
              Divider(thickness: 1), 
              SizedBox(height: DSizes.xs,),
              _buildEventList(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioButton() {
    return RadioButton(
      label: "",
      options: const ['Our College', 'Other College'],
      selectedValue: _selectedValue,
      onChanged: (value) {
        setState(() {
          _selectedValue= '$value'; 
        });
      },
    );
  }

  Widget _buildSearchInput() {
    return BasicInput(
      label: 'Search for Event',
      onChanged: (value) {
        setState(() {
          _searchQuery = value; 
        });
      },
    );
  }

  Widget _buildEventList(BuildContext context) {
    if (_selectedValue == 'Our College') {
      return BlocBuilder<OurEventCubit, EventState>(
        builder: (context, state) {
          if (state is EventLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EventError) {
            return Center(child: Text(state.message));
          } else if (state is OurEventLoaded) {
            final filteredEvents = state.events.where((event) {
              return event.title.toLowerCase().contains(_searchQuery.toLowerCase());
            }).toList();
            return _ourbuildEventGrid(filteredEvents);
          }
          return Center(child: Text('No events loaded for Our College'));
        },
      );
    } else {
      return BlocBuilder<OtherEventCubit, EventState>(
        builder: (context, state) {
          if (state is EventLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EventError) {
            return Center(child: Text(state.message));
          } else if (state is OtherEventLoaded) {
            final filteredEvents = state.events.where((event) {
              return event.title.toLowerCase().contains(_searchQuery.toLowerCase());
            }).toList();
            return _otherbuildEventGrid(filteredEvents);
          }
          return Center(child: Text('No events loaded for Other College'));
        },
      );
    }
  }

  Widget _ourbuildEventGrid(List<OurEventEntity> events) {
    return GridView.count(
      shrinkWrap: true, // To lay out RenderBox properly
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: events.map((event) {
        return EventCard(
          title: event.title,
          date: event.date,
          posterUrl: event.posterUrl,
          onEdit: (newTitle, newDate, newPosterUrl) {
          },
          onDelete: () {
          },
        );
      }).toList(),
    );
  }

  Widget _otherbuildEventGrid(List<OtherEventEntity> events) {
    return GridView.count(
      shrinkWrap: true, 
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: events.map((event) {
        return EventCard(
          title: event.title,
          date: event.date,
          posterUrl: event.posterUrl,
          onEdit: (newTitle, newDate, newPosterUrl) {
          },
          onDelete: () {
          },
        );
      }).toList(),
    );
  }
}