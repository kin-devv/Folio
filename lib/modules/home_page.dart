import 'package:portfolio/core/exports.dart';
import 'package:portfolio/widgets/large_widgets/large_background.dart';
import 'package:portfolio/widgets/large_widgets/large_drawer.dart';
import 'package:portfolio/widgets/small_widgets/background_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: GetBuilder<AppController>(
        init: appController,
        builder: (controller) {
          return Scaffold(
            drawer: const AppDrawer(),
            backgroundColor: theme.backgroundColor,
            key: controller.globalKey.value,
            body: Container(
              color: backgroundColor,
              child: Stack(
                children: [
                  const ResponsiveWidget(
                    largeScreen: BackgroundPattern(),
                    mediumScreen: BackgroundPattern(),
                    smallScreen: SmallBackgroundPattern(),
                  ),
                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: Column(
                      children: [],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
