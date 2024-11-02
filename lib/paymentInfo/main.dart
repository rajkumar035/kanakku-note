import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kn_pos/sales/main.dart';

class PaymentInfoList {
  int amount;
  String? method;
  String id;

  PaymentInfoList(
      {required this.amount, required this.method, required this.id});
}

class Paymentinfo extends State<MainPaymentInfo> {
  final List<ProductList> products;
  Paymentinfo({required this.products});
  final List<String> paymentOptions = [
    "Cash",
    "Credit",
    "Debit Card",
    "Credit Card",
    "UPI",
    "Gift Card"
  ];

  List<PaymentInfoList> paymentInfoList = [
    PaymentInfoList(amount: 0, method: null, id: "902323")
  ];

  String generateRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(900000) + 100000;
    return randomNumber.toString();
  }

  int calculateMainTotal() {
    var data = products.fold(0, (sum, product) {
      return sum +
          ((double.tryParse(product.grossAmount)?.toInt() ?? 0) *
              product.quantity);
    });
    return data;
  }

  int calculateDiscount() {
    var data = products.fold(0, (sum, product) {
      return sum +
          ((double.tryParse(product.amount)?.toInt() ?? 0) * product.quantity);
    });
    return calculateMainTotal() - data;
  }

  int calculatePaymentTotal() {
    return paymentInfoList.fold(0, (sum, product) {
      return sum + product.amount;
    });
  }

  double calculateTotal() {
    return (calculateMainTotal() + ((calculateMainTotal() / 100) * 18)) -
        calculateDiscount();
  }

  void handlePaymentAmount(int price, int index) {
    final List<PaymentInfoList> calculateProducts = paymentInfoList
        .map((item) => PaymentInfoList(
            amount: item.amount, method: item.method, id: item.id))
        .toList();

    final List<PaymentInfoList> sampleProducts = paymentInfoList
        .map((item) => PaymentInfoList(
            amount: item.amount, method: item.method, id: item.id))
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

  void handleAddNewEmptyRecord(String price, PaymentInfoList data) {
    var customPaymentInfoList = paymentInfoList;
    var customPrice = price.isEmpty ? "0" : price;

    var getIndex =
        customPaymentInfoList.indexWhere((pays) => pays.id == data.id);

    if (getIndex == customPaymentInfoList.length - 1) {
      if (int.parse(customPrice) > 0) {
        customPaymentInfoList.add(PaymentInfoList(
            amount: 0, method: null, id: generateRandomNumber()));
      } else {
        customPaymentInfoList.removeLast();
      }
    } else {
      if (int.parse(customPrice) == 0) {
        customPaymentInfoList.removeWhere((pays) => pays.id == data.id);
      }
    }

    setState(() {
      paymentInfoList = customPaymentInfoList;
    });
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
                      Text("₹${calculateMainTotal()}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tax:",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text("+18%",
                          style: TextStyle(
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
                      Text("-₹${calculateDiscount()}",
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
                      Text("₹${calculateTotal()}",
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
                    var item = paymentInfoList[index];
                    var method = item.method;
                    var isLastIndex = index == paymentInfoList.length - 1;
                    return isLastIndex && isAmountSame()
                        ? const SizedBox.shrink()
                        : Padding(
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
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                                  var hasValue = paymentInfoList
                                                      .where((data) =>
                                                          // ignore: unrelated_type_equality_checks
                                                          data.method == value);
                                                  if (hasValue.isEmpty) {
                                                    handlePaymentMethod(
                                                        value, index);
                                                  }
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
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                items: paymentOptions
                                                    .map((String item) {
                                                  var hasValue = paymentInfoList
                                                      .where((data) =>
                                                          // ignore: unrelated_type_equality_checks
                                                          data.method == item);
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: TextStyle(
                                                          color: hasValue
                                                                  .isNotEmpty
                                                              ? const Color
                                                                  .fromRGBO(
                                                                  0, 0, 0, 0.5)
                                                              : Colors.black),
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
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                handlePaymentAmount(
                                                    int.parse(value), index);
                                              }
                                              handleAddNewEmptyRecord(
                                                  value, item);
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
                                    child: FilledButton(
                                      style: const ButtonStyle(
                                        padding: WidgetStatePropertyAll(
                                            EdgeInsets.all(0)),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8)))),
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.red),
                                      ),
                                      onPressed: () {
                                        handleRemovePayment(index);
                                      },
                                      child: const Icon(
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
