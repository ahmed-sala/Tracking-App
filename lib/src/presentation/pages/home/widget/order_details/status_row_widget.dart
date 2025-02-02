import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/spacing.dart';

class StatusRowWidget extends StatelessWidget {
  final String currentState; // Get current state
  final List<String> states; // List of possible states

  const StatusRowWidget({
    super.key,
    required this.currentState,
    required this.states,
  });

  @override
  Widget build(BuildContext context) {
    int currentIndex =
        states.indexOf(currentState); // Get index of current state

    return Row(
      children: List.generate(states.length, (index) {
        return Expanded(
          child: Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: index <= currentIndex
                  ? Colors.green
                  : Colors.grey, // Green for achieved, Grey for pending
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
      }).expand((widget) => [widget, horizontalSpace(16)]).toList()
        ..removeLast(), // Add spacing but remove the last one
    );
  }
}
