import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColorLight,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://static.solved.ac/profile_bg/query-mage/query-mage.png",
                  width: MediaQuery.of(context).size.width + 10,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.08,
                  bottom: -56,
                  width: 80,
                  height: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: TW3Colors.amber.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://static.solved.ac/uploads/profile/360x360/arpaap-picture-1648478267948.png",
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 52),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'arpaap',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '황부연',
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: Colors.grey[800],
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
