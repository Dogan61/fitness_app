import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    required this.cardTitle,
    required this.assetPath,
    required this.onPlay,
    required this.onStar,
    super.key,
    this.durationLabel = '12 Min',
    this.caloriesLabel = '120 Kcal',
  });

  final VoidCallback? onPlay;
  final VoidCallback? onStar;
  final String assetPath;
  final String cardTitle;
  final String durationLabel;
  final String caloriesLabel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppConstants.authBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.8),
            width: 1.5,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14.5),
                  ),
                  child: Image.asset(
                    assetPath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppConstants.authAccent,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _ExerciseMetaRow(
                        durationLabel: durationLabel,
                        caloriesLabel: caloriesLabel,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: onPlay,
                child: const Icon(
                  Icons.star,
                  color: AppConstants.authAccent,
                  size: 20,
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 85,
              child: InkWell(
                onTap: onStar,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppConstants.authPurple,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseMetaRow extends StatelessWidget {
  const _ExerciseMetaRow({
    required this.durationLabel,
    required this.caloriesLabel,
  });

  final String durationLabel;
  final String caloriesLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.access_time_filled,
          color: AppConstants.authPurple,
          size: 14,
        ),
        const SizedBox(width: 4),
        Text(
          durationLabel,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
        const Spacer(),
        const Icon(
          Icons.whatshot,
          color: AppConstants.authPurple,
          size: 14,
        ),
        const SizedBox(width: 4),
        Text(
          caloriesLabel,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      ],
    );
  }
}
