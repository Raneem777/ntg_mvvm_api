import 'package:flutter/material.dart';
import 'package:ntg_mvvm_api/ViewModel/ViewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late var cont;

  @override
  void initState() {
    super.initState();
    cont = Provider.of<ViewModel>(context, listen: false);
    cont.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your posts"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<ViewModel>(
          builder: (A, value, child) {
            if (value.isLoading()) {
              
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                  children: List.generate(
                      value.postList.length,
                      (index) => Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                                height: 250,
                                width: 400,
                                decoration:
                                    BoxDecoration(color: Colors.blueAccent),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(value
                                          .postList[index]
                                          .id
                                          .toString()),
                                      Text(value.postList[index].title
                                          .toString()),
                                      Text(
                                          value.postList[index].body.toString()),
                                    ],
                                  ),
                                )),
                          )));
            }
          },
        ),
      ),
    );
  }
}
