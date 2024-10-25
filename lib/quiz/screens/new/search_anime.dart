// import 'package:flutter/material.dart';

// class SearchAnime extends StatefulWidget {
//   @override
//   _SearchAnimeState createState() => _SearchAnimeState();
// }

// class _SearchAnimeState extends State<SearchAnime> {
//   final List<String> data = [
//     'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
//     'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
//     'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
//     'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
//     'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
//   ];

//   String query = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: TextField(
//           onChanged: (value) {
//             setState(() {
//               query = value;
//             });
//           },
//           decoration: InputDecoration(
//             hintText: 'Rechercher un anime',
//             suffixIcon: IconButton(
//               icon: const Icon(Icons.clear),
//               onPressed: () {
//                 setState(() {
//                   query = '';
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//       body: _buildListView(),
//     );
//   }

//   Widget _buildListView() {
//     final List<String> suggestions = data
//         .where((element) => element.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: Container(
//             width: 40,
//             height: 40,
//             color: Colors.grey[300],
//           ),
//           title: Text(suggestions[index]),
//           onTap: () {
//             setState(() {
//               query = suggestions[index];
//             });
//           },
//         );
//       },
//     );
//   }
// }
