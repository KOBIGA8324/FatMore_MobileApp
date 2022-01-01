// final database1 = FirebaseFirestore.instance;
// Future<QuerySnapshot> years = database1
//     .collection('years')
//     .get();
//
// class ReadDataFromFirestore extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return FutureBuilder<QuerySnapshot>(
//         future: years,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final List<DocumentSnapshot> documents = snapshot.data.docs;
//             return ListView(
//                 children: documents
//                     .map((doc) => Card(
//                   child: ListTile(
//                     title: Text('doc.id: ${doc.id}'),
//                     //subtitle: Text('category:     ${doc['category']}'),
//                   ),
//                 ))
//                     .toList());
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error);
//           }
//           return CircularProgressIndicator();
//         }
//     );
//   }
// }
