import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/models/user/user.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader(this.user, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Stack(
        children: [
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorDark,
                ],
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 46.0,
                backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAWq2iA4NXgB9MDHzNPTLcFvguGh_R13qep7Z8XNiEcFwIBKuJU9Q2VQ3oVo7zTZcOkrJXqPoVFOhRoiDKkJTlGcPPqohfu08Q8Htb4m5K8hjmdmUyL25KqU1FO3JqHYMeFU0fwA150VVgio3ZvO-IWKCSTE5OspWULRVGPHQ7NOdmg2k4anlLjNceVQkLP0kpWbhTKLYrFBjZtmhzEVjxrOv9pOdWrbsPnovX_ha6nzPI2dMr1wWTWdzIbi-xljHnAmp0sFXEZYNzK',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(
                    context,
                  ).primaryColorDark.withValues(alpha: 0.2),
                ),
                child: Icon(
                  Icons.edit,
                  size: 14,
                  color: const Color(0xFF043C1C),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      Text(
        user.fullName,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 22.0,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
        ),
      ),
      const SizedBox(height: 4.0),
      Text(
        user.email,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade500,
        ),
      ),
    ],
  );
}
