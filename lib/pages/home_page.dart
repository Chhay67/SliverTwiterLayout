import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvers_scaffold/pages/sliver_pagination_lost.dart';
import 'package:silvers_scaffold/riverpod/item_provider.dart';
import 'package:silvers_scaffold/riverpod/item_state.dart';
import 'package:silvers_scaffold/widgets/animation_floating_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                ref.read(itemsProvider.notifier).getItems();
                return true;
              }
            }
            return true;
          },
          child: CustomScrollView(
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
              Consumer(
                builder: (context, ref, child) {
                  final data = ref.watch(itemsProvider);
                  print('object ${data.hasMoreData}');
                  if(data.loading == LoadingState.progress){
                    return const SliverToBoxAdapter(child:  CircularProgressIndicator());
                  }
                  if(data.loading == LoadingState.success){
                    return SliverListView(
                      hasMoreData: data.hasMoreData,
                      itemCount: data.items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          height: 100,
                          color: index.isOdd ? Colors.white : Colors.blue[50],
                          child: Text('${data.items[index]} $index'),
                        );
                      },
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox(),);
                },
              )
              // SliverListView(
              //   hasMoreData: items.length < 100,
              //   itemCount: items.length,
              //   itemBuilder: (context, index) {
              //         return Container(
              //           padding: const EdgeInsets.all(16),
              //           height: 100,
              //           color: index.isOdd ? Colors.white : Colors.blue[50],
              //           child: Text('$index'),
              //         );
              //       },
              // ),
              // SliverList(
              //     delegate: SliverChildBuilderDelegate(
              //   childCount: items.length,
              //   (context, index) {
              //     return Container(
              //       padding: const EdgeInsets.all(16),
              //       height: 100,
              //       color: index.isOdd ? Colors.white : Colors.blue[50],
              //       child: Text('$index'),
              //     );
              //   },
              // )),

            ],
          ),
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




