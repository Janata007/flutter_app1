import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/productdto.dart';
import 'package:ss/src/model/dto/turnover_fiscal_dto.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/model/enum/product_type.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/ui/selected_fiscal.dart';
import 'package:ss/src/ui/selected_product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key, required this.productDto, required this.productType}) : super(key: key);
  final ProductDto productDto;
  final String productType;

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: globalKey,
      appBar: AppBar(
        title: const Text('Листа на продукти'),
      ),
      body: FutureBuilder<List<ProductDto>>(
          future: getProductResult(widget.productDto),
          builder: (BuildContext context,
              AsyncSnapshot<List<ProductDto>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (snapshot.data!.length == index) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            ProductDto listProduct = snapshot.data![index];

                            if(listProduct.productType == stringToProductType(widget.productType)) {
                            String productName =
                                snapshot.data![index].productName.toString();
                            String proizvoditel='';
                            if(snapshot.data![index].manufacturer?.partnerName !=null ){
                              proizvoditel = snapshot.data![index].manufacturer!.partnerName.toString();
                            }
                            String productType='';
                            if(snapshot.data![index].productType == ProductType.C) {
                              productType = "Комерцијален";
                            } else {
                              productType = "Лек";
                            }
                            ProductDto listProduct =
                                snapshot.data![index];
                            return ListTile(
                              isThreeLine: true,
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                  children:[
                                  Text((index+1).toString()+'. '),
                                  Expanded(child:
                                  Text(productName, overflow: TextOverflow.ellipsis,)
                                  )
                                  ],
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("производител: " + proizvoditel),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("вид на продукт: " + productType)
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyProductPage(product: listProduct)),
                                );
                              },
                            );}else
                              return SizedBox.shrink();
                          }),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
