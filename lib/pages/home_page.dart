import 'package:flutter/material.dart';
import 'package:silvers_scaffold/widgets/animation_floating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: widget.scrollController,
          slivers: [
            SliverAppBar(
              floating: true,
              leading: IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    backgroundColor: Colors.lightGreen,
                  )),
                  title: const Text('x'),
                  centerTitle: true,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 100,
              (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  color: index.isOdd ? Colors.white : Colors.blue[50],
                  child: Text('$index'),
                );
              },
            )),
            
          ],
        ),
        Positioned(
              bottom: 50,
              right: 16,
              child: AnimationFloatingBar(
                scrollController: widget.scrollController,
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                  
                },),
              ))
      ],
    );
  }
}
