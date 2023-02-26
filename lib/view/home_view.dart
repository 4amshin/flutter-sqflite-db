import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/db_instance.dart';
import 'package:flutter_sqlite/model/product_model.dart';
import 'package:flutter_sqlite/view/create_view.dart';
import 'package:flutter_sqlite/view/update_view.dart';
import 'package:flutter_sqlite/widget/hm_add_button.dart';
import 'package:flutter_sqlite/widget/hm_card_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DbInstance? dbInstance;

  Future doRefresh() async {
    setState(() {});
  }

  Future initDatabase() async {
    await dbInstance!.database();
    setState(() {});
  }

  Future delete(int id) async {
    await dbInstance!.deleteData(id);
    setState(() {});
  }

  @override
  void initState() {
    dbInstance = DbInstance();
    initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "SqLite",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: doRefresh,
        color: Colors.indigo,
        child: dbInstance != null
            ? FutureBuilder<List<ProductModel>>(
                future: dbInstance!.displayDb(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          "no data",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.indigo,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data![index];
                        return HmCardItem(
                          title: data.name,
                          subTitle: data.category,
                          onSlide: ((context) {
                            delete(data.id!);
                          }),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateView(productModel: data),
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          },
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: Colors.indigo,
                        size: 35,
                      ),
                    );
                  }
                },
              )
            : Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.indigo,
                  size: 35,
                ),
              ),
      ),
      floatingActionButton: HmAddButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateView(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
