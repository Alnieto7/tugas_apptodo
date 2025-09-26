import 'package:flutter/material.dart';
import 'package:tugas_apptodo/color/app_colors.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String? date;
  final String? time;
  final VoidCallback? onTap;
  final VoidCallback? onCheckboxChanged;
  final bool isCompleted;
  final bool showCheckbox;
  final bool showEditButton;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.date,
    this.time,
    this.onTap,
    this.onCheckboxChanged,
    this.isCompleted = false,
    this.showCheckbox = true,
    this.showEditButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isCompleted ? Colors.grey[200] : Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox (optional)
            if (showCheckbox)
              Checkbox(
                value: isCompleted,
                activeColor: AppColors.primary,
                onChanged: onCheckboxChanged != null ? (_) => onCheckboxChanged!() : null,
              ),

            // Isi Card
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: isCompleted ? TextDecoration.lineThrough : null,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      Chip(
                        label: Text(category),
                        backgroundColor: AppColors.secondary.withOpacity(0.2),
                        labelStyle: const TextStyle(
                          color: AppColors.secondary,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      if (date != null && time != null)
                        Text(
                          "📅 $date | ⏰ $time",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            // Tombol Edit (optional)
            if (showEditButton)
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: onTap,
              ),
          ],
        ),
      ),
    );
  }
}