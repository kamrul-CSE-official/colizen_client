import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),

            // 🔘 Radio Circle
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
