import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class HmCardItem extends StatelessWidget {
  final void Function(BuildContext)? onSlide;
  final void Function()? onTap;
  final String? title;
  final String? subTitle;
  const HmCardItem({
    Key? key,
    this.onSlide,
    this.onTap,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      color: Colors.blue[50],
      elevation: 0,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onSlide,
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title ?? 'Product Name',
            style: const TextStyle(
              fontSize: 15.0,
            ),
          ),
          subtitle: Text(
            subTitle ?? "Product Category",
            style: const TextStyle(
              fontSize: 10.0,
            ),
          ),
          trailing: GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              'assets/icons/edit.svg',
              height: 20,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    );
  }
}
