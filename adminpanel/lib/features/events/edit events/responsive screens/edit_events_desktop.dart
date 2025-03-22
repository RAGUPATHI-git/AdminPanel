import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/icons.dart';
import 'package:adminpanel/core/constants/input fields/radio_button.dart';
import 'package:adminpanel/core/constants/input fields/basic_input.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/events/edit events/responsive screens/widgets/event_card.dart';
import 'package:adminpanel/features/events/state/business_logic/entities.dart';
import 'package:adminpanel/features/events/state/business_logic/repositaries.dart';
import 'package:adminpanel/features/events/state/business_logic/usecase.dart';
import 'package:adminpanel/features/events/state/presentation/cubit/event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEventsDesktop extends StatefulWidget {
  const EditEventsDesktop({super.key});

  @override
  _EditEventsDesktopState createState() => _EditEventsDesktopState();
}

class _EditEventsDesktopState extends State<EditEventsDesktop> {
  String _selectedValue = 'Our College'; 
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OurEventCubit(
              OurEventUseCase(RepositoryProvider.of<OurEventRepositary>(context))),
        ),
        BlocProvider(
          create: (context) => OtherEventCubit(
              OtherEventUseCase(RepositoryProvider.of<OtherEventRepositary>(context))),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("EDIT / DELETE EVENTS", style: DFont.title),
                Divider(thickness: 1),
                _buildRadioButton(),
                _buildSearchInput(),
                SizedBox(height: DSizes.xl),
                Divider(thickness: 1),
                SizedBox(height: DSizes.xs),
                _buildEventList(context),
              ],
            ),
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
          _selectedValue = _selectedValue; 
        });
      },
    );
  }

  Widget _buildSearchInput() {
    return BasicInput(
      label: 'Search for Event',
      onChanged: (value) {
        setState(() {
          _searchQuery = _searchQuery; 
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
      crossAxisCount: 3,
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
      crossAxisCount: 3,
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
