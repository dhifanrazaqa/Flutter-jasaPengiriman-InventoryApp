import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/models/customer.dart';
import 'package:jasa_pengiriman/models/kurir.dart';
import 'package:jasa_pengiriman/models/penerima.dart';
import 'package:jasa_pengiriman/models/transaksi.dart';
import 'package:jasa_pengiriman/provider/users.dart';
import 'package:jasa_pengiriman/widgets/transaksi/transaksi_futurebuilder.dart';
import 'package:jasa_pengiriman/widgets/user/user_futurebuilder.dart';
import '../widgets/transaksi/transaksi_grid.dart';
import 'package:provider/provider.dart';
import 'package:jasa_pengiriman/provider/transaksis.dart';
import 'package:jasa_pengiriman/screens/add_or_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    TransaksiFutureBuilder(),
    UserFutureBuilder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final transaksiProvider = Provider.of<Transaksis>(context);
    final userProvider = Provider.of<Users>(context);

    userProvider.getAndSetCustomers();
    userProvider.getAndSetPenerima();
    userProvider.getAndSetKurir();

    List<Transaksi> listTransaksi = transaksiProvider.transaksis;
    List<Customer> listCustomer = userProvider.customers;
    List<Penerima> listPenerima = userProvider.penerimas;
    List<Kurir> listKurir = userProvider.kurirs;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Jasa Pengiriman'),
        backgroundColor: const Color(0xff4B56D2),
        elevation: 0,
        actions: [
          _selectedIndex == 0 
          ? 
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddOrDetailScreen.routeName,
                arguments: ''
              );
            },
            icon: const Icon(Icons.add)
          )
          : 
          Container()
        ],
        leading: IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: const Icon(Icons.refresh)
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.11,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.09 - 27,
                  decoration: const BoxDecoration(
                    color: Color(0xff4B56D2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: size.height * 0.08,
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        margin: EdgeInsets.only(top: size.width * 0.025,left: size.width * 0.025, right: size.width * 0.025),
                        child: Column(children: [
                          Text(listTransaksi.length.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          const Text("Transaksi", style: TextStyle(color: Colors.grey),)
                        ],),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.width * 0.025,left: size.width * 0.025, right: size.width * 0.025),
                        child: Column(children: [
                          Text(listCustomer.length.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          const Text("Customer", style: TextStyle(color: Colors.grey),)
                        ],),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.width * 0.025,left: size.width * 0.025, right: size.width * 0.025),
                        child: Column(children: [
                          Text(listPenerima.length.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          const Text("Penerima", style: TextStyle(color: Colors.grey),)
                        ],),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.width * 0.025,left: size.width * 0.025, right: size.width * 0.025),
                        child: Column(children: [
                          Text(listKurir.length.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          const Text("Kurir", style: TextStyle(color: Colors.grey),)
                        ],),
                      ),
                    ]),
                  )
                ),
              ]
            ) 
          ),
          Expanded(
            child: SizedBox(
              child: _widgetOptions.elementAt(_selectedIndex)
            )
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,   // <-- HERE
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User Data',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff4B56D2),
        onTap: _onItemTapped,
      ), 
    );
  }
}

      // floatingActionButton: 
      // _selectedIndex == 0 
      // ? 
      // FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(
      //       AddOrDetailScreen.routeName,
      //       arguments: ''
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // )
      // :
      // Container()