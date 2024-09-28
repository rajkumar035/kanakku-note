import 'package:flutter/material.dart';
import 'package:kn_pos/paymentInfo/main.dart';

class ProductList {
  final int quantity;
  final String name;
  final String id;
  final String price;
  final String? discount;
  final String originalPrice;

  ProductList(
      {required this.quantity,
      required this.name,
      required this.id,
      required this.price,
      required this.originalPrice,
      this.discount});
}

class _MainSales extends State<Sales> {
  List<ProductList> productlist = [
    ProductList(
        quantity: 2,
        name: "Shampoo",
        id: "R4T455Y",
        price: "200",
        originalPrice: "200"),
    ProductList(
        quantity: 2,
        name: "Washing liquid",
        id: "4T89U4T",
        price: "40",
        discount: "60",
        originalPrice: "100"),
    ProductList(
        quantity: 5,
        name: "Oats",
        id: "0IU384UR",
        price: "300",
        originalPrice: "300"),
    ProductList(
        quantity: 1,
        name: "Dates",
        id: "1E32E23R",
        price: "500",
        originalPrice: "500"),
    ProductList(
        quantity: 6,
        name: "Soap",
        id: "KNSJDFY7",
        price: "50",
        originalPrice: "50"),
  ];

  void deleteRecord(String id) {
    final List<ProductList> filteredArray = [];
    for (var i = 0; i < productlist.length; i++) {
      var item = productlist[i];
      if (item.id != id) {
        filteredArray.add(item);
      }
    }

    setState(() {
      productlist = filteredArray;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, double.maxFinite),
          child: Padding(
              padding:
                  EdgeInsets.only(top: 50, bottom: 10, right: 20, left: 20),
              child: Text(
                "Sales",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ))),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(minHeight: 900, maxHeight: double.infinity),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(240, 241, 254, 1),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Customer",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w900),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Customer name or mobile number",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                              height: 44,
                              width: double.infinity,
                              child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    height: 320,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(240, 241, 254, 1),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add Products",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w900),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      "Product name",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 44,
                                      width: double.infinity,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)))),
                                      )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      "Quantity",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 44,
                                      width: double.infinity,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)))),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                                onPressed: () {
                                  print("Check");
                                },
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromRGBO(52, 120, 240, 1))),
                                child: const Text(
                                  "Add Products",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                ))),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Products list",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(productlist.length, (generator) {
                    var item = productlist[generator];

                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${generator + 1})",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 4),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "Qty:",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      "${item.quantity}",
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Text(
                                                "|",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      "Price:",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 8),
                                                          child: Text(
                                                            "\$${item.originalPrice}",
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                        if (item.discount !=
                                                            null)
                                                          Text(
                                                            "-${item.discount}",
                                                            style: const TextStyle(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    deleteRecord(item.id);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    size: 24,
                                  ))
                            ],
                          ),
                          const Divider(
                            color: Color.fromARGB(108, 158, 158, 158),
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ]);
                  }),
                ),
                SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return MainPaymentInfo(products: productlist);
                            },
                          );
                        },
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(52, 120, 240, 1))),
                        child: const Text(
                          "Add Payment Info",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainSales createState() => _MainSales();
}
