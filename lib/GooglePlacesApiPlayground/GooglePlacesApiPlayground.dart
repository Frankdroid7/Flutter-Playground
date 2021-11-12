import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/GooglePlacesApiPlayground/PlaceService.dart';

class GooglePlacesApiPlayground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for location...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (value) async {
              // generate a new token here
              final sessionToken = Uuid().v4();
              List<Suggestion> placesSuggestion =
                  await PlaceService(sessionToken).fetchSuggestions(value);
              print('placesSuggestion ->>>> $placesSuggestion');
            },
          ),
        ),
      ],
    );
  }
}
