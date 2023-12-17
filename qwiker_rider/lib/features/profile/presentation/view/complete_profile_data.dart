import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/core/widgets/custom_toast.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:qwiker_rider/features/profile/presentation/manager/user_data/user_data_cubit.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../data/user_repo_imple.dart';
import '../widgets/complete_profile_data_view_body.dart';

class CompleteProfileDataView extends StatelessWidget {
  const CompleteProfileDataView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(getIt<UserRepoImple>()),
      child: Scaffold(
        body: BlocListener<UserDataCubit, UserDataState>(
            listener: (context, UserDataState state) {
              if (state is UserDataLoading) {
                showProgressIndicator(context);
              }
              if (state is UserDataSuccess) {
                Navigator.pop(context);
                CustomToast(message: 'User added successfully');
              }
              if (state is UserDataFalure) {
                Navigator.pop(context);
                print(state.errorMessage);
                CustomToast(message: state.errorMessage);
              }
            },
            child: const CompleteProfileDataViewBody()),
      ),
    );
  }
}