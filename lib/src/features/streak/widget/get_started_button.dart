import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(242, 232, 235, 1)),
                child: Center(
                  child: Text('Get Started',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,color: Colors.black),
                    ),
                ),
                );
  }
}