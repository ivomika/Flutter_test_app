import 'package:flutter/cupertino.dart';

class CircleTabIndicator extends Decoration{
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}


class _CirclePainter extends BoxPainter{
  final Color color;
  final double radius;

  const _CirclePainter({required this.color, required this.radius});

  Offset getCircleOffset(ImageConfiguration configuration){
    return Offset(configuration.size!.width/2-radius/2, configuration.size!.height-radius);
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = getCircleOffset(configuration);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
}