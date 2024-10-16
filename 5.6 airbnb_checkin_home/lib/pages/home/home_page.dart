import 'package:airbnb_checkin/blocs/booking/booking_bloc.dart';
import 'package:airbnb_checkin/cubits/auth/auth_cubit.dart';
import 'package:airbnb_checkin/models/booking/booking.dart';
import 'package:airbnb_checkin/models/user/user.dart';
import 'package:airbnb_checkin/pages/home/dialogs/checked_in_booking_dialog.dart';
import 'package:airbnb_checkin/pages/home/dialogs/checked_out_booking_dialog.dart';
import 'package:airbnb_checkin/pages/home/dialogs/error_checking_in_booking_dialog.dart';
import 'package:airbnb_checkin/pages/home/dialogs/error_checking_out_booking_dialog.dart';
import 'package:airbnb_checkin/pages/home/widgets/perform_check_in_section.dart';
import 'package:airbnb_checkin/pages/home/widgets/perform_check_out_section.dart';
import 'package:airbnb_checkin/widgets/custom_body.dart';
import 'package:airbnb_checkin/widgets/loading_widget.dart';
import 'package:airbnb_checkin/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => BookingBloc(
          bookingRepository: context.read(),
        ),
        child: BlocSelector<AuthCubit, AuthState, bool>(
          selector: (state) => switch (state) {
            NotAuthenticatedAuthState() => true,
            _ => false,
          },
          builder: (context, canPop) => PopScope(
            canPop: canPop,
            child: Scaffold(
              body: CustomBody(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sei loggata come:',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                          fontSize: 14.0,
                        ),
                      ),
                      BlocSelector<AuthCubit, AuthState, User?>(
                        selector: (state) => switch (state) {
                          AuthenticatedAuthState(:final user) => user,
                          _ => null,
                        },
                        builder: (context, user) => switch (user) {
                          User() => UserTile(user),
                          _ => const SizedBox.shrink(),
                        },
                      ),
                      BlocConsumer<BookingBloc, BookingState>(
                        listener: (context, state) => switch (state) {
                          CheckedInBookingState() => _onCheckedIn(context),
                          CheckedOutBookingState() => _onCheckedOut(context),
                          ErrorCheckingInBookingState() =>
                            _onErrorCheckingIn(context),
                          ErrorCheckingOutBookingState() =>
                            _onErrorCheckingOut(context),
                          _ => null,
                        },
                        builder: (context, state) => switch (state) {
                          CheckingInBookingState() => const LoadingWidget(
                              padding: EdgeInsets.symmetric(vertical: 64.0),
                            ),
                          CheckingOutBookingState() => const LoadingWidget(
                              padding: EdgeInsets.symmetric(vertical: 64.0),
                            ),
                          CheckedInBookingState(:final booking) =>
                            PerformCheckOutSection(
                              booking,
                              onTapCheckout: () => _performCheckOut(
                                context,
                                booking,
                              ),
                              onTapSupport: () => _navigateToSupport(
                                context,
                                booking,
                              ),
                            ),
                          _ => PerformCheckInSection(
                              pinController: _pinController,
                              onCheckIn: (pinCode) =>
                                  _performCheckIn(context, pinCode),
                            ),
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        width: double.maxFinite,
                        child: OutlinedButton(
                          onPressed: () => _performSignOut(context),
                          child: const Text('Esci'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pinController.dispose();

    super.dispose();
  }

  void _performSignOut(BuildContext context) =>
      context.read<AuthCubit>().signOut();

  void _performCheckIn(BuildContext context, String pinCode) =>
      context.read<BookingBloc>().checkIn(pinCode);

  void _performCheckOut(BuildContext context, Booking booking) =>
      context.read<BookingBloc>().checkOut(booking);

  void _navigateToSupport(BuildContext context, Booking booking) {}

  void _onCheckedIn(BuildContext context) {
    _pinController.clear();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (_) => const CheckedInBookingDialog(),
      );
    });
  }

  void _onCheckedOut(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (_) => const CheckedOutBookingDialog(),
      );
    });
  }

  void _onErrorCheckingIn(BuildContext context) {
    _pinController.clear();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (_) => const ErrorCheckingInBookingDialog(),
      );
    });
  }

  void _onErrorCheckingOut(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (_) => const ErrorCheckingOutBookingDialog(),
      );
    });
  }
}
