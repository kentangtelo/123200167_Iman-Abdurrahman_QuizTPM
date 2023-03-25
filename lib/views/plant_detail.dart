// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quiz_praktpm/model/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class PlantDetailScreen extends StatefulWidget {
  final List<Diseases> favorite;
  final Diseases diseases;
  const PlantDetailScreen({
    Key? key,
    required this.favorite,
    required this.diseases,
  }) : super(key: key);

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  bool isFavorite = false;

  setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        widget.favorite.add(widget.diseases);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tambah ke Favorit'),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      } else {
        widget.favorite.remove(widget.diseases);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Hapus dari Favorit'),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isFavorite = widget.favorite.contains(widget.diseases);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Detail Disease')),
        backgroundColor: Colors.green.shade800,
        actions: [
          IconButton(
            onPressed: () {
              setFavorite();
            },
            icon: Icon(Icons.favorite, color: isFavorite ? Colors.red : null),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.diseases.imgUrls,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Disease Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.diseases.name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Plant Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.diseases.plantName,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Ciri-ciri',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return Text(
                    '${index + 1}. ${widget.diseases.nutshell[index]}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  );
                },
                itemCount: widget.diseases.nutshell.length,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Disease ID',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.diseases.id,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Symptom',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.diseases.symptom,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade800,
        onPressed: () {
          launchUrl(Uri.parse(widget.diseases.imgUrls));
        },
        child: const Icon(
          Icons.search,
        ),
      ),
    );
  }
}
