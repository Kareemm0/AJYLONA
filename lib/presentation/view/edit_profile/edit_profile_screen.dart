import 'package:ageal/domain/entity/auth/user.dart';
import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_cubit.dart';
import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_state.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:ageal/presentation/widget/custom/form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routing/routes.dart';
import '../../../core/constants/app_colors.dart';

import '../../widget/custom/app_text.dart';

import '../../widget/custom/default_button.dart';
import '../../widget/custom/white_container.dart';
import '../../widget/edit_profile/remove_account_alert.dart';

class EditProfileScreen extends StatefulWidget {
  final UserDataEntity? userEntity;
  const EditProfileScreen({super.key, this.userEntity});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _dateController;
  DateTime? _selectedDate;
  String? _gender;
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      fieldHintText: "context.tr.dayMonthYear",
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
            "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneNumberController =
        TextEditingController(text: widget.userEntity?.phone);
    _nameController = TextEditingController(text: widget.userEntity?.name);
    _emailController = TextEditingController(text: widget.userEntity?.email);
    _dateController =
        TextEditingController(text: widget.userEntity?.birthdate.toString());
    _gender = widget.userEntity?.gender;
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataCubit, UserDataState>(
      listener: (context, state) {
        if (state is GetDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failureMessage),
            ),
          );
        }
        if (state is UpdateDataSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.updatedSuccess),
            ),
          );
          context.pushNamed(Routes.navBar);
        }

        if (state is UpdateDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failureMessage),
            ),
          );
        }
        if (state is DeletedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.deletedSuccess),
            ),
          );
          context.pushNamed(Routes.home);
        }

        if (state is DeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failureMessage),
            ),
          );
        }
      },
      child: CustomStackScaffold(
        //backgroundImagePath: AppAssets.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const Center(
                        child: DefaultText(
                          text: "context.tr.profile",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColors.greyF2,
                              child: Icon(Icons.person,
                                  size: 50, color: AppColors.blue25),
                            ),
                          ),
                          // Positioned(
                          //   bottom: 0,
                          //  top:  0.05,
                          //  right: 3,
                          //   child: IconButton(
                          //     icon: const CircleAvatar(
                          //         backgroundColor: AppColors.blue25
                          //         child: Icon(
                          //           Icons.edit,
                          //           color: AppColors.white,
                          //           size: 26,
                          //         )),
                          //     onPressed: () {
                          //       // Handle edit profile picture action
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      // SizedBox(height: context.h * 0.06),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DefaultText(
                            text: " context.tr.name",
                            color: AppColors.blue25,
                          ),
                          const SizedBox(height: 4),
                          TextFormFieldFullName(
                            hintText: " context.tr.name",
                            controller: _nameController,
                            borderColor: AppColors.greyc4,
                          ),
                          const SizedBox(height: 16),
                          const DefaultText(
                            text: "context.tr.phoneNumber",
                            color: AppColors.blue25,
                          ),
                          const SizedBox(height: 4),
                          TextFormFieldCustom(
                            controller: _phoneNumberController,
                            hintText: "context.tr.phoneNumber",
                          ),
                          const SizedBox(height: 16),
                          const DefaultText(
                            text: "context.tr.email",
                            color: AppColors.blue25,
                          ),
                          const SizedBox(height: 4),
                          TextFormFieldEmail(
                            controller: _emailController,
                            // validator: (value) {
                            //   if (value != null &&
                            //       !Validations.isEmailValid(value)) {
                            //     return 'يرجى إدخال بريد الكتروني صحيح';
                            //   }
                            //   return null;
                            // },
                          ),
                          const SizedBox(height: 16),
                          const DefaultText(text: " context.tr.age"),
                          const SizedBox(height: 4),
                          TextFormField(
                            controller: _dateController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "context.tr.dayMonthYear",
                                hintStyle: TextStyle(
                                  color: AppColors.grey9c,
                                )),
                            onTap: () async {
                              await _selectDate(context);
                              FocusScope.of(context.mounted ? context : context)
                                  .unfocus();
                            },
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'يرجى إدخال عمرك';
                            //   }
                            //   return null;
                            // },
                          ),
                          const SizedBox(height: 16),
                          const DefaultText(text: "context.tr.gender"),
                          const SizedBox(height: 4),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const DefaultText(
                                  text: " context.tr.male",
                                ),
                                Radio<String>(
                                  value: 'ذكر',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const DefaultText(
                                  text: " context.tr.female",
                                ),
                                Radio<String>(
                                  value: 'انثي',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //  SizedBox(height: context.h * 0.01),
                      DefaultButton(
                        width: double.infinity,
                        title: "context.tr.deleteAccount",
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return RemoveAccountAlert(
                                onPressed: () {
                                  context.read<UserDataCubit>().deleteProfile();
                                  context.pop();
                                },
                              );
                            },
                          );

                          FocusScope.of(context.mounted ? context : context)
                              .unfocus();
                        },
                        containerColor: AppColors.red,
                      ),
                      // SizedBox(height: context.h * 0.01),
                    ],
                  ),
                ),
                WhiteContainer(
                  widget: DefaultButton(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    title: " context.tr.save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<UserDataCubit>().updateUserData(
                              name: _nameController.text,
                              phoneNumber: _phoneNumberController.text,
                              email: _emailController.text,
                              date: _dateController.text,
                              gender: _gender,
                            );
                        FocusScope.of(context.mounted ? context : context)
                            .unfocus();
                      }
                    },
                    containerColor: AppColors.blue25,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
