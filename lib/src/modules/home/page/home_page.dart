import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_money/main.dart';
import 'package:my_money/src/modules/home/controller/home_controller.dart';
import 'package:my_money/src/router/app_router.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_button.dart';
import 'package:my_money/src/shared/components/app_loading.dart';
import 'package:my_money/src/shared/components/app_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  bool isLoading = true;


  @override
  void initState() {
    controller.loadData(context);
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((_) => setState((){
      isLoading = false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
    ? const AppLoading()
    : Scaffold(
      appBar: AppBar(
      title: Text(widget.title),
      centerTitle: true,
      leading: const Icon(Icons.verified_user),
      actions: [
        IconButton(onPressed:(){}, icon: const Icon(Icons.logout))
      ],
      ),
      body: Observer(builder: (_){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
            ],
          ),
        )
      }),
    )