import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:azteron_case/features/messages/cubit/messages_cubit.dart';
import 'package:azteron_case/features/messages/view/messages_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = MessagesCubit();
        unawaited(cubit.loadConversations());
        return cubit;
      },
      child: const MessagesView(),
    );
  }
}
