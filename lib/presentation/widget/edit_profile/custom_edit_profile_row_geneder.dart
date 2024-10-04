
// import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_cubit.dart';
// import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../core/constants/app_sizes.dart';
// import '../../../generated/l10n.dart';
// import '../custom/app_text.dart';
// import '../custom/custom_radio_button.dart';

// class CustomEditProfileRowGeneder extends StatelessWidget {
//   const CustomEditProfileRowGeneder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserDataCubit, UserDataState>(
//       builder: (context, state) {
//         final cubit = context.read<UserDataCubit>();
//         return Row(
//           children: [
//             Row(
//               children: [
//                 DefaultText(
//                   text: S.of(context).male,
//                   color: AppColors.grey66,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 CustomRadioButton(
//                   value: cubit.selectedOption,
//                   groupValue: cubit.selectedOption,
//                   onChanged: (val) {
//                     cubit.changeGender(val);
//                   },
//                 ),
//               ],
//             ),
//             width(16),
//             Row(
//               children: [
//                 DefaultText(
//                   text: S.of(context).female,
//                   color: AppColors.grey66,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 CustomRadioButton(
//                   value: cubit.selectedOption,
//                   groupValue: cubit.selectedOption,
//                   onChanged: (val) {
//                     cubit.changeGender(val);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
