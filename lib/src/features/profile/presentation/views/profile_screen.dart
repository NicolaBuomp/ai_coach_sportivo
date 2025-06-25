import 'package:ai_coach_sportivo/src/core/config/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.pushNamed(editProfileRoute),
        child: const Text('Edit Profile'),
      ),
    );
  }
}
