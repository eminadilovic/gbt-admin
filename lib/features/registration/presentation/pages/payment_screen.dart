import 'package:flutter/material.dart';

import '../../../../shared/custom_button.dart';
import '../../../../theme/src/app_colors.dart';
import 'success_registration.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/barbershopbg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text(
                    'Choose a Subscription Plan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SubscriptionOption(
                    title: 'Basic',
                    price: r'$19.99',
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 20),
                  SubscriptionOption(
                    title: 'Standard',
                    price: r'$39.99',
                    color: Colors.amber.withOpacity(0.5),
                  ),
                  const SizedBox(height: 20),
                  SubscriptionOption(
                    title: 'Premium',
                    price: r'$69.99',
                    color: Colors.yellow.withOpacity(0.5),
                  ),
                  const Spacer(),
                  CustomButton(
                    text: 'Create Shop',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessPage()),
                      );
                    },
                    buttonColor: AppColors.secondary,
                    isExpanded: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class SubscriptionOption extends StatelessWidget {
  final String title;
  final String price;
  final Color color;

  const SubscriptionOption({required this.title, required this.price, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
