import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';
import 'package:qwiker_rider/features/profile/presentation/manager/user_data/user_data_cubit.dart';
import 'package:qwiker_rider/features/profile/presentation/widgets/user_data_input_fields.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<UserDataCubit>(context);
    provider.getUserProfileData();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Gap(39.h),
              SizedBox(
                height: 158.h,
                width: 158.w,
                child: CircleAvatar(
                  radius: 80.r,
                  foregroundImage: const AssetImage(
                    'assets/images/my_photo.jpg',
                  ),
                ),
              ),
              Gap(30.h),
              UserDataInputFields(
                nameHint: 'Name',
                emailHint: 'Email',
                phoneHint: 'Phone Numper',
                buttonText: 'Update Profile',
                extraPhoneHint: 'Extra Phone Number',
                buttonOnPressd: () {
                  BlocProvider.of<UserDataCubit>(context).updateUserProfileData(
                      UserModel(
                          userId: provider.phoneController.text,
                          email: provider.emailController.text,
                          userName: provider.nameController.text,
                          extraPhoneNumber:
                              provider.extraPhoneController.text));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
