import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String amount, code, name;
  final IconData icon;
  final bool isInverted;
  final int order;

  final _blackColor = const Color.fromARGB(255, 14, 15, 17);

  const CurrencyCard(
      {super.key,
      required this.amount,
      required this.code,
      required this.name,
      required this.icon,
      this.isInverted = false,
      this.order = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (order - 1) * -20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isInverted ? Colors.white : _blackColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icon,
                    color: isInverted
                        ? _blackColor
                        : Colors.white.withOpacity(0.8),
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
