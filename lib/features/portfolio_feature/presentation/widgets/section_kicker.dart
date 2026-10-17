import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';

class SectionKicker extends StatelessWidget {
  final String pageCount;
  final String pageName;
  final String? pageBio;

  const new({
    super.key,
    required this.pageCount,
    required this.pageName,
    this.pageBio = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20)
              .add(EdgeInsets.only(top: 20)),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .start,
            children: [
              //* page info
              txt(
                "$pageCount / ${pageName.toUpperCase()}",
                style: context.textTheme.labelMedium,
              ),

              //* page note
              SizedBox(
                width: 150,
                child: txt(
                  pageBio!.toUpperCase(),
                  textAlign: TextAlign.end,
                  style: context.textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),

        //* divider
        Container(
          width: double.infinity,
          height: 1,
          color: context.theme.dividerColor,
        ),
      ],
    );
  }
}
