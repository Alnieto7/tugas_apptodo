import 'package:flutter/material.dart';
import 'package:tugas_apptodo/color/app_colors.dart';


class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final VoidCallback? onTap;
  final bool isCompleted;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.onTap,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: TextStyle(
            color: isCompleted ? Colors.grey : AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(description),
        trailing: Chip(
          label: Text(category),
          backgroundColor: AppColors.secondary.withOpacity(0.2),
          labelStyle: const TextStyle(color: AppColors.secondary),
        ),
      ),
    );
  }
}
