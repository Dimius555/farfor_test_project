import 'dart:async';

import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:flutter/material.dart';

// class CountdownWidget extends StatefulWidget {
//   final DateTime startTime;
//   final void Function()? onTimeout;

//   const CountdownWidget({Key? key, required this.startTime, this.onTimeout}) : super(key: key);

//   @override
//   _CountdownWidgetState createState() => _CountdownWidgetState();
// }

// class _CountdownWidgetState extends State<CountdownWidget> {
//   late Timer _timer;
//   int _secondsRemaining = 0;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     DateTime now = DateTime.now();
//     Duration difference = widget.startTime.difference(now);
//     int seconds = difference.inSeconds;
//     if (seconds > 10 * 60) {
//       if (widget.onTimeout != null) {
//         widget.onTimeout!();
//       }
//       return;
//     }

//     setState(() {
//       _secondsRemaining = seconds;
//     });

//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _secondsRemaining--;
//       });

//       if (_secondsRemaining <= 0) {
//         _timer.cancel();
//         if (widget.onTimeout != null) {
//           widget.onTimeout!();
//         }
//       }
//     });
//   }

//   String _getDurationString(int durationSeconds) {
//     int minutes = durationSeconds ~/ 60;
//     int seconds = durationSeconds % 60;
//     return '$minutes:${seconds.toString().padLeft(2, '0')}';
//   }

// }

import 'package:flutter/material.dart';
import 'dart:async';

class CountdownWidget extends StatefulWidget {
  final DateTime targetDateTime;

  const CountdownWidget({super.key, required this.targetDateTime});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _timer;
  Duration _duration = const Duration();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    final duration = widget.targetDateTime.difference(DateTime.now());
    _duration = duration.isNegative ? const Duration() : duration;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds == 0) {
          _timer.cancel();
        } else {
          _duration = _duration - const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Stack(alignment: Alignment.topRight, children: [
      Image.asset('assets/images/promo_image.png'),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 67,
          height: 28,
          decoration: BoxDecoration(
            color: theme.primaryBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(14.0),
            ),
          ),
          child: Center(
            child: Text(
              '${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
              style: theme.headline3,
            ),
          ),
        ),
      )
    ]);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
