import 'package:flutter/material.dart';

class SecondaryPage extends StatelessWidget {
  const SecondaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Seznam karet, který můžeš libovolně měnit
    final List<CardModel> cards = [
      CardModel(
        title: 'Akce 1',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vulputate diam at suscipit malesuada. Donec a sapien vel augue venenatis lacinia. Integer euismod condimentum metus eu blandit. Nam eget elit sed libero pellentesque vehicula. Vivamus et orci at est convallis convallis.',
      ),
      CardModel(
        title: 'Akce 2',
        content: 'Vestibulum sit amet eros ut turpis tempor sodales eu eu est. Nam a urna ante. Cras dapibus consectetur urna, ac pharetra turpis maximus eu. Quisque viverra auctor euismod. Proin vitae tincidunt metus. Mauris non mauris et lacus consequat volutpat. Sed in ligula id lectus tincidunt aliquam.',
      ),
      CardModel(
        title: 'Akce 3',
        content: 'Phasellus non quam ultricies, varius felis sed, pharetra libero. Duis luctus urna sit amet mauris cursus, eu elementum mi lacinia. Suspendisse at purus et lorem lobortis malesuada. Sed tincidunt felis eu nisi posuere feugiat. Fusce tempor, ante vitae lacinia tempor, felis neque cursus nunc, vel porttitor risus ligula et justo.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cards.length == 1 ? 1 : 2,  // Pokud je jen 1 karta, vyplní celou šířku
            crossAxisSpacing: 16.0,  // Mezera mezi sloupci
            mainAxisSpacing: 16.0,   // Mezera mezi řádky
            childAspectRatio: 1.0,   // Poměr šířky a výšky karty
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return _buildCard(context, cards[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CardModel card) {
    // Pevné rozměry karty (šířka a výška)
    const double cardWidth = 400.0; // Pevná šířka karty
    const double cardHeight = 300.0; // Pevná výška karty

    return GestureDetector(
      onTap: () {
        // Zobrazí celý obsah v modálním okně (Dialogu)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(card.title),
              content: Text(card.content),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Zavřít'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          width: cardWidth,  // Nastavíme pevnou šířku
          height: cardHeight,  // Nastavíme pevnou výšku
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    card.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down, // Trojúhelníček směřující dolů
                    size: 24,
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Omezení výšky textu na 2 řádky
              Container(
                height: 40,  // Omezíme výšku obdélníku na 2 řádky textu
                child: Text(
                  card.content,
                  maxLines: 2,  // Maximální počet řádků
                  overflow: TextOverflow.ellipsis,  // Text se ořízne, pokud je dlouhý
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardModel {
  final String title;
  final String content;

  CardModel({required this.title, required this.content});
}
