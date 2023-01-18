import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/models/customer.dart';
import 'package:jasa_pengiriman/provider/users.dart';
import 'package:jasa_pengiriman/widgets/transaksi/transaksi_item.dart';
import 'package:jasa_pengiriman/widgets/user/customer/customer_item.dart';
import 'package:provider/provider.dart';

class CustomerGrid extends StatefulWidget {
  const CustomerGrid({super.key});

  @override
  State<CustomerGrid> createState() => _CustomerGridState();
}

class _CustomerGridState extends State<CustomerGrid> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Users>(context);
    List<Customer> listCustomer = userProvider.customers;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listCustomer.length,
        itemBuilder: (context, index) => CustomerItem(
          id: listCustomer[index].idCustomer,
          ctx: context,
        ),
      ),
    );
  }
}