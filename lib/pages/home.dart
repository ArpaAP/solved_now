import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[300]!.withOpacity(0.7),
                width: 1,
              ),
            ),
          ),
          padding: EdgeInsets.fromLTRB(
              10, 8 + MediaQuery.of(context).padding.top, 10, 8),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'SOLVED_NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  visualDensity: VisualDensity.compact,
                  foregroundColor: Colors.grey[700],
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 6,
                  ),
                ),
                child: Badge(
                  backgroundColor: TW3Colors.red,
                  label: Text('3'),
                  child: Icon(TablerIcons.bell),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  visualDensity: VisualDensity.compact,
                  foregroundColor: Colors.grey[700],
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 6,
                  ),
                ),
                child: const Icon(TablerIcons.settings),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                    minWidth: double.infinity,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: TW3Colors.amber.withOpacity(0.5),
                                  spreadRadius: 0.25,
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
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'arpaap',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '황부연 | Buyeon Hwang',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          Icon(
                            TablerIcons.chevron_right,
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          onTap: () {},
                          leading: const Icon(
                            TablerIcons.info_circle,
                            size: 20,
                          ),
                          horizontalTitleGap: 8,
                          title: const Text('오늘 문제를 아직 풀지 않았습니다!'),
                          dense: true,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.lightGreen,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 14,
                                ),
                                height: 110,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '스트릭',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '0일',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '오늘 풀면 1일',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Card(
                              color: Colors.greenAccent,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 14,
                                ),
                                height: 110,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CLASS 3',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '0일',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '달성 시 RATING +50',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Theme.of(context).cardColor,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 14,
                                ),
                                height: 110,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '아레나',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '시작까지 5d 22h',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '미등록',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            '개인 랭킹',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(
                                    fontSizeDelta: -4, color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(child: Divider(thickness: 0.5)),
                        ],
                      ),
                      Column(
                        children: [
                          Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              tileColor: TW3Colors.rose.withOpacity(0.1),
                              hoverColor: TW3Colors.rose.withOpacity(0.15),
                              splashColor: TW3Colors.rose.withOpacity(0.15),
                              onTap: () {},
                              leading: const Icon(
                                Icons.emoji_events,
                                size: 20,
                              ),
                              horizontalTitleGap: 8,
                              title: const Text(
                                'example',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: const Text('AC 레이팅: 3000 | CLASS 10'),
                              dense: true,
                              textColor: TW3Colors.rose,
                              iconColor: TW3Colors.rose,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.grey[600],
                              minimumSize: Size.fromHeight(40),
                            ),
                            child: Text('더보기'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '조직 랭킹',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(
                                    fontSizeDelta: -4, color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(child: Divider(thickness: 0.5)),
                        ],
                      ),
                      Column(
                        children: [
                          Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              tileColor: Colors.grey.withOpacity(0.12),
                              hoverColor: Colors.grey.withOpacity(0.15),
                              splashColor: Colors.grey.withOpacity(0.15),
                              onTap: () {},
                              leading: const Icon(
                                Icons.emoji_events,
                                size: 20,
                              ),
                              horizontalTitleGap: 8,
                              title: const Text(
                                '경북대학교',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text('레이팅: 2959 | 626명 | 8,146문제 해결'),
                              dense: true,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.grey[600],
                              minimumSize: Size.fromHeight(40),
                            ),
                            child: Text('더보기'),
                          )
                        ],
                      ),
                    ],
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
