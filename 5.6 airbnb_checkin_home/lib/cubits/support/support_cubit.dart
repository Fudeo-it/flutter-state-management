import 'package:hydrated_bloc/hydrated_bloc.dart';

class SupportCubit extends HydratedCubit<List<String>> {
  static const _messagesKey = 'messages';

  SupportCubit() : super([]);

  @override
  List<String>? fromJson(Map<String, dynamic> json) {
    return json[_messagesKey];
  }

  @override
  Map<String, dynamic>? toJson(List<String> state) {
    return {_messagesKey: state};
  }

  void sendMessage(String message) {
    final newState = [...state, message];
    emit(newState);
  }
}