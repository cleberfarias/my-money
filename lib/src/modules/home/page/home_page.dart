import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_money/src/modules/initial/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    controller.loadData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.isLoading
          ? const AppLoading()
          : Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.appPageBackground,
                centerTitle: true,
                toolbarHeight: AppMetrics.barHeight,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () => controller.logout(context),
                    icon: const Icon(
                      Icons.logout,
                      color: AppColors.logo,
                    ),
                  ),
                ],
                leading: IconButton(
                    onPressed: () => controller.goSettings(context),
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: AppColors.logo,
                    )),
              ),
              backgroundColor: AppColors.appPageBackground,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const AppTitle(title: "Dashboard My Money"),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ExpenseCount(
                                  title: "Gasto acumulado",
                                  value: controller.accValue,
                                  background: Colors.redAccent,
                                  icon: Icons.trending_down_rounded,
                                ),
                                ExpenseCount(
                                  title: "Gasto Planejado",
                                  value: controller.goalValue,
                                  background: Colors.lightGreen,
                                  icon: Icons.trending_up,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFE0E0E0),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ManagementIndicator(
                                          value: controller.plannedSpentBalance,
                                          subtitle: "Saldo gasto planejado",
                                          minValueAxis: 0,
                                          maxValueAxis: controller.goalValue,
                                          isASC: false,
                                        ),
                                        ManagementIndicator(
                                          value: controller.dailyExpenseBalance,
                                          subtitle: "Saldo despesa diária",
                                          minValueAxis: 0,
                                          maxValueAxis:
                                              controller.dailyExpenseBalance,
                                          isASC: false,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ManagementIndicator(
                                          value:
                                              controller.dayOfMonth.toDouble(),
                                          subtitle: "Período decorrido",
                                          minValueAxis: 1,
                                          maxValueAxis: 30,
                                          isMoney: false,
                                        ),
                                        ManagementIndicator(
                                          value: controller.expensesDay,
                                          subtitle: "Despesas do dia",
                                          minValueAxis: 0,
                                          maxValueAxis:
                                              controller.dailyExpenseBalance,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ExpenseList(
                              expenses: controller.expenses,
                              title: "Gastos recentes",
                            ),
                          ),
                          AppButton(
                            action: () {
                              Navigator.of(context)
                                  .pushNamed(AppRouter.history, arguments: {
                                "expenses": controller.expenseList,
                              });
                            },
                            label: "Histórico",
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                child: Container(height: 40),
              ),
              floatingActionButton: ExpenseButton.add(context),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
    });
  }
}