import 'package:docflow/core/widgets/app_loader.dart';
import 'package:flutter/material.dart';

class PaywallA extends StatefulWidget {
  final VoidCallback onPurchase;
  final VoidCallback onRestore;

  const PaywallA({
    super.key,
    required this.onPurchase,
    required this.onRestore,
  });

  @override
  State<PaywallA> createState() => _PaywallAState();
}

class _PaywallAState extends State<PaywallA> {
  bool _isLoading = false;

  void _handlePurchase() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
    widget.onPurchase();
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  void _handleRestore() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
    widget.onRestore();
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: AppLoader(),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/images/paywall_top.png',
                      width: MediaQuery.of(context).size.width - 48,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 81,
                      child: Image.asset(
                        'assets/images/element2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    _buildSubscriptionOption(
                      title: '3-Day Free Trial',
                      subtitle: 'then 4.99\$/week',
                      price: '\$0.00',
                      onTap: _handlePurchase,
                      isPrimary: true,
                    ),
                    const SizedBox(height: 16),
                    _buildSubscriptionOption(
                      title: 'Annual plan',
                      subtitle: 'Enjoy unlimited access!',
                      price: '\$39.99',
                      onTap: _handlePurchase,
                      isPrimary: false,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _handlePurchase,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5436FF),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Try For Free',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {/* TODO: Terms */},
                          child: const Text(
                            'Terms',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        const SizedBox(width: 24),
                        TextButton(
                          onPressed: () {/* TODO: Privacy */},
                          child: const Text(
                            'Privacy',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        const SizedBox(width: 24),
                        TextButton(
                          onPressed: _handleRestore,
                          child: const Text(
                            'Restore',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption({
    required String title,
    required String subtitle,
    required String price,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF5436FF) : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isPrimary ? Colors.white : Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: isPrimary ? Colors.white70 : Colors.grey,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
            Text(
              price,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isPrimary ? Colors.white : Colors.black,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}