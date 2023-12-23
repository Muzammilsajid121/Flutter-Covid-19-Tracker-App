import 'package:flutter/material.dart';
class ReusableRow extends StatelessWidget {
  final String title, value;
  const  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding( padding: const  EdgeInsets.all(12),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        )
      ]),

    );
  }
}


//Practice
// class ReusableButton extends StatelessWidget {
//   final String text ; final VoidCallback onPressed;
//   const ReusableButton({super.key, required this.text, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return  ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.red,
//         foregroundColor: Colors.yellow
//       ),
//       onPressed: onPressed,
//       child: Text(text),

//     );
//   }
// }