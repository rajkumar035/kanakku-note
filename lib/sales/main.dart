import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kn_pos/paymentInfo/main.dart';
import 'package:kn_pos/server/db.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ProductList {
  final int quantity;
  final String name;
  final String id;
  final String amount;
  final String? discount;
  final String grossAmount;

  ProductList(
      {required this.quantity,
      required this.name,
      required this.id,
      required this.amount,
      required this.grossAmount,
      this.discount});

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'name': name,
      'id': id,
      'amount': amount,
      'discount': discount,
      'grossAmount': grossAmount,
    };
  }
}

class _MainSales extends State<Sales> {
  final DatabaseServices _databaseServices = DatabaseServices.instance;
  final _productForm = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productQuanityController = TextEditingController();

  List<ProductList> productlist = [
    ProductList(
        quantity: 2,
        name: "Shampoo",
        id: "R4T455Y",
        amount: "200",
        grossAmount: "200"),
    ProductList(
        quantity: 2,
        name: "Washing liquid",
        id: "4T89U4T",
        amount: "40",
        discount: "60",
        grossAmount: "100"),
    ProductList(
        quantity: 5,
        name: "Oats",
        id: "0IU384UR",
        amount: "300",
        grossAmount: "300"),
    ProductList(
        quantity: 1,
        name: "Dates",
        id: "1E32E23R",
        amount: "500",
        grossAmount: "500"),
    ProductList(
        quantity: 6,
        name: "Soap",
        id: "KNSJDFY7",
        amount: "50",
        grossAmount: "50"),
  ];
  List<ProductList> cartProductList = [];
  ProductList? selectedMenu;
  List<ProductList> filteredProductList = [];
  String? result;

  @override
  void initState() {
    super.initState();
    getCartProducts();
  }

  void formReset() {
    _productForm.currentState!.reset();
    setState(() {
      selectedMenu = null;
    });
    _productNameController.clear();
    _productQuanityController.clear();
  }

  void getCartProducts() async {
    var data =
        await _databaseServices.getData(_databaseServices.cartProductsList);

    List<ProductList> newProductList = [];
    List<ProductList> newFilteredProducts;

    Set<String> cartProductIds =
        data.map((item) => item["id"].toString()).toSet();

    newProductList = data.map((item) {
      return ProductList(
        discount: item["discount"]?.toString(),
        quantity: item["quantity"] is int
            ? item["quantity"]
            : int.parse(item["quantity"].toString()),
        name: item["name"].toString(),
        id: item["id"].toString(),
        amount: item["amount"].toString(),
        grossAmount: item["grossAmount"].toString(),
      );
    }).toList();

    newFilteredProducts = productlist.where((productItem) {
      return !cartProductIds.contains(productItem.id);
    }).toList();

    setState(() {
      cartProductList = newProductList;
      filteredProductList = newFilteredProducts;
    });
  }

  void addCartProduct(data) async {
    await _databaseServices.addData(_databaseServices.cartProductsList, data);
    formReset();
    getCartProducts();
  }

