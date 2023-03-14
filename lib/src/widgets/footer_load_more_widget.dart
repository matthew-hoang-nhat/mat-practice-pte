import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FooterLoadMoreWidget extends StatelessWidget {
  const FooterLoadMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        switch (mode) {
          case LoadStatus.idle:
            body = const SizedBox(height: 50);
            break;
          case LoadStatus.loading:
            body = const CircularProgressIndicator();
            break;
          case LoadStatus.canLoading:
            body = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(CommunityMaterialIcons.arrow_up),
                Text('Release to load more'),
              ],
            );
            break;
          default:
            body = const SizedBox(height: 50, width: 50);
        }
        return Center(child: body);
      },
    );
  }
}
