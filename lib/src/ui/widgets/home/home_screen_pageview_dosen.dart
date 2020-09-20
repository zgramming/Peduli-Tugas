import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import 'home_screen_selected_pageview.dart';
import 'package:my_provider/my_provider.dart';
import 'home_screen_unselected_pageview.dart';

class HomeScreenPageViewDosen extends StatefulWidget {
  @override
  _HomeScreenPageViewDosenState createState() => _HomeScreenPageViewDosenState();
}

class _HomeScreenPageViewDosenState extends State<HomeScreenPageViewDosen>
    with TickerProviderStateMixin {
  Animation<double> _scaleAnimation;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _scaleAnimation = Tween<double>(begin: .7, end: 1).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    print('called dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes.height(context) / 3,
      child: Consumer(
        builder: (context, watch, _) {
          print('triggered');
          final dosen = watch(limitedDosen);
          final indexPageView = watch(GlobalIndexPageView).state;
          if (dosen == null || dosen.isEmpty) {
            return Center(child: Text('Daftar dosen kosong'));
          }
          return PageView.builder(
            controller: PageController(viewportFraction: .5),
            onPageChanged: (value) {
              context.read(GlobalIndexPageView).state = value;
              if (context.read(GlobalIndexPageView).state == value) {
                _controller.reset();
                _controller.forward();
              }
            },
            itemBuilder: (context, index) {
              final result = dosen[index];

              if (indexPageView != index) {
                return HomeScreenUnselecPageView(result: result);
              }
              if (indexPageView == index) {
                return HomeScreenSelectedPageView(scaleAnimation: _scaleAnimation, result: result);
              }
              return SizedBox();
              // return Image.memory(base64.decode(result.imageDosen));
            },
            itemCount: dosen.length,
          );
        },
      ),
    );
  }
}
