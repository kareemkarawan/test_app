import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppText {
    static const heading = TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
    );

    static const subtitle = TextStyle(
        fontSize: 16,
        color: AppColors.subtitle,
    );

    static const cardTitle = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.text,
    );
}