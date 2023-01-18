import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/widgets/user/customer/customer_grid.dart';
import 'package:jasa_pengiriman/widgets/user/kurir/kurir_grid.dart';
import 'package:jasa_pengiriman/widgets/user/penerima/penerima_grid.dart';
import 'package:provider/provider.dart';
import 'package:jasa_pengiriman/screens/add_or_detail_screen.dart';

import '../../provider/users.dart';

const List<String> listUserType = <String>['customer', 'penerima', 'kurir'];

class UserFutureBuilder extends StatefulWidget {
  const UserFutureBuilder({super.key});

  @override
  State<UserFutureBuilder> createState() => _UserFutureBuilderState();
}

class _UserFutureBuilderState extends State<UserFutureBuilder> {
  String userType= listUserType.first;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Users>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            value: userType,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              setState(() {
                userType = value!;
              });
            },
            items: listUserType.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(child: getFutureBuilder(userType, userProvider)),
        ],
      ),
    );
  }
}

Widget getFutureBuilder(userType, userProvider) {
  if(userType == 'customer') {
    return FutureBuilder(
      future: userProvider.getAndSetCustomers(),
      builder: (context, transaksiSnapshot) {
        if(transaksiSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if(transaksiSnapshot.hasError) {
          return Center(child: Text(transaksiSnapshot.error.toString()),);
        }

        return const CustomerGrid();
      },
    );
  }
  else if (userType == 'penerima') {
    return FutureBuilder(
      future: userProvider.getAndSetPenerima(),
      builder: (context, transaksiSnapshot) {
        if(transaksiSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if(transaksiSnapshot.hasError) {
          return Center(child: Text(transaksiSnapshot.error.toString()),);
        }

        return const PenerimaGrid();
      },
    );
  }
  else {
    return FutureBuilder(
      future: userProvider.getAndSetKurir(),
      builder: (context, transaksiSnapshot) {
        if(transaksiSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if(transaksiSnapshot.hasError) {
          return Center(child: Text(transaksiSnapshot.error.toString()),);
        }

        return const KurirGrid();
      },
    );
  }
}