import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const QuestionCard({
    super.key,
    required this.question,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.09),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 14,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              question,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            onPressed: onFavoriteToggle,
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border_outlined,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
