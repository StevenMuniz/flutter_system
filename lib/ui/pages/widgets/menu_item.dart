import 'package:app_system/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class MenuItemsp extends StatefulWidget {
  final String text;
  final bool isActive;
  final Function onPressed;

  const MenuItemsp({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  _MenuItemspState createState() => _MenuItemspState();
}

class _MenuItemspState extends State<MenuItemsp> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: isHovered ? Colors.white.withOpacity(0.1) : Colors.transparent,
      child: InkWell(
        onTap: widget.isActive ? null : () => widget.onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: Column(
              children: [
                Text(
                  widget.text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                widget.isActive
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