  void scanProduct() async {
    ProductList? selectedData;
    var res = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(),
        ));

    var findData = filteredProductList.firstWhere(
        (products) => products.id == res,
        orElse: () => ProductList(
            quantity: 0, name: "", id: "", amount: "", grossAmount: ""));

    if (findData.id == "") {
      selectedData = null;
    } else {
      selectedData = findData;
    }

    setState(() {
      selectedMenu = selectedData;
    });
  }

  void deleteRecord(String id) async {
    await _databaseServices.deleteData(id, _databaseServices.cartProductsList);
    getCartProducts();
  }

  int calculateMainTotal() {
    var data = cartProductList.fold(0, (sum, product) {
      return sum +
          ((double.tryParse(product.grossAmount)?.toInt() ?? 0) *
              product.quantity);
    });
    return data;
  }

  int calculateDiscount() {
    var data = cartProductList.fold(0, (sum, product) {
      return sum +
          ((double.tryParse(product.amount)?.toInt() ?? 0) * product.quantity);
    });
    return calculateMainTotal() - data;
  }

  double calculateTotal() {
    return (calculateMainTotal() + ((calculateMainTotal() / 100) * 18)) -
        calculateDiscount();
  }

  bool enableAddproduct() {
    if (selectedMenu == null) {
      return false;
    }
    return true;
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
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
                Form(
                    key: _productForm,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(240, 241, 254, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          "Product name",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 44,
                                              child: DropdownMenu<ProductList>(
                                                requestFocusOnTap: true,
                                                controller:
                                                    _productNameController,
                                                inputDecorationTheme:
                                                    const InputDecorationTheme(
                                                        border: OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide.none,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8))),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white),
                                                expandedInsets:
                                                    const EdgeInsets.all(2),
                                                menuHeight: 200,
                                                menuStyle: MenuStyle(
                                                  backgroundColor:
                                                      const WidgetStatePropertyAll(
                                                          Colors.white),
                                                  shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      side: BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                                initialSelection: selectedMenu,
                                                dropdownMenuEntries:
                                                    filteredProductList
                                                        .map((toElement) {
                                                  return DropdownMenuEntry<
                                                      ProductList>(
                                                    value: toElement,
                                                    label: toElement.name,
                                                  );
                                                }).toList(),
                                                enableSearch: true,
                                                onSelected: (value) {
                                                  setState(() {
                                                    selectedMenu = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: FilledButton(
                                                  style: const ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              Color.fromRGBO(
                                                                  52,
                                                                  120,
                                                                  240,
                                                                  1))),
                                                  onPressed: () async {
                                                    scanProduct();
                                                  },
                                                  child: const Icon(Icons
                                                      .qr_code_scanner_rounded)))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          "Quantity",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 60,
                                          width: double.infinity,
                                          child: SizedBox(
                                              height: 44,
                                              child: TextFormField(
                                                controller:
                                                    _productQuanityController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter a value";
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          r'^[1-9][0-9]*$')),
                                                ],
                                                decoration:
                                                    const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 12),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                              ))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                    onPressed: enableAddproduct()
                                        ? () {
                                            if (_productForm.currentState!
                                                .validate()) {
                                              Map<String, dynamic> productData =
                                                  {
                                                ...selectedMenu?.toMap() ?? {},
                                                'quantity':
                                                    _productQuanityController
                                                        .value.text,
                                                "customerIdentity": null,
                                              };
                                              print(productData);
                                              addCartProduct(productData);
                                            }
                                          }
                                        : null,
                                    style: ButtonStyle(
                                        backgroundColor: enableAddproduct()
                                            ? const WidgetStatePropertyAll(
                                                Color.fromRGBO(52, 120, 240, 1))
                                            : const WidgetStatePropertyAll(
                                                Colors.grey)),
                                    child: const Text(
                                      "Add Products",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                    ))),
                          ],
                        ),
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(240, 241, 254, 1),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Summary",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Subtotal"),
                                  Text(
                                      "${double.parse(calculateMainTotal().toString())}")
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [Text("Tax"), Text("+18%")],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Discount"),
                                  Text(
                                      "-${double.parse(calculateDiscount().toString())}")
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text("Total"),
                                    Text("${calculateTotal()}")
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Products list (${cartProductList.length})",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(cartProductList.length, (generator) {
                    var item = cartProductList[generator];

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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
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
                                                      "${item.quantity} x ${item.grossAmount}",
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
                                                            "₹${((double.tryParse(item.grossAmount)?.toInt() ?? 0) * item.quantity)}",
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
                                                            "-${((((double.tryParse(item.grossAmount)?.toInt() ?? 0) * item.quantity) / 100) * (double.tryParse(item.discount!)?.toInt() ?? 0))}",
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
                        onPressed: cartProductList.isEmpty
                            ? null
                            : () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return MainPaymentInfo(
                                        products: cartProductList);
                                  },
                                );
                              },
                        style: ButtonStyle(
                            backgroundColor: cartProductList.isEmpty
                                ? const WidgetStatePropertyAll(Colors.grey)
                                : const WidgetStatePropertyAll(
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
      )),
    );
  }
}

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainSales createState() => _MainSales();
}
