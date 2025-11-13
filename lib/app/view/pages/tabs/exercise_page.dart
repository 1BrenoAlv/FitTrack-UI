import 'package:fittrack_ui/app/view/widgets/exercises/card_exercises.dart';
import 'package:fittrack_ui/app/view/widgets/exercises/enum/rank_exercise.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisePage extends StatefulWidget {
  final Function(int)? onNavigate;
  const ExercisePage({super.key, this.onNavigate});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final List<Map<String, dynamic>> allExercises = [
    {
      'calExercise': 80,
      'nameExercise': 'Polichinelo',
      'typeExercise': 'Cardio',
      'rankExercise': RankExercise.iniciante,
      'tempExercise': 30,
      'iconExercise': '🤸',
      'instructions':
          'Fique em pé com os pés juntos e braços ao lado do corpo. Pule abrindo as pernas lateralmente enquanto levanta os braços acima da cabeça. Retorne à posição inicial com outro pulo.',
      'muscles': ['Pernas', 'Core', 'Ombros'],
    },
    {
      'calExercise': 60,
      'nameExercise': 'Agachamento',
      'typeExercise': 'Força',
      'rankExercise': RankExercise.iniciante,
      'tempExercise': 45,
      'iconExercise': '🦵',
      'instructions':
          'Fique em pé com os pés afastados na largura dos ombros. Desça o quadril como se fosse sentar em uma cadeira, mantendo as costas retas. Desça até as coxas ficarem paralelas ao chão. Empurre pelos calcanhares para voltar à posição inicial.',
      'muscles': ['Quadríceps', 'Glúteos', 'Core'],
    },
    {
      'calExercise': 45,
      'nameExercise': 'Flexão',
      'typeExercise': 'Força',
      'rankExercise': RankExercise.inter,
      'tempExercise': 40,
      'iconExercise': '💪',
      'instructions':
          'Comece em posição de prancha com mãos afastadas na largura dos ombros. Desça o corpo mantendo os cotovelos próximos ao corpo. Desça até o peito quase tocar o chão. Empurre para cima até os braços ficarem estendidos.',
      'muscles': ['Peito', 'Tríceps', 'Ombros', 'Core'],
    },
    {
      'calExercise': 35,
      'nameExercise': 'Prancha',
      'typeExercise': 'Core',
      'rankExercise': RankExercise.inter,
      'tempExercise': 60,
      'iconExercise': '🧘',
      'instructions':
          'Apoie-se nos antebraços e dedos dos pés, mantendo o corpo em linha reta. Mantenha o core contraído e não deixe o quadril cair. Respire normalmente e mantenha a posição pelo tempo recomendado.',
      'muscles': ['Core', 'Ombros', 'Costas'],
    },
    {
      'calExercise': 80,
      'nameExercise': 'Burpee',
      'typeExercise': 'Cardio',
      'rankExercise': RankExercise.avancado,
      'tempExercise': 45,
      'iconExercise': '🔥',
      'instructions':
          'Comece em pé. Desça em agachamento e apoie as mãos no chão. Jogue os pés para trás ficando em posição de prancha. Faça uma flexão. Traga os pés de volta e pule explosivamente para cima com os braços estendidos.',
      'muscles': ['Corpo Todo'],
    },
    {
      'calExercise': 55,
      'nameExercise': 'Mountain Climber',
      'typeExercise': 'Cardio',
      'rankExercise': RankExercise.inter,
      'tempExercise': 40,
      'iconExercise': '⛰️',
      'instructions':
          'Comece em posição de prancha alta. Traga um joelho em direção ao peito, depois alterne rapidamente com a outra perna. Mantenha o quadril baixo e o core ativado durante todo o movimento.',
      'muscles': ['Core', 'Pernas', 'Ombros'],
    },
  ];

  late List<Map<String, dynamic>> filteredExercises;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredExercises = allExercises;
    _searchController.addListener(_filterExercises);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterExercises() {
    final query = _searchController.text.toLowerCase();
    List<Map<String, dynamic>> tempFilteredList = [];

    if (query.isEmpty) {
      tempFilteredList = allExercises;
    } else {
      tempFilteredList = allExercises.where((exercise) {
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
    return SafeArea(
      child: Container(
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
              '${filteredExercises.length} exercícios disponíveis',
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
                  childAspectRatio: 0.85,
                ),
                itemCount: filteredExercises.length,
                itemBuilder: (BuildContext context, int index) {
                  final exercise = filteredExercises[index];
                  return CardExercises(
                    exercise: exercise,
                    onNavigate: widget.onNavigate,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
