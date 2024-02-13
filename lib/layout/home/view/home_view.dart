import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_bloc.dart';

import '../../../bloc/holiday_bloc/holiday_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HolidayBloc, GetHolidayState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
