import 'package:drevol/constants/colors.dart';
import 'package:drevol/provider/login_provider.dart';
import 'package:drevol/utils/responsive_sizes.dart';
import 'package:flutter/material.dart';
import 'package:drevol/config/size_config.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final isLargeScreen = SizeConfig.isLargeScreen;

    final Responsive responsiveSize = Responsive();
    final totalWidth = SizeConfig.screenWidth;
    final totalHeight = SizeConfig.screenHeight;

    double getWidthMobile(double pixels) {
      return responsiveSize.getResponsiveWidth(pixels, totalWidth, 414);
    }

    double getHeightMobile(double pixels) {
      return responsiveSize.getResponsiveHeight(pixels, totalHeight, 896);
    }

    double getWidthWeb(double pixels) {
      return responsiveSize.getResponsiveWidth(pixels, totalWidth, 1440);
    }

    double getHeightWeb(double pixels) {
      return responsiveSize.getResponsiveHeight(pixels, totalHeight, 900);
    }

    return Scaffold(
      body: SafeArea(
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, _) {
            return Container(
              margin: isLargeScreen
                  ? EdgeInsets.all(0)
                  : EdgeInsets.symmetric(horizontal: getWidthMobile(30)),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isLargeScreen
                            ? Expanded(
                                child: Container(
                                    color: Colors.grey[200],
                                    height: totalHeight,
                                    width: totalWidth),
                              )
                            : Container(),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: isLargeScreen
                                    ? getHeightWeb(60)
                                    : getHeightMobile(70),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        isLargeScreen ? getWidthWeb(60) : 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/images/logo.png",
                                        height: isLargeScreen
                                            ? getHeightWeb(40)
                                            : getHeightMobile(40),
                                        width: isLargeScreen
                                            ? getWidthWeb(106)
                                            : getWidthMobile(106),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Need help?",
                                        style: TextStyle(
                                          fontSize: isLargeScreen
                                              ? getHeightWeb(18)
                                              : getHeightMobile(18),
                                          color: AppColors.kPrimaryAppColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: isLargeScreen
                                    ? getHeightWeb(111)
                                    : getHeightMobile(95.53),
                              ),
                              Center(
                                child: Text(
                                  "Login Here",
                                  style: TextStyle(
                                    color: AppColors.kBtnColor,
                                    fontSize: isLargeScreen
                                        ? getHeightWeb(35)
                                        : getHeightMobile(30),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: isLargeScreen
                                    ? getHeightWeb(40)
                                    : getHeightMobile(35.5),
                              ),
                              Container(
                                margin: isLargeScreen
                                    ? EdgeInsets.only(
                                        left: getWidthWeb(166),
                                        right: getWidthWeb(154),
                                      )
                                    : EdgeInsets.all(0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Form(
                                      key: loginProvider.loginEmailFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: TextFormField(
                                        controller:
                                            loginProvider.emailController,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(
                                            top: isLargeScreen
                                                ? getHeightWeb(16.92)
                                                : getHeightMobile(15.02),
                                            bottom: isLargeScreen
                                                ? getHeightWeb(17.08)
                                                : getHeightMobile(14.79),
                                          ),
                                          prefixIcon: Container(
                                            margin:
                                                EdgeInsets.only(right: 18.72),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: Color(
                                                            0xFFE0E3E5)))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14.98,
                                                      vertical: 15.01),
                                              child: Image.asset(
                                                "assets/icons/ic_account_circle.png",
                                                height: isLargeScreen
                                                    ? getHeightWeb(25.43)
                                                    : getHeightMobile(22),
                                                width: isLargeScreen
                                                    ? getWidthWeb(25.43)
                                                    : getWidthMobile(22),
                                              ),
                                            ),
                                          ),
                                          hintText: "Username or Email",
                                          hintStyle: TextStyle(
                                            fontSize: isLargeScreen
                                                ? getHeightWeb(18)
                                                : getHeightMobile(16),
                                            color: AppColors.kPrimaryAppColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E5),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: AppColors.kBtnColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter email address!!";
                                          }
                                          if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return "Please enter valid email address!!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: isLargeScreen
                                          ? getHeightWeb(40)
                                          : getHeightMobile(35.5),
                                    ),
                                    Form(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      key: loginProvider.loginPasswordFormKey,
                                      child: TextFormField(
                                        controller:
                                            loginProvider.passwordController,
                                        obscureText:
                                            loginProvider.isMasked == true
                                                ? true
                                                : false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(
                                            top: isLargeScreen
                                                ? getHeightWeb(16.92)
                                                : getHeightMobile(15.02),
                                            bottom: isLargeScreen
                                                ? getHeightWeb(17.08)
                                                : getHeightMobile(14.79),
                                          ),
                                          prefixIcon: Container(
                                            margin:
                                                EdgeInsets.only(right: 18.72),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: Color(
                                                            0xFFE0E3E5)))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14.98,
                                                      vertical: 15.01),
                                              child: Image.asset(
                                                "assets/icons/ic_vpn_key.png",
                                                height: isLargeScreen
                                                    ? getHeightWeb(25.43)
                                                    : getHeightMobile(22),
                                                width: isLargeScreen
                                                    ? getWidthWeb(25.43)
                                                    : getWidthMobile(22),
                                              ),
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              loginProvider.changeMasking();
                                            },
                                            child: Container(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  right: isLargeScreen
                                                      ? getWidthWeb(21.57)
                                                      : getWidthMobile(17.37),
                                                  left: isLargeScreen
                                                      ? getWidthWeb(21.57)
                                                      : getWidthMobile(17.37),
                                                  top: isLargeScreen
                                                      ? getHeightWeb(19.56)
                                                      : getHeightMobile(17.01),
                                                  bottom: isLargeScreen
                                                      ? getHeightWeb(19.56)
                                                      : getHeightMobile(17.01),
                                                ),
                                                child: Image.asset(
                                                  "assets/icons/ic_eye.png",
                                                  height: isLargeScreen
                                                      ? getHeightWeb(15)
                                                      : getHeightMobile(14),
                                                  width: isLargeScreen
                                                      ? getWidthWeb(23)
                                                      : getWidthMobile(20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                            fontSize: isLargeScreen
                                                ? getHeightWeb(18)
                                                : getHeightMobile(16),
                                            color: AppColors.kPrimaryAppColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E5),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: AppColors.kBtnColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter password!!";
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: isLargeScreen
                                          ? getHeightWeb(40)
                                          : getHeightMobile(41.27),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 17,
                                          width: 17,
                                          child: Checkbox(
                                            value: loginProvider.checkboxValue,
                                            onChanged: (value) {
                                              loginProvider
                                                  .changeCheckBoxValue(value);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            activeColor: AppColors.kBtnColor,
                                            hoverColor: Colors.transparent,
                                            side: BorderSide(
                                              width: 1,
                                              color: AppColors.kPrimaryAppColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.85,
                                        ),
                                        Text(
                                          "Remember me",
                                          style: TextStyle(
                                              fontSize: isLargeScreen
                                                  ? getHeightWeb(18)
                                                  : getHeightMobile(16),
                                              color:
                                                  AppColors.kPrimaryAppColor),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            if (loginProvider.loginEmailFormKey
                                                        .currentState !=
                                                    null &&
                                                loginProvider
                                                        .loginPasswordFormKey
                                                        .currentState !=
                                                    null) {
                                              if (loginProvider
                                                      .loginEmailFormKey
                                                      .currentState!
                                                      .validate() &&
                                                  loginProvider
                                                      .loginPasswordFormKey
                                                      .currentState!
                                                      .validate()) {
                                                loginProvider.loginEmailFormKey
                                                    .currentState!
                                                    .save();
                                                loginProvider
                                                    .loginPasswordFormKey
                                                    .currentState!
                                                    .save();

                                                loginProvider.loginFun(
                                                  loginProvider
                                                      .emailController.text,
                                                  loginProvider
                                                      .passwordController.text,
                                                );
                                              }
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: isLargeScreen
                                                ? getHeightWeb(52)
                                                : getHeightMobile(46.15),
                                            width: isLargeScreen
                                                ? getWidthWeb(100)
                                                : getWidthMobile(88.5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: AppColors.kBtnColor,
                                            ),
                                            child: Text(
                                              "LOGIN",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: isLargeScreen
                                                    ? getHeightWeb(18)
                                                    : getHeightMobile(16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
