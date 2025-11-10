import 'package:fittrack_ui/app/view/widgets/exercises/card_exercises.dart';
import 'package:fittrack_ui/app/view/widgets/exercises/enum/rank_exercise.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final List<Map<String, dynamic>> exerciseCards = [
    {
      'calExercise': 80,
      'nameExercise': 'Polichinelo',
      'typeExercise': 'Cardio',
      'rankExercise': RankExercise.iniciante,
      'tempExercise': 30,
      'iconExercise': '🤸',
    },
    {
      'calExercise': 60,
      'nameExercise': 'Agachamento',
      'typeExercise': 'Força',
      'rankExercise': RankExercise.iniciante,
      'tempExercise': 45,
      'iconExercise': '🦵',
    },
    {
      'calExercise': 45,
      'nameExercise': 'Flexão',
      'typeExercise': 'Força',
      'rankExercise': RankExercise.inter,
      'tempExercise': 40,
      'iconExercise': '💪',
    },
    {
      'calExercise': 35,
      'nameExercise': 'Prancha',
      'typeExercise': 'Core',
      'rankExercise': RankExercise.inter,
      'tempExercise': 60,
      'iconExercise': '🧘',
    },
    {
      'calExercise': 80,
      'nameExercise': 'Burpee',
      'typeExercise': 'Cardio',
      'rankExercise': RankExercise.avancado,
      'tempExercise': 45,
      'iconExercise': '🔥',
    },
    {
      'calExercise': 55,
      'nameExercise': 'Mountain Climber',
      'typeExercise': 'Cardio',
      'rankExercise': RankExercise.inter,
      'tempExercise': 40,
      'iconExercise': '⛰️',
    },
  ];

  late List<Map<String, dynamic>> filteredExercises;
  final TextEditingController _searchController = TextEditingController();

  // START OF THE LOGIC TO BE ABLE TO SEARCH FOR THE EXERCISE

  @override
  void initState() {
    super.initState();

    filteredExercises = exerciseCards;
    _searchController.addListener(
      _filterExercises,
    ); //CONTROLLER TO SEARCH FOR AN ITEM
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterExercises() {
    // FILTERS WHAT IS PLACED IN THE INPUT
    final query = _searchController.text.toLowerCase();

    List<Map<String, dynamic>> tempFilteredList = [];

    if (query.isEmpty) {
      tempFilteredList = exerciseCards;
    } else {
      tempFilteredList = exerciseCards.where((exercise) {
        final exerciseName = exercise['nameExercise'].toString().toLowerCase();
        return exerciseName.contains(query);
      }).toList();
    }

    setState(() {
      filteredExercises = tempFilteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exercícios',
            style: GoogleFonts.workSans(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${exerciseCards.length} exercícios disponíveis',
            style: GoogleFonts.workSans(
              color: const Color.fromARGB(188, 255, 255, 255),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            style: GoogleFonts.workSans(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF1F1C2C),

              hintText: 'Buscar exercícios...',
              hintStyle: GoogleFonts.workSans(
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredExercises.length,
              itemBuilder: (BuildContext context, int index) {
                final exercise = filteredExercises[index];
                return CardExercises(
                  calExercise: exercise['calExercise'],
                  nameExercise: exercise['nameExercise'],
                  typeExercise: exercise['typeExercise'],
                  rankExercise: exercise['rankExercise'],
                  tempExercise: exercise['tempExercise'],
                  iconExercise: exercise['iconExercise'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
