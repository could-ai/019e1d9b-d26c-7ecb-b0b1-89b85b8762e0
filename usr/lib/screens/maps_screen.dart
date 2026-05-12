import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  final List<Map<String, String>> maps = const [
    {
      'name': 'Province',
      'image': 'https://images.unsplash.com/photo-1518005020951-eccb494ad742?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'Sandstone',
      'image': 'https://images.unsplash.com/photo-1483884105135-c06885c53ca7?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'Rust',
      'image': 'https://images.unsplash.com/photo-1534224039826-c7a0c073115f?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'Sakura',
      'image': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?q=80&w=1000&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Карты'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 800 ? 3 : (constraints.maxWidth > 500 ? 2 : 1);
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 16 / 9,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: maps.length,
            itemBuilder: (context, index) {
              final map = maps[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context, 
                    '/map_detail', 
                    arguments: map['name']
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Hero(
                  tag: 'map_${map['name']}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(map['image']!),
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.darken),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        map['name']!.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
