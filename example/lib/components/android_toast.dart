import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

class AndroidToastShowcase extends StatefulWidget {
  @override
  _AndroidToastShowcaseState createState() => _AndroidToastShowcaseState();
}

class _AndroidToastShowcaseState extends ShowcaseState<AndroidToastShowcase> {
  @override
  Widget playgroundBuilder() {
    return SizedBox();
  }

  @override
  String get showcaseName => 'Android Style Toast';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'AndroidToast',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeButton(
                  label: Text('Normal toast'),
                  onTap: () {
                    showToast('This is toast',
                        context: context,
                        axis: Axis.horizontal,
                        alignment: Alignment.center,
                        position: AndroidToastPosition.bottom);
                  }),
              NeButton(
                  label: Text('Normal toast full width'),
                  onTap: () {
                    showToast(
                      'This is normal',
                      context: context,
                      axis: Axis.horizontal,
                      alignment: Alignment.center,
                      position: AndroidToastPosition.bottom,
                      toastHorizontalMargin: 0,
                      fullWidth: true,
                    );
                  }),
              NeButton(
                  label: Text('full width with horizontal margin'),
                  onTap: () {
                    showToast(
                      'This is normal',
                      context: context,
                      axis: Axis.horizontal,
                      alignment: Alignment.center,
                      position: AndroidToastPosition.bottom,
                      toastHorizontalMargin: 20,
                      fullWidth: true,
                    );
                  }),
              NeButton(
                  label: Text('custom borderRadius textStyle etc'),
                  onTap: () {
                    showToast('This is normal toast',
                        context: context,
                        textStyle: TextStyle(fontSize: 20.0, color: Colors.red),
                        backgroundColor: Colors.yellow,
                        textPadding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 30.0),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(10.0, 20.0),
                            bottom: Radius.elliptical(10.0, 20.0)),
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl);
                  }),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Animation Toast',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              ...(AndroidToastAnimation.values
                  .map((animation) => NeButton(
                      label: Text(
                          '${animation.toString().replaceAll('AndroidToastAnimation.', '')}'),
                      onTap: () {
                        showToast(
                            'This is normal toast with ${animation.toString().replaceAll('AndroidToastAnimation.', '')} animation',
                            context: context,
                            animation: animation,
                            curve: Curves.linear,
                            reverseCurve: Curves.linear);
                      }))
                  .toList()),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Position Toast',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              ...([
                AndroidToastPosition.left,
                AndroidToastPosition.right,
                AndroidToastPosition.top,
                AndroidToastPosition.bottom
              ]
                  .map((position) => NeButton(
                      label: Text('${position.align.toString()}'),
                      onTap: () {
                        showToast(
                            'This is normal toast with ${position.align.toString()}',
                            context: context,
                            position: position,
                            curve: Curves.linear,
                            reverseCurve: Curves.linear);
                      }))
                  .toList()),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Custom Widget Toast',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeButton(
                  label: Text('Custom Widget Toast'),
                  onTap: () {
                    showToastWidget(
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                          child: Text(
                            'ok',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        context: context,
                        axis: Axis.horizontal,
                        alignment: Alignment.center,
                        position: AndroidToastPosition.center);
                  }),
            ],
          ),
        ),
      ];
}
