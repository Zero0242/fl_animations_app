import 'package:flutter/material.dart';

const _sampleImages = [
  'https://picsum.photos/200',
  'https://picsum.photos/201',
  'https://picsum.photos/202',
  'https://picsum.photos/203',
  'https://picsum.photos/204',
];

class ParallaxFlowScreen extends StatefulWidget {
  const ParallaxFlowScreen({super.key});

  /// App Route is: `/parallax-flow`
  static const String route = '/parallax-flow';

  @override
  State<ParallaxFlowScreen> createState() => _ParallaxFlowScreenState();
}

class _ParallaxFlowScreenState extends State<ParallaxFlowScreen> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parallax')),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _sampleImages.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                final url = _sampleImages[index];
                return AssetCard(src: url, isFocused: index == currentPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AssetCard extends StatefulWidget {
  const AssetCard({super.key, required this.src, this.isFocused = false});
  final String src;
  final bool isFocused;

  @override
  State<AssetCard> createState() => _AssetCardState();
}

class _AssetCardState extends State<AssetCard> {
  final _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: widget.isFocused
          ? const EdgeInsets.symmetric(vertical: 16, horizontal: 4)
          : const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            offset: const Offset(0, 6),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: Flow(
          delegate: ParallaxFlowDelegate(
            scrollable: Scrollable.of(context),
            listItemContext: context,
            backgroundImageKey: _globalKey,
          ),
          children: [
            AspectRatio(
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              child: Image.network(widget.src, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}

// * ========
// * Parallax
// * ========

/// Para más detalle consultar este video
/// * https://www.youtube.com/watch?v=tgK0u0qwM70
class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.topCenter(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dx / viewportDimension).clamp(
      0.0,
      1.0,
    );

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    // final verticalAlignment = Alignment(0, scrollFraction * 2 - 1);
    final horizontalAlignment = Alignment(scrollFraction * 2 - 1, 0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = horizontalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Paint the background.
    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(childRect.left, 0),
        // offset: Offset(0.0, childRect.top),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(covariant ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    // * Horizontal -> maxWidth y Vertical -> maxHeight
    return BoxConstraints.tightFor(height: constraints.maxHeight);
  }
}
