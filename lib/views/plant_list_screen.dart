import 'package:flutter/material.dart';

import 'package:quiz_praktpm/views/plant_detail.dart';

import '../model/disease_data.dart';

class PlantListScreen extends StatefulWidget {
  const PlantListScreen({super.key});

  @override
  State<PlantListScreen> createState() => _PlantListScreenState();
}

class _PlantListScreenState extends State<PlantListScreen> {
  var plantFavorite = <Diseases>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Center(child: Text('Plant Diseases')),
        backgroundColor: Colors.green.shade800,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          Diseases diseases = listDisease[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 10,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlantDetailScreen(
                      favorite: plantFavorite,
                      diseases: diseases,
                    ),
                  ),
                );
              },
              child: cardContent(listDisease[index], context),
            ),
          );
        },
        itemCount: listDisease.length,
      ),
    );
  }
}

cardContent(var disease, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              disease.imgUrls,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          disease.name,
          style: const TextStyle(
            fontSize: 12,
            overflow: TextOverflow.clip,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
