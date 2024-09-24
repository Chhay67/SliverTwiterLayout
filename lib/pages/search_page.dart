import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<String> items = ['1','2','3','4','5','6','7','8','9','10'];

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NestedScrollView(
          controller: widget.scrollController,

          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.blue,
                ),
              ),

              SliverAppBar(
                leading: const CircleAvatar(),
                title: const Text('Search'),
                centerTitle: true,
                bottom: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        text: 'For you',
                      ),
                      Tab(
                        text: 'Treading',
                      ),
                      Tab(
                        text: 'News',
                      ),
                      Tab(
                        text: 'Sports',
                      ),
                      Tab(
                        text: 'Entertainment',
                      ),
                    ]),
              )
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [
              /// For you
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification) {
                    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                      final tempList = ['1','2','3','4','5','6','7','8','9','10'];
                      Future.delayed(Duration(seconds: 2),() => setState(() => items.addAll(tempList)));
                      return true;
                    }
                  }
                  return true;
                },
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: items.length + 1,
                              (context, index) {
                            print('$index');
                            if(index == items.length){
                              return CircularProgressIndicator();
                            }
                            return Container(
                              padding: const EdgeInsets.all(16),
                              height: 100,
                              color: index.isOdd ? Colors.white : Colors.blue[50],
                              child: Text('For you $index'),
                            );
                          },
                        ))
                    // SliverList(
                    //     delegate: SliverChildBuilderDelegate(
                    //   childCount: items.length + 1,
                    //   (context, index) {
                    //     print('$index');
                    //     if(index == items.length){
                    //       return CircularProgressIndicator();
                    //     }
                    //     return Container(
                    //       padding: const EdgeInsets.all(16),
                    //       color: index.isOdd ? Colors.white : Colors.blue[50],
                    //       child: Text('For you $index'),
                    //     );
                    //   },
                    // )),
                  ],
                ),
              ),
              /// Treading
              CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: 100,
                    (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        color: index.isOdd ? Colors.white : Colors.blue[50],
                        child: Text( 'Treading $index'),
                      );
                    },
                  )),
                ],
              ),
              /// News
              CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: 100,
                    (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        color: index.isOdd ? Colors.white : Colors.blue[50],
                        child: Text('News $index'),
                      );
                    },
                  )),
                ],
              ),
              /// Sports
              CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: 100,
                    (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        color: index.isOdd ? Colors.white : Colors.blue[50],
                        child: Text('Sports $index'),
                      );
                    },
                  )),
                ],
              ),
              /// Entertainment
              CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: 100,
                    (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        color: index.isOdd ? Colors.white : Colors.blue[50],
                        child: Text('Entertainment $index'),
                      );
                    },
                  )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
