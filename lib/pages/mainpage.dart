import 'package:filipay/widgets/modals.dart';
import 'package:flutter/cupertino.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'background.dart';

class MainPage extends StatefulWidget {
  final bool routePageLoad;
  final bool qrScanLoad;
  MainPage({required this.routePageLoad, required this.qrScanLoad});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {  
  MyModal myModal = MyModal();

  List<String> items = List.generate(20, (index) => 'Item $index');

  Future<void> _refresh() async {
    // Simulating a time-consuming task
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      items = List.generate(20, (index) => 'Refreshed Item $index');
    });
  }

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.routePageLoad) {
      _showRoutePageLoadingModal();
    } else if (widget.qrScanLoad) {
      _showQRScanLoadingModal();
    }
  }

  void _showRoutePageLoadingModal() {
    _isLoading = true;
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _showQRScanLoadingModal() {
    _isLoading = true;
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Success!",
          text: "QR Code Scanned Successfully"
        )
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "SAN PEDRO TRANSPORT\nCOOPERATIVE",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.040,
            fontWeight: FontWeight.bold,
            ),
          ),
        backgroundColor: Color.fromRGBO(134, 188, 227, 1.0),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Stack(
          children: [
            Center(
              child: Container(
                width: 60,
                height: 55,
                margin: const EdgeInsets.only(left: 10), // Adjust the margin as needed
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "10",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.030,
                      ),
                    ),
                    Text(
                      "Pass\nCount",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.020,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 60,
            height: 60,
            child: IconButton(
              icon: 
                Image.asset('assets/logout-home.png'),
              onPressed: (
              ) {
                myModal.logout(context);
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Background(),
            RefreshIndicator(
              onRefresh: _refresh,
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.87,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black, // Border color
                                      width: 2, 
                                    ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "SUCAT - ALABANG",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    )
                                  ),
                                ),
                              ),
                              
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(180, 224, 237, 1.0),
                                  border: Border.all(
                                    color: Color.fromRGBO(82, 161, 217, 1.0),
                                    width: 8,
                                  )
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Image(
                                    image: AssetImage('assets/card-payment.png'),
                                    width: 180,
                                    height: 180,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('assets/filipaywoman.png'), 
                                    width: 110,
                                    height: 110,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 25.0),
                                        child: Text(
                                          'TAP YOUR NFC CARD',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          myModal.qrSelect(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(180, 224, 237, 1.0),
                                          border: Border.all(
                                            color: Color.fromRGBO(82, 161, 217, 1.0),
                                            width: 3,
                                          )
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: const Image(
                                            image: AssetImage('assets/qr-code-scan.png'), 
                                            width: 45,
                                            height: 45,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                          //myModal.costSummary(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(180, 224, 237, 1.0),
                                          border: Border.all(
                                            color: Color.fromRGBO(82, 161, 217, 1.0),
                                            width: 3,
                                          )
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image(
                                            image: AssetImage('assets/reload.png'), 
                                            width: 45,
                                            height: 45,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: _isLoading
                ? widget.routePageLoad
                  ? myModal.buildRoutePageLoadingModal(context)
                  : widget.qrScanLoad
                    ? myModal.buildQRScanLoadingModal(context)
                    : SizedBox() // Default case if neither routePageLoad nor qrScanLoad is true
                : SizedBox(), // If not loading, show an empty SizedBox
            ),
          ]
        ),
      ),
    );
  }

  
}