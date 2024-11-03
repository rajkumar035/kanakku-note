import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartData {
  final double axis1;
  final double axis2;

  ChartData({required this.axis1, required this.axis2});
}

class _MyDashBoard extends State<Dashboard> {
  var selectedDuration = "Weekly";
  final List<ChartData> chartData = [
    ChartData(axis1: 5, axis2: 9),
    ChartData(axis1: 10, axis2: 2),
    ChartData(axis1: 8, axis2: 1),
    ChartData(axis1: 4, axis2: 9),
    ChartData(axis1: 2, axis2: 4),
    ChartData(axis1: 0, axis2: 0),
    ChartData(axis1: 8, axis2: 1),
    ChartData(axis1: 0, axis2: 0),
    ChartData(axis1: 10, axis2: 2),
    ChartData(axis1: 10, axis2: 2),
    ChartData(axis1: 10, axis2: 2),
  ];

  final List<String> durationList = ["Weekly", "Monthly", "Yearly"];

  String getBottomTitles(value) {
    DateTime now = DateTime.now();

    switch (selectedDuration) {
      case "Weekly":
        return DateFormat.MMMd()
            .format(now.subtract(Duration(days: value.toInt())));
      case "Monthly":
        return DateFormat.MMMd()
            .format(now.subtract(Duration(days: value.toInt() * 5)));
      case "Yearly":
        return DateFormat.MMMd()
            .format(now.subtract(Duration(days: value.toInt() * 30)));
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 15, top: 65, right: 15, bottom: 0),
      child: SingleChildScrollView(
          child: ConstrainedBox(
        constraints:
            const BoxConstraints(minHeight: 900, maxHeight: double.infinity),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                    height: 50,
                  ),
                  const Text(
                    "Glance",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "Total sales",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "\$ 9,876.33",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8, top: 4, right: 8, bottom: 4),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 88, 86, 214)),
                            child: const Text(
                              "Increase",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.arrow_upward,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              size: 14,
                            ),
                          )
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "+\$16.33 today",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.8),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 1,
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.1)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(selectedDuration,
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_upward,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            size: 20,
                          ),
                        )
                      ],
                    ),
                    DropdownButton<String>(
                      onChanged: (value) {
                        setState(() {
                          selectedDuration = value as String;
                        });
                      },
                      value: selectedDuration,
                      hint: const Text("This week"),
                      items: durationList.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                size: 10,
                              ),
                              Text(
                                "Sales",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(0, 0, 0, 0.8),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "\$ 800.98",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 0.8),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  size: 10,
                                ),
                                Text(
                                  "Purchase",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(0, 0, 0, 0.8),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "\$ 3344.98",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 0, 0, 0.8),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                    fit: FlexFit.loose,
                    child: SizedBox(
                        height: 200,
                        child: BarChart(BarChartData(
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 42,
                                    getTitlesWidget: (value, meta) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          getBottomTitles(value),
                                          style: const TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w200),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            gridData: const FlGridData(show: false),
                            barGroups: List.generate(chartData.length, (index) {
                              return BarChartGroupData(x: index, barRods: [
                                BarChartRodData(
                                    toY: chartData[index].axis1,
                                    color:
                                        const Color.fromARGB(255, 88, 86, 214)),
                                BarChartRodData(
                                    toY: chartData[index].axis2,
                                    color:
                                        const Color.fromARGB(255, 88, 86, 214))
                              ]);
                            }),
                            barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                              getTooltipItem:
                                  ((group, groupIndex, rod, rodIndex) {
                                return BarTooltipItem(
                                    rod.toY.toString(),
                                    const TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1)));
                              }),
                            )))))),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 88, 86, 214))),
                        child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.replay_outlined,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    "Products",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1)),
                                  ),
                                )
                              ],
                            )),
                      ),
                      FilledButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              shadowColor: WidgetStatePropertyAll(Colors.black),
                              elevation: WidgetStatePropertyAll(2),
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 255, 255, 255))),
                          child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.replay_outlined,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                  Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "Customers",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                                  )
                                ],
                              )))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 40),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(240, 240, 240, 1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Transaction History",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.refresh,
                                  size: 12,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.toggle_off,
                                    size: 12,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Color.fromARGB(255, 88, 86, 214)),
                                  child: const Icon(
                                    Icons.payment,
                                    size: 18,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Text(
                                    "Sales Cash In",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const Text(
                              "+ \$800.98",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(223, 223, 223, 1)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Color.fromARGB(255, 88, 86, 214)),
                                  child: const Icon(
                                    Icons.currency_rupee,
                                    size: 18,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Text(
                                    "Sales Receivables",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const Text(
                              "+ \$800.98",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(223, 223, 223, 1)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Color.fromARGB(255, 88, 86, 214)),
                                  child: const Icon(
                                    Icons.storage,
                                    size: 18,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Text(
                                    "Purchase Payables",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const Text(
                              "+ \$800.98",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(223, 223, 223, 1)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Color.fromARGB(255, 88, 86, 214)),
                                  child: const Icon(
                                    Icons.storage,
                                    size: 18,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Text(
                                    "Expense Payout",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const Text(
                              "+ \$800.98",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    ));
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyDashBoard createState() => _MyDashBoard();
}
