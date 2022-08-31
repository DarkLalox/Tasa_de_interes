import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/ui/global_controllers/theme_controller.dart';
import 'package:tesis_1/app/ui/pages/home/home_page.dart';

class HomeTabBar extends StatelessWidget {
  HomeTabBar({Key? key}) : super(key: key);
  final _homeController = homeProvider.read;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return SafeArea(
      top: false,
      child: TabBar(
        labelColor: Colors.blue,
        indicator: _CustomIndicator(),
        unselectedLabelColor: isDark ? Colors.white30 : Colors.black26,
        tabs: const [
          Tab(
            icon: Icon(Icons.home_rounded),
          ),
          Tab(
            icon: Icon(Icons.person_rounded),
          ),
        ],
        controller: _homeController.tabController,
      ),
    );
  }
}

class _CustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter();
  }
}

class _CirclePainter extends BoxPainter {
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    final size = configuration.size!;
    final paint = Paint();
    paint.color = Colors.blue;
    final center = Offset(offset.dx + size.width * 0.5, size.height * 0.8);
    canvas.drawCircle(center, 3, paint);
  }
}
