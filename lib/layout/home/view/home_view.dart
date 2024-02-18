import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_bloc.dart';

import '../../../bloc/holiday_bloc/holiday_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HolidayBloc, HolidayBlocState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}

/// 휴일 까지 몇일 남았는지 출력
class _RemainingDateField extends StatelessWidget {
  const _RemainingDateField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// 지금 어떤 휴일이며, 언제가지 쉬는지 표시

/// 추가 페이지
class HomeMenuField extends StatelessWidget {
  const HomeMenuField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
