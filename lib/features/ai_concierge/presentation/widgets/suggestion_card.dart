import 'package:flutter/material.dart';
import '../../models/ai_suggestion.dart';

class SuggestionCard extends StatelessWidget {
  final AiSuggestion suggestion;

  const SuggestionCard({super.key, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(suggestion.title),
        subtitle: Text(suggestion.description),
        trailing: Text('${suggestion.price} ريال'),
        onTap: () => Navigator.pushNamed(context, suggestion.route),
      ),
    );
  }
}
