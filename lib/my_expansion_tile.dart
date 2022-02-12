import 'package:flutter/material.dart';

class MyExpansionTile extends StatefulWidget {
  final int count;
  const MyExpansionTile({Key? key, required this.count}) : super(key: key);

  @override
  State<MyExpansionTile> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyExpansionTile>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> angle;
  late Animation<double> heightFactor;
  late Animation<Color?> textColor;
  late Animation<Color?> borderColor;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    borderColor = ColorTween(begin: Colors.transparent, end: Colors.black12)
        .animate(controller);
    textColor =
        ColorTween(begin: Colors.blue, end: Colors.black).animate(controller);

    angle = Tween<double>(begin: 1.5, end: 0.0).animate(controller);
    heightFactor = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                color: borderColor.value!,
              ),
              bottom: BorderSide(
                color: borderColor.value!,
              ),
            )),
            child: Column(children: [
              ListTile(
                onTap: () {
                  controller.value == 0
                      ? controller.forward()
                      : controller.reverse();
                },
                title: Text('Text ${widget.count}'),
                textColor: textColor.value,
                trailing: Transform.rotate(
                  angle: angle.value,
                  child: const Icon(Icons.expand_more),
                ),
              ),
              ClipRRect(
                child: Align(
                  heightFactor: heightFactor.value,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: FlutterLogo(
                          size: 40,
                        ),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim libero vitae aliquet posuere. Cras sapien diam, mattis quis lobortis ac, fermentum eu mi. Vestibulum molestie justo nec velit venenatis viverra. Pellentesque sed elit vestibulum lacus tempor condimentum at in ipsum. Morbi sed sapien urna. Aenean non imperdiet odio. Sed rhoncus purus quis facilisis rutrum',
                      )
                    ],
                  ),
                ),
              )
            ]),
          );
        });
  }
}
