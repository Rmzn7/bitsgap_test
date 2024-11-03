import 'package:bitsgap_test/core/entities/character.dart';
import 'package:bitsgap_test/features/home/controller/characters_store.dart';
import 'package:bitsgap_test/features/home/ui/characters_details.dart';
import 'package:bitsgap_test/features/home/ui/like_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterCard extends StatefulWidget {
  const CharacterCard({super.key, required this.character});
  final CharacterGeneral character;

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  late CharactersStore _charactersStore;

  @override
  void didChangeDependencies() {
    _charactersStore = Provider.of<CharactersStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: InkWell(
        onTap: () {
          _charactersStore
              .getTheCharacterDetails(widget.character.id.toString());
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return const CharacterDetailsCard();
          }));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(children: [
                    Image.network(
                      widget.character.image,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: LikeButton(id: widget.character.id.toString())),
                  ]),
                ),
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Text(
                      widget.character.name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
