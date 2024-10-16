import 'package:airbnb_checkin/cubits/support/support_cubit.dart';
import 'package:airbnb_checkin/models/booking/booking.dart';
import 'package:airbnb_checkin/widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupportPage extends StatefulWidget {
  final Booking booking;

  const SupportPage(this.booking, {super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => SupportCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: ListTile(
              minLeadingWidth: 0,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Image.asset(
                      widget.booking.assetPath,
                      width: 32.0,
                      height: 32.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              title: Text(
                widget.booking.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade900,
                ),
              ),
              subtitle: Text(
                '${widget.booking.guestsCount} ospiti',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: BlocBuilder<SupportCubit, List<String>>(
                  builder: (context, messages) => switch (messages) {
                    [] => Center(
                        child: Text(
                          'Nessun messaggio',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    _ => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        itemBuilder: (context, index) => MessageTile(
                          messages[index],
                        ),
                        itemCount: messages.length,
                      ),
                  },
                ),
              ),
              const Divider(),
              SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                              hintText: 'Comunica con l\'host...'),
                        ),
                      ),
                    ),
                    Builder(builder: (context) {
                      return TextButton(
                        onPressed: () => _sendMessage(context),
                        child: const Text('Invia'),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    _messageController.dispose();

    super.dispose();
  }

  void _sendMessage(BuildContext context) {
    final message = _messageController.text;
    _messageController.clear();

    context.read<SupportCubit>().sendMessage(message);
  }
}
