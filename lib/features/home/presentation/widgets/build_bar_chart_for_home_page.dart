import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';

class ModernBarChartForHomePage extends StatefulWidget {
  const ModernBarChartForHomePage({super.key});

  @override
  State<ModernBarChartForHomePage> createState() =>
      _ModernBarChartForHomePageState();
}

class _ModernBarChartForHomePageState extends State<ModernBarChartForHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // Default map in case data is not loaded yet
        final Map<String, int> completedLessonsPerDay = state.maybeWhen(
          weeklyProgressLoaded: (data) => data,
          orElse: () => {
            'Mon': 0,
            'Tue': 0,
            'Wed': 0,
            'Thu': 0,
            'Fri': 0,
            'Sat': 0,
            'Sun': 0,
          },
        );
        final String today = (DateTime.now().weekday - 1).toString();
        //final String today = HelperFunctions.getWeekday(int.parse(todaynum));

        final totalLessons =
            completedLessonsPerDay.values.fold(0, (a, b) => a + b);
        final maxY =
            (completedLessonsPerDay.values.reduce((a, b) => a > b ? a : b) + 1)
                .toDouble();

        return Container(
          height: 280.h,
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                AppColors.backgroundWiteColor,
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and total count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).weekly_progess,
                        style: FontHelper.font20BlackW700(context).copyWith(
                          fontSize: 18.sp,
                          letterSpacing: -0.5,
                          color: AppColors.darkGreyBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        S.of(context).lessons_completed_this_week,
                        style: FontHelper.font14BlackW500(context).copyWith(
                          fontSize: 13.sp,
                          color: AppColors.greyBlue,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.mainBlue.withAlpha(40),
                          AppColors.mainBlue.withAlpha(20),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.mainBlue.withAlpha(60),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      '$totalLessons ${S.of(context).total}',
                      style: FontHelper.font15BlackW600(context).copyWith(
                        fontSize: 11.sp,
                        color: AppColors.mainBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: maxY,
                    minY: 1,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: AppColors.grey.withAlpha(75),
                          strokeWidth: 1,
                          dashArray: [4, 4],
                        );
                      },
                    ),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 25,
                          getTitlesWidget: (value, meta) {
                            final days = [
                              S.of(context).mon,
                              S.of(context).tue,
                              S.of(context).wed,
                              S.of(context).thu,
                              S.of(context).fri,
                              S.of(context).sat,
                              S.of(context).sun
                            ];
                            if (value.toInt() < 0 ||
                                value.toInt() >= days.length) {
                              return const SizedBox.shrink();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                days[value.toInt()],
                                style: FontHelper.font15BlackW600(context)
                                    .copyWith(
                                  color: today == value.toInt().toString()
                                      ? AppColors.mainBlue
                                      : AppColors.greyBlue,
                                  fontSize: today == value.toInt().toString()
                                      ? 12.sp
                                      : 11.sp,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) =>
                            AppColors.darkGreyBlue.withAlpha(220),
                        tooltipPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final days = [
                            S.of(context).Monday,
                            S.of(context).Tuesday,
                            S.of(context).Wednesday,
                            S.of(context).Thursday,
                            S.of(context).Friday,
                            S.of(context).Saturday,
                            S.of(context).Sunday
                          ];
                          return BarTooltipItem(
                            '${days[group.x]}\n${rod.toY.round()} lesson${rod.toY.round() != 1 ? 's' : ''}',
                            FontHelper.font14BlackW500(context).copyWith(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          );
                        },
                      ),
                    ),
                    barGroups:
                        List.generate(completedLessonsPerDay.length, (index) {
                      final value =
                          completedLessonsPerDay.values.elementAt(index);
                      final colorStrength =
                          (100 + value * 30).clamp(100, 255).toInt();

                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: value.toDouble(),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                AppColors.mainBlue.withAlpha(colorStrength),
                                AppColors.mainBlue.withAlpha(
                                    (colorStrength - 40).clamp(100, 255)),
                              ],
                            ),
                            width: 23.w,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: maxY,
                              color: AppColors.grey.withAlpha(150),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
