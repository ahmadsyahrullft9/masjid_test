import 'package:apptest/src/config/app_colors.dart';
import 'package:apptest/src/states/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    secondaryColor,
                    primaryColor,
                    primaryDarkColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              "assets/images/star_pattern.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/vector_masjid.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            left: 16,
            right: 16,
            child: SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {
                final maxWidth = constraints.maxWidth;
                final formWidth = maxWidth > 411 ? 411 : maxWidth;
                return SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        const SizedBox(height: 135),
                        Container(
                          width: formWidth.toDouble(),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                height: 140,
                                child: Center(
                                  child: _iconApp(),
                                ),
                              ),
                              _fieldIDJamaah(),
                              _fieldPassword(),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 16, 24, 8),
                                child: _btnLogin(),
                              ),
                              const Divider(color: Colors.white),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 8, 24, 16),
                                child: _btnDaftar(),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: _labelRegister(),
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                        const SizedBox(height: 135),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  _labelRegister() {
    return InkWell(
      onTap: () {
        //go to register page
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: "Anda belum memiliki akun ? ",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: "Daftar disini!",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  _btnDaftar() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size.fromHeight(42),
      ),
      onPressed: () {},
      child: const Text(
        "DAFTAR",
        style: TextStyle(
          fontSize: 14,
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _btnLogin() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size.fromHeight(42),
      ),
      onPressed: () => context.read<AuthBloc>().add(AuthEvent.login),
      child: const Text(
        "MASUK",
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _fieldPassword() {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      title: Row(
        children: [
          const Expanded(
            child: Text(
              "Password",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: primaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
                semanticLabel: "ingatkan saya",
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
              const Text(
                "Ingatkan saya",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
      subtitle: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: fieldBgColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          border: normalBorder,
          focusedBorder: focusBorder,
          errorBorder: errorBorder,
          hintText: "password",
          hintStyle: const TextStyle(
            fontSize: 14,
            color: secondaryTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  _fieldIDJamaah() {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      title: const Text(
        "ID Jamaah",
        style: TextStyle(
          fontSize: 14,
          color: primaryTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: fieldBgColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          border: normalBorder,
          focusedBorder: focusBorder,
          errorBorder: errorBorder,
          hintText: "id jamaah anda",
          hintStyle: const TextStyle(
            fontSize: 14,
            color: secondaryTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  _iconApp() {
    return SizedBox(
      width: 86,
      height: 86,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/vector_masjid.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final normalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide.none,
    gapPadding: 2,
  );

  final focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide.none,
    gapPadding: 2,
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide.none,
    gapPadding: 2,
  );
}
