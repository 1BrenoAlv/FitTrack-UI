import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fittrack_ui/app/view/const/colors_const.dart'; // Importe suas cores

// Você pode colocar isso dentro da sua ProfilePage
class CardBtnConfig extends StatelessWidget {
  const CardBtnConfig({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {'icon': Icons.person_outline, 'text': 'Editar Perfil'},
    {'icon': Icons.notifications_none, 'text': 'Notificações'},
    {'icon': Icons.timeline, 'text': 'Estatísticas'},
    {'icon': Icons.settings_outlined, 'text': 'Configurações'},
    {'icon': Icons.help_outline, 'text': 'Ajuda'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: ColorsConst.colorContainerMarks,
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),

      child: ListView.separated(
        itemCount: menuItems.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,

        itemBuilder: (context, index) {
          final item = menuItems[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            leading: Icon(
              item['icon'] as IconData,
              color: Color.fromARGB(255, 8, 178, 221),
            ),
            title: Text(
              item['text'] as String,
              style: GoogleFonts.workSans(
                color: const Color.fromARGB(225, 255, 255, 255),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: const Color.fromARGB(195, 255, 255, 255),
            ),

            onTap: () {},
          );
        },

        separatorBuilder: (context, index) {
          return Divider(
            color: const Color.fromARGB(22, 255, 255, 255),
            height: 1,
          );
        },
      ),
    );
  }
}
