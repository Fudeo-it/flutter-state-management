import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/pages/profile/widgets/menu_tile.dart';
import 'package:quick_commerce_app/pages/profile/widgets/profile_header.dart';
import 'package:quick_commerce_app/providers/auth/auth_provider.dart';

class ProfilePage extends ConsumerWidget {
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ProfilePage(),
    );
  }

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).value;

    return Container(
      width: double.maxFinite,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 6.0,
              width: 48.0,
              margin: EdgeInsets.only(top: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3.0),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (user != null) ProfileHeader(user),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Column(
                        spacing: 12.0,
                        children: [
                          MenuTile(
                            icon: Icons.inventory_2_outlined,
                            title: 'I miei ordini',
                            subtitle: '2 in corso',
                            iconColor: Theme.of(context).primaryColor,
                            iconBgColor: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.1),
                            showNext: true,
                            onTap: () {},
                          ),
                          MenuTile(
                            icon: Icons.credit_card,
                            title: 'Metodi di pagamento',
                            iconColor: Colors.grey.shade600,
                            iconBgColor: Colors.grey.shade100,
                            showNext: true,
                            onTap: () {},
                          ),
                          MenuTile(
                            icon: Icons.location_on_outlined,
                            title: 'Indirizzi',
                            iconColor: Colors.grey.shade600,
                            iconBgColor: Colors.grey.shade100,
                            showNext: true,
                            onTap: () {},
                          ),
                          MenuTile(
                            icon: Icons.support_agent,
                            title: 'Aiuto e supporto',
                            iconColor: Colors.grey.shade600,
                            iconBgColor: Colors.grey.shade100,
                            showNext: true,
                            onTap: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: Divider(color: Colors.grey.shade200),
                          ),
                          MenuTile(
                            icon: Icons.logout_rounded,
                            title: 'Esci',
                            iconColor: Theme.of(
                              context,
                            ).inputDecorationTheme.errorStyle?.color,
                            iconBgColor: Theme.of(context)
                                .inputDecorationTheme
                                .errorStyle
                                ?.color
                                ?.withValues(alpha: 0.1),
                            textColor: Theme.of(
                              context,
                            ).inputDecorationTheme.errorStyle?.color,
                            onTap: () => _performSignOut(context, ref),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              'Versione 2.4.0',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performSignOut(BuildContext context, WidgetRef ref) async {
    await ref.read(authProvider.notifier).signOut();

    if (!context.mounted) return;

    Navigator.of(context).maybePop();
  }
}
