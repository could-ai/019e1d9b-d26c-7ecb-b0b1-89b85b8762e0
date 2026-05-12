import 'package:flutter/material.dart';

class MapDetailScreen extends StatelessWidget {
  const MapDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String mapName = ModalRoute.of(context)?.settings.arguments as String? ?? 'Карта';

    return Scaffold(
      appBar: AppBar(
        title: Text(mapName.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'map_$mapName',
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1518005020951-eccb494ad742?q=80&w=1000&auto=format&fit=crop'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.map_outlined,
                      size: 80,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ИНТЕРАКТИВНАЯ КАРТА',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildActionChip('Раскиды', Icons.shower),
                      _buildActionChip('Прострелы', Icons.crisis_alert),
                      _buildActionChip('Подсады', Icons.arrow_upward),
                      _buildActionChip('Позиции', Icons.location_on),
                      _buildActionChip('Тактики', Icons.extension),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'ВИДЕОУРОКИ ПО КАРТЕ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        color: Colors.grey[900],
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: NetworkImage('https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=500&auto=format&fit=crop'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Center(
                              child: Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
                            ),
                          ),
                          title: Text('Дефолтный раскид плента A - $mapName'),
                          subtitle: const Text('Roavchik • 10k просмотров'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionChip(String label, IconData icon) {
    return ActionChip(
      avatar: Icon(icon, size: 16, color: Colors.white),
      label: Text(label),
      backgroundColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.redAccent),
      ),
      onPressed: () {},
    );
  }
}
