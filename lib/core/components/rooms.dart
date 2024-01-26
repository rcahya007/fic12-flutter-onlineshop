import 'package:flutter/widgets.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';

class Rooms extends StatelessWidget {
  const Rooms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(
            bottom: 16,
          ),
          height: 100,
          decoration: BoxDecoration(
            color: colorGiratina100,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: Text(
                    'Rooms ${index + 1}',
                    style: heading2semi,
                  ),
                ),
              ),
              SizedBox(
                width: 82,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(
                      8,
                    ),
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/$index/300/200',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
