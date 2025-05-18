import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/src/rust/app.dart';
import 'package:ui/widgets/square_icon_button.dart';

class BPMSelector extends StatefulWidget {
  final RustState rustState;

  const BPMSelector({super.key, required this.rustState});

  @override
  State<BPMSelector> createState() => _BPMSelectorState();
}

class _BPMSelectorState extends State<BPMSelector> {
  late int _currentBPM;
  final TextEditingController _bpmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentBPM = widget.rustState.bpm;
    _bpmController.text = _currentBPM.toStringAsFixed(0);
  }

  void _updateBPMFromTextField() {
    if (_bpmController.text.isNotEmpty) {
      final parsedValue = int.tryParse(_bpmController.text);
      if (parsedValue != null && parsedValue >= 40 && parsedValue <= 220) {
        setState(() {
          _currentBPM = parsedValue;
          // Update controller only if different to avoid cursor jumps during valid input
          if (_bpmController.text != _currentBPM.toStringAsFixed(0)) {
            _bpmController.text = _currentBPM.toStringAsFixed(0);
            _bpmController.selection = TextSelection.fromPosition(
              // Move cursor to end
              TextPosition(offset: _bpmController.text.length),
            );
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a BPM value between 40 and 220.'),
            duration: Duration(seconds: 2),
          ),
        );
        _bpmController.text = _currentBPM.toStringAsFixed(0);
        _bpmController.selection = TextSelection.fromPosition(
          TextPosition(offset: _bpmController.text.length),
        );
      }
    } else {
      // If field is cleared, revert to currentBPM
      _bpmController.text = _currentBPM.toStringAsFixed(0);
      _bpmController.selection = TextSelection.fromPosition(
        TextPosition(offset: _bpmController.text.length),
      );
    }
  }

  void _incrementBPM() {
    setState(() {
      if (_currentBPM < 220) {
        _currentBPM++;
        _bpmController.text = _currentBPM.toStringAsFixed(0);
        _bpmController.selection = TextSelection.fromPosition(
          // Keep cursor at end
          TextPosition(offset: _bpmController.text.length),
        );
      }
    });
  }

  void _decrementBPM() {
    setState(() {
      if (_currentBPM > 40) {
        _currentBPM--;
        _bpmController.text = _currentBPM.toStringAsFixed(0);
        _bpmController.selection = TextSelection.fromPosition(
          // Keep cursor at end
          TextPosition(offset: _bpmController.text.length),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define a common button style for consistency
    final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      padding: EdgeInsets.zero, // Remove default padding to center icon better
      side: BorderSide(
        color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
      ), // Border color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners
      ),
      splashFactory: InkRipple.splashFactory,
    );

    return AspectRatio(
      aspectRatio: 6 / 1,
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Make Row children stretch vertically
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: _bpmController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only digits
                LengthLimitingTextInputFormatter(3), // Limit to 3 digits
              ],
              textAlign: TextAlign.center, // Center the input text horizontally
              textAlignVertical:
                  TextAlignVertical.center, // Center the input text vertically
              expands: true, // Allows the TextField to expand vertically
              minLines: null, // Required for expands to work
              maxLines: null, // Required for expands to work
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ), // Style for the input text
              decoration: InputDecoration(
                labelText: 'BPM',
                labelStyle: TextStyle(color: Theme.of(context).hintColor),
                floatingLabelBehavior:
                    FloatingLabelBehavior.auto, // Standard behavior for label
                floatingLabelAlignment:
                    FloatingLabelAlignment
                        .center, // Center label when it floats
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                counterText: '', // Hide the character counter
                //isDense: true, // Can make it more compact if needed
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ), // Adjust padding as needed
              ),
              onSubmitted: (_) => _updateBPMFromTextField(),
              onEditingComplete:
                  _updateBPMFromTextField, // Also updates when focus is lost or done is pressed
            ),
          ),

          Expanded(
            child: SquareIcon(
              icons: [Icons.add],
              onPressed: _incrementBPM,
              buttonStyle: buttonStyle,
            ),
          ),
          Expanded(
            child: SquareIcon(
              icons: [Icons.remove],
              onPressed: _decrementBPM,
              buttonStyle: buttonStyle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bpmController.dispose();
    super.dispose();
  }
}
