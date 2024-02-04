import 'package:flutter/material.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/input_form_custom.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/auth_local_datasource.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({super.key});

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: SvgPicture.asset(
                              Assets.icons.arrowLeft.path,
                              colorFilter: const ColorFilter.mode(
                                colorBlack,
                                BlendMode.srcIn,
                              ),
                              height: 24,
                              width: 24,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Address book',
                                style: body1semi,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Save',
                              style: body1semi,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 56,
                            width: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://picsum.photos/200/300',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 7.5),
                            child: Center(
                              child: Text(
                                'Change photo',
                                style: body2semi,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            InputFormCustom(
                              controller: fullNameC,
                              isPassword: false,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              title: "Full name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            InputFormCustom(
                              controller: phoneNumberC,
                              isPassword: false,
                              keyboardType: TextInputType.phone,
                              obscureText: false,
                              title: "Phone",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            InputFormCustom(
                              controller: emailC,
                              isPassword: false,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              title: "Email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            // const SizedBox(
                            //   height: 16,
                            // ),
                            // InputFormCustom(
                            //   onTap: () async {
                            //     DateTime? pickedDate = await showDatePicker(
                            //       context: context,
                            //       initialDate: DateTime.now(),
                            //       firstDate: DateTime(1950),
                            //       lastDate: DateTime(2100),
                            //     );
                            //     if (pickedDate != null) {
                            //       String formattedDate =
                            //           DateFormat('yMMMMd').format(pickedDate);
                            //       setState(
                            //         () {
                            //           dateOfBirthC.text =
                            //               formattedDate; //set output date to TextField value.
                            //         },
                            //       );
                            //     } else {}
                            //   },
                            //   readOnly: true,
                            //   controller: dateOfBirthC,
                            //   isPassword: false,
                            //   keyboardType: TextInputType.datetime,
                            //   obscureText: false,
                            //   title: "Date of birth",
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Please enter some text';
                            //     }
                            //     return null;
                            //   },
                            // ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
