import 'package:e_learning_app/instructor_feature/home/logic/cubit/home_instructor_cubit.dart';
import 'package:e_learning_app/instructor_feature/home/presentation/widgets/sliver_app_bar_for_instructor_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/home_instructor_state.dart';
import '../widgets/build_course_overview_tap.dart';

class InstructorHomeScreen extends StatefulWidget {
  const InstructorHomeScreen({super.key});

  @override
  State<InstructorHomeScreen> createState() => _InstructorHomeScreenState();
}

class _InstructorHomeScreenState extends State<InstructorHomeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeInstructorCubit>(context);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
        bloc: cubit,
        buildWhen: (previous, current) =>
            current is HomeIstructorLoading ||
            current is HomeIstructorSuccess ||
            current is HomeIstructorError,
        builder: (context, state) {
          if (state is HomeIstructorLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is HomeIstructorError) {
            return _buildErrorState(state.error);
          } else if (state is HomeIstructorSuccess) {
            final profileData = state.profileDate;
            return SafeArea(
              child: DefaultTabController(
                length: 2,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBarForInstructorPage(
                        instructorProfile: profileData),
                    SliverFillRemaining(
                      child: TabBarView(
                        children: [
                          BuildCourseOverviewTap(
                            instructorProfile: profileData,
                            state: state,
                            cubit: cubit,
                          ),
                          _buildRecentActivityTab(profileData),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.red[100]!),
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48.sp,
                color: Colors.red[400],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Oops! Something went wrong',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                // Retry logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 2,
              ),
              child: Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivityTab(profileData) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActivityHeader(),
          SizedBox(height: 20.h),
          _buildActivityList(),
        ],
      ),
    );
  }

  Widget _buildActivityHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recent Activity',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            'Last 7 days',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.blue[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActivityList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) => _buildActivityItem(index),
    );
  }

  Widget _buildActivityItem(int index) {
    final activities = [
      {
        'title': 'New student enrolled in Flutter Course',
        'time': '2 hours ago',
        'icon': Icons.person_add_outlined,
        'color': Colors.green,
      },
      {
        'title': 'Course "UI/UX Design" received a 5-star review',
        'time': '4 hours ago',
        'icon': Icons.star_outline,
        'color': Colors.orange,
      },
      {
        'title': 'Payment received: \$89.99',
        'time': '6 hours ago',
        'icon': Icons.payment_outlined,
        'color': Colors.blue,
      },
      {
        'title': 'New course material uploaded',
        'time': '1 day ago',
        'icon': Icons.upload_file_outlined,
        'color': Colors.purple,
      },
      {
        'title': 'Student completed "Mobile Architecture" course',
        'time': '2 days ago',
        'icon': Icons.check_circle_outline,
        'color': Colors.teal,
      },
    ];

    final activity = activities[index];
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: (activity['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              activity['icon'] as IconData,
              size: 20.sp,
              color: activity['color'] as Color,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['title'] as String,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  activity['time'] as String,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
