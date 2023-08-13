import 'dart:math';

import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final bool initialIsPlaying;
  final Icon playIcon;
  final Icon pauseIcon;
  final VoidCallback onPressed;

  PlayButton({
    required this.onPressed,
    this.initialIsPlaying = false,
    this.playIcon = const Icon(Icons.mic),
    this.pauseIcon = const Icon(Icons.mic),
  }) : assert(onPressed != null);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with TickerProviderStateMixin {
  static const _kToggleDuration = Duration(milliseconds: 300);
  static const _kRotationDuration = Duration(seconds: 5);

  late bool isPlaying;

  // rotation and scale animations
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  double _rotation = 0;
  double _scale = 0.85;

  bool get _showWaves => !_scaleController.isDismissed;

  void _updateRotation() => _rotation = _rotationController.value * 2 * pi;
  void _updateScale() => _scale = (_scaleController.value * 0.2) + 0.85;

  @override
  void initState() {
    isPlaying = widget.initialIsPlaying;
    _rotationController =
        AnimationController(vsync: this, duration: _kRotationDuration)
          ..addListener(() => setState(_updateRotation))
          ..repeat();

    _scaleController =
        AnimationController(vsync: this, duration: _kToggleDuration)
          ..addListener(() => setState(_updateScale));

    super.initState();
  }

  void _onToggle() {
    setState(() => isPlaying = !isPlaying);

    if (_scaleController.isCompleted) {
      _scaleController.reverse();
    } else {
      _scaleController.forward();
    }

    widget.onPressed();
  }

  Widget _buildIcon(bool isPlaying) {
    return SizedBox.expand(
      key: ValueKey<bool>(isPlaying),
      child: IconButton(
        icon: isPlaying ? widget.pauseIcon : widget.playIcon,
        onPressed: _onToggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 90, minHeight: 90),
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (_showWaves) ...[
              // Padding(
              //   padding: const EdgeInsets.only(top: 30.0),
              //   child: Align(
              //     alignment: AlignmentDirectional.topCenter,
              //     child: Text(
              //       "Recording...",
              //       style: TextStyle(color: Colors.grey[850], fontSize: 50),
              //     ),
              //   ),
              // ),
              Blob(
                  color: Color(0xff0092ff), scale: _scale, rotation: _rotation),
              Blob(
                  color: Color(0xff4ac7b7),
                  scale: _scale,
                  rotation: _rotation * 2 - 30),
              Blob(
                  color: Color(0xffa4a6f6),
                  scale: _scale,
                  rotation: _rotation * 3 - 45),
            ],

            /// show text conditionally
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Align(
                alignment: AlignmentDirectional.topCenter,
                child: Text(
                  _showWaves ? "Recording..." : "Tap to start recording",
                  style: TextStyle(color: Colors.grey[850], fontSize: 35),
                ),
              ),
            ),
            //Align 's default alignment is center
            Align(
              child: Container(
                // constraints: BoxConstraints.expand(),
                height: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: AnimatedSwitcher(
                  duration: _kToggleDuration,
                  child: _buildIcon(isPlaying),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}

class Blob extends StatelessWidget {
  final double rotation;
  final double scale;
  final Color color;

  const Blob({required this.color, this.rotation = 0, this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          height: 270,
          width: 270,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(150),
              topRight: Radius.circular(240),
              bottomLeft: Radius.circular(220),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
