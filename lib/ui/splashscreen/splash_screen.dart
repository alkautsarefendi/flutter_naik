import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nh_korindo_mts/ui/splashscreen/ring_animator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/m_mts_bg_intro.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: RingAnimator(
                size: 120,
                ringIcons: const [],
                ringIconsSize: 3,
                ringIconsColor: Colors.white70,
                ringAnimation: Curves.linear,
                ringColor: Color(0xff286cb4),
                reverse: false,
                ringAnimationInSeconds: 10,
                child: Container(
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/app_logo.png',
                        height: 65.0,
                      ),
                      radius: 45.0,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: AvatarGlow(
                glowColor: Color(0xff286cb4),
                endRadius: 200.0,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/app_logo.png',
                      height: 65,
                    ),
                    radius: 45.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 100.0,
              right: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/m_mts_img_bi_login_winpro.png',
                  width: 250.0,
                  height: 50.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 270.0, // Posisi diubah menjadi bagian bawah
              left: 0, // Tetap pada batas kiri
              right: 0, // Tetap pada batas kanan
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding horizontal untuk ruang tambahan di sisi kanan dan kiri
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 40, // Lebar mengikuti lebar layar
                  animation: true,
                  lineHeight: 7.0,
                  animationDuration: 5000,
                  percent: 1, // Sesuaikan dengan kemajuan unduhan aktual
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.amber,
                ),
              ),
            ),
            Positioned(
              bottom: 250.0, // Posisi diubah menjadi bagian bawah
              left: 160, // Tetap pada batas kiri
              right: 100, // Tetap pada batas kanan
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0), // Padding horizontal untuk ruang tambahan di sisi kanan dan kiri
                child: Text(
                  "Downloading file...",
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}