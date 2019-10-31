import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class CustomLayout extends MultiChildRenderObjectWidget {

  CustomLayout( { Key key, List<Widget> children = const <Widget>[] } ) : super( key: key, children: children );

  @override
  RenderCustomLayoutBox createRenderObject(BuildContext context) {
    return RenderCustomLayoutBox();
  }

}

class RenderCustomLayoutBox extends RenderBox
    with ContainerRenderObjectMixin<RenderBox, CustomLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, CustomLayoutParentData> {

  RenderCustomLayoutBox({List<RenderBox> children,}){
    addAll(children);
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! CustomLayoutParentData) {
      child.parentData = CustomLayoutParentData();
    }
  }

  double _getIntrinsicHeight(double childSize(RenderBox child)) {
    double inflexibleSpace = 0.0;
    RenderBox child = firstChild;
    while (child != null) {
      if (child == lastChild)
        break;
      inflexibleSpace += childSize(child);
      final FlexParentData childParentData = child.parentData;
      child = childParentData.nextSibling;
    }
    return inflexibleSpace;
  }

  double _getIntrinsicWidth(double childSize(RenderBox child)) {
    double maxSpace = 0.0;
    RenderBox child = firstChild;
    while (child != null) {
      if (child == lastChild)
        break;
      maxSpace = math.max(maxSpace, childSize(child));
      final FlexParentData childParentData = child.parentData;
      child = childParentData.nextSibling;
    }
    return maxSpace;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return _getIntrinsicWidth((RenderBox child) => child.getMinIntrinsicWidth(height));
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _getIntrinsicWidth((RenderBox child) => child.getMaxIntrinsicWidth(height));
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _getIntrinsicHeight((RenderBox child) => child.getMinIntrinsicHeight(width));
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _getIntrinsicHeight((RenderBox child) => child.getMaxIntrinsicHeight(width));
  }

  @override
  void performLayout() {
    if (childCount == 0) {
      size = constraints.biggest;
      assert(size.isFinite);
      return;
    }

    double width = constraints.maxWidth;
    double height = 0;

    RenderBox child = firstChild;
    while (child != null) {
      if (child == lastChild)
        break;

      final CustomLayoutParentData childParentData = child.parentData;

      child.layout(BoxConstraints.tightFor(width: width), parentUsesSize: true);
      childParentData.offset = Offset(0, height);

      final Size childSize = child.size;
      width = math.max(width, childSize.width);
      height += childSize.height;

      child = childParentData.nextSibling;
    }

    size = Size(width, height);

    lastChild.layout(BoxConstraints(maxWidth: width, maxHeight: height), parentUsesSize: true);
    final CustomLayoutParentData childParentData = lastChild.parentData;
    final double margin = 20;
    final double x = size.width - lastChild.size.width - margin;
    final double y = height - childParentData.previousSibling.size.height - lastChild.size.height / 2;
    childParentData.offset = Offset(x, y);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(HitTestResult result, { Offset position }) {
    return defaultHitTestChildren(result, position: position);
  }
}

class CustomLayoutParentData extends ContainerBoxParentData<RenderBox> {

}