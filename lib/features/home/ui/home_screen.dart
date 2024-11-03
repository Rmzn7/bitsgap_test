import 'package:bitsgap_test/features/home/controller/characters_store.dart';
import 'package:bitsgap_test/features/home/ui/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CharactersStore _charactersStore;

  @override
  void didChangeDependencies() {
    _charactersStore = Provider.of<CharactersStore>(context);
    _charactersStore.getTheCharacters();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
          body: switch (_charactersStore.charactersListFuture.status) {
        FutureStatus.rejected => Text(
            'Some error happened',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        FutureStatus.fulfilled => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 0),
            itemCount: _charactersStore.charactersListFuture.value!.length,
            itemBuilder: (context, i) {
              return CharacterCard(
                character: _charactersStore.charactersListFuture.value![i],
              );
            }),
        FutureStatus.pending => const Center(
            child: CircularProgressIndicator(),
          ),
      }),
    );
  }
}
