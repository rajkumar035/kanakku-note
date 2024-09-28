import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kn_pos/sales/main.dart';

class PaymentInfoList {
  int amount;
  String? method;

  PaymentInfoList({required this.amount, required this.method});
}

class Paymentinfo extends State<MainPaymentInfo> {
  final List<ProductList> products;
  Paymentinfo({required this.products});

  List<PaymentInfoList> paymentInfoList = [
    PaymentInfoList(amount: 0, method: null)
  ];

  final List<String> paymentOptions = [
    "Cash",
    "Credit",
    "Debit Card",
    "Credit Card",
    "UPI",
    "Gift Card"
  ];

  int calculateMainTotal() {
    return products.fold(0, (sum, product) {
      return sum + int.parse(product.originalPrice);
    });
  }

  int calculateDiscount() {
    return products.fold(0, (sum, product) {
      if (product.discount != null) {
        return sum + int.parse(product.discount!);
      }
      return sum;
    });
  }

  int calculateTotal() {
    return products.fold(0, (sum, product) {
      return sum + int.parse(product.price);
    });
  }

  int calculatePaymentTotal() {
    return paymentInfoList.fold(0, (sum, product) {
      return sum + product.amount;
    });
  }

  void handlePaymentAmount(int price, int index) {
    final List<PaymentInfoList> calculateProducts = paymentInfoList
        .map(
            (item) => PaymentInfoList(amount: item.amount, method: item.method))
        .toList();

    final List<PaymentInfoList> sampleProducts = paymentInfoList
        .map(
            (item) => PaymentInfoList(amount: item.amount, method: item.method))
        .toList();

    calculateProducts[index].amount = price;

    int totalPayableAmount = calculateProducts.fold(0, (sum, product) {
      return sum + product.amount;
    });

    if (totalPayableAmount <= calculateTotal()) {
      sampleProducts[index].amount = price;
    }

    setState(() {
      paymentInfoList = sampleProducts;
    });
  }

  void handlePaymentMethod(String? method, int index) {
    final List<PaymentInfoList> sampleProducts = [...paymentInfoList];
    sampleProducts[index].method = method;

    setState(() {
      paymentInfoList = sampleProducts;
    });
  }

  void handleAddPayment() {
    final List<PaymentInfoList> sampleProducts = [
      ...paymentInfoList,
      PaymentInfoList(amount: 0, method: null)
    ];

    setState(() {
      paymentInfoList = sampleProducts;
    });
  }

  void handleRemovePayment(int index) {
    final List<PaymentInfoList> sampleProducts = [...paymentInfoList];
    List<PaymentInfoList> filteredList = [];
    for (var i = 0; i < sampleProducts.length; i++) {
      var item = sampleProducts[i];
      if (index != i) {
        filteredList.add(item);
      }
    }

    setState(() {
      paymentInfoList = filteredList;
    });
  }

  bool isAmountSame() {
    return calculateTotal() == calculatePaymentTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment Info",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "SubTotal:",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text("\$${calculateMainTotal()}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Discount:",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text("-\$${calculateDiscount()}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Total:",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      Text("\$${calculateTotal()}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 2, top: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(paymentInfoList.length, (index) {
                    var isLastIndex = index == (paymentInfoList.length - 1);
                    var item = paymentInfoList[index];
                    var method = item.method;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 140,
                              height: 40,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1.5,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.5))),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 6),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          onChanged: (value) {
                                            handlePaymentMethod(value, index);
                                          },
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          value: item.method,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                          hint: const Text(
                                            "Payment Methods",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          items:
                                              paymentOptions.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      )))),
                          SizedBox(
                              width: 140,
                              height: 38,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1.5,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.5))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 6),
                                    child: TextField(
                                      enabled: method != null,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          handlePaymentAmount(
                                              int.parse(value), index);
                                        }
                                      },
                                      controller: TextEditingController(
                                          text: item.amount.toString())
                                        ..selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: item.amount
                                                        .toString()
                                                        .length)),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ))),
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: isLastIndex
                                  ? IconButton(
                                      style: ButtonStyle(
                                        padding: const WidgetStatePropertyAll(
                                            EdgeInsets.all(0)),
                                        backgroundColor: WidgetStatePropertyAll(
                                            isAmountSame()
                                                ? Colors.grey
                                                : Colors.blue),
                                      ),
                                      onPressed: () {
                                        handleAddPayment();
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    )
                                  : IconButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.red),
                                      ),
                                      onPressed: () {
                                        handleRemovePayment(index);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    )),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, top: 5),
              child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: isAmountSame()
                          ? () {
                              print("Check");
                            }
                          : null,
                      style: ButtonStyle(
                          backgroundColor: isAmountSame()
                              ? const WidgetStatePropertyAll(
                                  Color.fromRGBO(52, 120, 240, 1))
                              : const WidgetStatePropertyAll(Colors.grey)),
                      child: const Text(
                        "Checkout",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPaymentInfo extends StatefulWidget {
  final List<ProductList> products;
  const MainPaymentInfo({super.key, required this.products});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  Paymentinfo createState() => Paymentinfo(products: products);
}
