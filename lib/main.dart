import 'package:flutter/material.dart';
import 'package:jasa_pengiriman/screens/add_or_detail_screen.dart';
import 'package:jasa_pengiriman/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:jasa_pengiriman/provider/transaksis.dart';
import 'package:jasa_pengiriman/provider/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (context) => Transaksis()),
        ChangeNotifierProvider(create: (context) => Users()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          AddOrDetailScreen.routeName : (context) => const AddOrDetailScreen(),
        }
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Future<List<Transaksi>> futureTransaksi;

//   @override
//   void initState() {
//     super.initState();
//     futureTransaksi = TransaksiApi().getAllTransaksi();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Transaksis(),
//     )
//   }
// }

// return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: FutureBuilder<List<Transaksi>>(
//             future: futureTransaksi,
//             builder: (context, snapshot) {
//               if(snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator(),);
//               }
//               if (snapshot.hasData) {
//                 return GridView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (ctx, index) {
//                     return Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           color: Colors.amber,
//                           borderRadius: BorderRadius.circular(15)),
//                       child: Column(
//                         children: [
//                           Text(snapshot.data![index].noResi.toString()),
//                           Text(snapshot.data![index].namaBarang.toString()),
//                           Text(snapshot.data![index].beratBarang.toString()),
//                           Text(snapshot.data![index].jenisBarang.toString()),
//                           Text(snapshot.data![index].metodePengiriman.toString()),
//                           Text(snapshot.data![index].ongkir.toString()),
//                           Text(snapshot.data![index].status.toString()),
//                           Text(snapshot.data![index].tanggalKirim.toString()),
//                           Text(snapshot.data![index].tanggalTerima.toString()),
//                         ],
//                       )
//                       );
//                   },
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                   ),);
//                 // Text(snapshot.data!.toString());
//               } if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           )
//         ), 
//       ),
//     );