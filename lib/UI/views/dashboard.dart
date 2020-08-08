import 'package:flutter/material.dart';

import 'package:flutterhackathon/UI/widgets/dashboardCard.dart';

class DashBoardScreen extends StatefulWidget {
  final snapshot;
  DashBoardScreen({@required this.snapshot});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => DashBoardCard(
                snapshotIndex: widget.snapshot[index],
              ),
          childCount: widget.snapshot.length),
    );
  }
}
