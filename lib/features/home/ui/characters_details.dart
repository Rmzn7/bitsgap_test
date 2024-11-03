import 'package:bitsgap_test/core/entities/character_details.dart';
import 'package:bitsgap_test/core/enums/gender.dart';
import 'package:bitsgap_test/core/enums/species.dart';
import 'package:bitsgap_test/core/enums/status.dart';
import 'package:bitsgap_test/core/extensions/string_extension.dart';
import 'package:bitsgap_test/features/home/controller/characters_store.dart';
import 'package:bitsgap_test/features/home/ui/default_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/src/api/async.dart';
import 'package:provider/provider.dart';

class CharacterDetailsCard extends StatefulWidget {
  const CharacterDetailsCard({super.key});

  @override
  State<CharacterDetailsCard> createState() => _CharacterDetailsCardState();
}

class _CharacterDetailsCardState extends State<CharacterDetailsCard> {
  late CharactersStore _charactersStore;

  @override
  void didChangeDependencies() {
    _charactersStore = Provider.of<CharactersStore>(context);
    super.didChangeDependencies();
  }

  String selectIconGender(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'assets/icons/male.svg';
      case Gender.unknown:
        return 'assets/icons/unknown_gender.svg';
      case Gender.female:
        return 'assets/icons/female.svg';
    }
  }

  String selectIconStatus(Status status) {
    switch (status) {
      case Status.alive:
        return 'assets/icons/alive.svg';
      case Status.unknown:
        return 'assets/icons/unknown_status.svg';
      case Status.dead:
        return 'assets/icons/dead.svg';
    }
  }

  String selectIconSpecies(Species species) {
    switch (species) {
      case Species.human:
        return 'assets/icons/human.svg';
      case Species.alien:
        return 'assets/icons/alien.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        body: switch (_charactersStore.characterDetailsFuture.status) {
          FutureStatus.pending => const Center(
              child: CircularProgressIndicator(),
            ),
          FutureStatus.rejected => const Center(
              child: Text('Something happened'),
            ),
          FutureStatus.fulfilled => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      _charactersStore.characterDetailsFuture.value!.image,
                      width: MediaQuery.of(context).size.width,
                      height: 260,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/arrow_left.svg',
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                DefaultBlock(
                    title: 'Name',
                    subtitle:
                        _charactersStore.characterDetailsFuture.value!.name,
                    iconPath: 'assets/icons/information.svg'),
                DefaultBlock(
                    title: 'Status',
                    subtitle: _charactersStore.characterDetailsFuture.value!
                        .status.name.toCapitalized,
                    iconPath: selectIconStatus(
                        _charactersStore.characterDetailsFuture.value!.status)),
                DefaultBlock(
                    title: 'Species',
                    subtitle: _charactersStore.characterDetailsFuture.value!
                        .species.name.toCapitalized,
                    iconPath: selectIconSpecies(_charactersStore
                        .characterDetailsFuture.value!.species)),
                DefaultBlock(
                    title: 'Gender',
                    subtitle: _charactersStore.characterDetailsFuture.value!
                        .gender.name.toCapitalized,
                    iconPath: selectIconGender(
                        _charactersStore.characterDetailsFuture.value!.gender)),
              ],
            ),
        },
      ),
    );
  }
}
