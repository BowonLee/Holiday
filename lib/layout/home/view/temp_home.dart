// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:holiday/model/event_date/event_date_extension.dart';
// import 'package:holiday/model/holiday/holiday_extention.dart';
//
// import '../../../model/consecutive_holidays/consecutive_holidays.dart';
// import '../../../model/holiday/holiday.dart';
// import '../../../theme_cubit/theme_cubit.dart';
// import '../../../util/datetime_extentions.dart';
// import '../../component/consecutive_holidays_card.dart';
// import '../../component/consecutive_holidays_interval_card/consecutive_holidays_interval_card.dart';
// import '../../component/next_consecutive_holidays.dart';
//
// class TempHomeView extends StatelessWidget {
//   const TempHomeView({Key? key, required this.holidayList}) : super(key: key);
//
//   final List<Holiday> holidayList;
//
//   @override
//   Widget build(BuildContext context) {
//     /// 총 연휴
//     final consecutiveHolidaysList = holidayList.toWithoutWeekend().toEventDateList().toConsecutiveHolidaysList();
//
//     /// 지금 연휴 중인지
//     final current = consecutiveHolidaysList.firstWhereOrNull((element) => element.state == DateState.now);
//
//     /// 이전 연휴
//     final prev = consecutiveHolidaysList.lastWhere((element) => element.state == DateState.before);
//
//     /// 다음 연휴
//     final next = consecutiveHolidaysList.firstWhere((element) => element.state == DateState.after);
//
//     /// 다음 연휴 목록
//     final afterList = consecutiveHolidaysList
//         .where((element) => (element.state == DateState.after))
//         .whereIndexed((index, element) => index != 0)
//         .toList();
//
//     return BlocBuilder<ThemeCubit, ThemeState>(
//       builder: (context, state) {
//         return SafeArea(
//           child: CustomScrollView(
//             slivers: <Widget>[
//               SliverPersistentHeader(
//                 delegate: _SliverAppBarDelegate(prev: prev, next: next),
//                 pinned: true,
//               ),
//               SliverToBoxAdapter(
//                 child: current == null
//                     ? _WaitingHolidayScreen(
//                         consecutiveHolidaysList: consecutiveHolidaysList,
//                       )
//                     : _OnHolidayScreen(
//                         current: current,
//                       ),
//               ),
//               SliverList(
//                   delegate: SliverChildBuilderDelegate((context, index) {
//                 return ConsecutiveHolidaysCardComponent(consecutiveHolidays: afterList[index], highLight: false);
//               }, childCount: afterList.length)),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _OnHolidayScreen extends StatelessWidget {
//   const _OnHolidayScreen({Key? key, required this.current}) : super(key: key);
//
//   final ConsecutiveHolidays current;
//
//   @override
//   Widget build(BuildContext context) {
//     return ConsecutiveHolidaysCardComponent(consecutiveHolidays: current, highLight: true);
//   }
// }
//
// class _WaitingHolidayScreen extends StatelessWidget {
//   const _WaitingHolidayScreen({Key? key, required this.consecutiveHolidaysList}) : super(key: key);
//
//   final List<ConsecutiveHolidays> consecutiveHolidaysList;
//
//   @override
//   Widget build(BuildContext context) {
//     final afterList = consecutiveHolidaysList.where((element) => element.state == DateState.after).toList();
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Text(
//             "${DateTime.now().year}년 ${DateTime.now().month}월 ${DateTime.now().day}일",
//             style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
//           ),
//           NextConsecutiveHolidays(consecutiveHolidays: afterList.first),
//           ConsecutiveHolidaysCardComponent(
//             consecutiveHolidays: afterList.first,
//             highLight: true,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ThemeChangeButtons extends StatelessWidget {
//   const ThemeChangeButtons({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeCubit, ThemeState>(
//       builder: (context, state) {
//         return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//           ...state.themeModelList
//               .map((currentThemeModel) => Padding(
//                     padding: const EdgeInsets.only(right: 4),
//                     child: ClipOval(
//                       child: Material(
//                         color: currentThemeModel.themeDarkData.primaryColor,
//                         // Button color
//                         child: InkWell(
//                           splashColor: Colors.black, // Splash color
//                           onTap: () {
//                             context.read<ThemeCubit>().themeChange(currentThemeModel);
//                           },
//                           child: SizedBox(
//                               width: 40,
//                               height: 40,
//                               child: Center(
//                                   child: Image.asset(
//                                 currentThemeModel.iconAssetUrl,
//                                 width: 30,
//                               ))),
//                         ),
//                       ),
//                     ),
//                   ))
//               .toList()
//         ]);
//       },
//     );
//   }
// }
//
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate({required this.prev, required this.next});
//
//   final ConsecutiveHolidays prev;
//   final ConsecutiveHolidays next;
//
//   bool showButtonText = true;
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return BlocBuilder<ThemeCubit, ThemeState>(
//       builder: (context, state) {
//         return Container(
//           // decoration: BoxDecoration(
//           //     image: DecorationImage(
//           //         image: AssetImage('assets/img/${state.currentThemeModel.assetFilename}'),
//           //         fit: BoxFit.cover,
//           //         opacity: 1)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 // if (shrinkOffset < 150) const ThemeChangeButtons(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ConsecutiveHolidaysIntervalCard.fromConsecutiveHolidays(last: prev, next: next),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   double get maxExtent => 300;
//
//   @override
//   double get minExtent => 150;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return maxExtent != oldDelegate.maxExtent || minExtent != oldDelegate.minExtent;
//   }
// }
