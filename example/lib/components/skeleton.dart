import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

import '../state.dart';

class SkeletonShowcase extends StatefulWidget {
  @override
  _SkeletonShowcaseState createState() => _SkeletonShowcaseState();
}

class _SkeletonShowcaseState extends ShowcaseState<SkeletonShowcase> {
  @override
  Widget playgroundBuilder() {
    return SizedBox();
  }

  @override
  String get showcaseName => 'App Bar';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Skeleton',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              Container(
                height: 16,
                // width: 80,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 16,
                // width: 80,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 16,
                // width: 80,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 16,
                // width: 80,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 16,
                // width: 80,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: NeSkeleton(
                  borderRadius: BorderRadius.circular(5),
                  type: NeSkeletonAnimationType.shimmer
                ),
              ),
            ],
          ),
        ),
      ];
}
