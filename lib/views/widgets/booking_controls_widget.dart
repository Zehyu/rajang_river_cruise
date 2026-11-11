
import 'package:flutter/material.dart';

class BookingControlsWidget extends StatelessWidget {
  final DateTime? visitDate;
  final String selectedPackage;
  final List<String> packages;
  final bool isDarkMode;

  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<String> onPackageChanged;
  final ValueChanged<bool> onDarkModeChanged;

  const BookingControlsWidget({
    super.key,
    required this.visitDate,
    required this.selectedPackage,
    required this.packages,
    required this.isDarkMode,
    required this.onDateSelected,
    required this.onPackageChanged,
    required this.onDarkModeChanged,
  });

  // Format Selected Date
  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Select a date';
    }

    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;

    return '$day/$month/$year';
  }

  // Open Date Picker
  Future<void> _pickDate(BuildContext context) async {
    final today = DateTime.now();

    final firstDate = DateTime(
      today.year,
      today.month,
      today.day,
    );

    final initialDate =
    visitDate != null && !visitDate!.isBefore(firstDate)
        ? visitDate!
        : firstDate;

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime(today.year + 5, 12, 31),
      helpText: 'Select Cruise Date',
    );

    if (selectedDate != null) {
      onDateSelected(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Section Title
            Text(
              'Trip Preferences',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Visit Date Picker
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.calendar_today,
              ),
              title: const Text('Visit Date'),
              subtitle: Text(
                _formatDate(visitDate),
              ),
              trailing: const Icon(
                Icons.chevron_right,
              ),
              onTap: () => _pickDate(context),
            ),

            const Divider(),

            // Cruise Package Dropdown
            Row(
              children: [
                const Icon(Icons.directions_boat),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Cruise Package'),

                      DropdownButton<String>(
                        value: selectedPackage,
                        isExpanded: true,
                        items: packages.map((package) {
                          return DropdownMenuItem<String>(
                            value: package,
                            child: Text(
                              package,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            onPackageChanged(value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(),

            // Dark Mode Switch
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(
                Icons.dark_mode,
              ),
              title: const Text('Dark Mode'),
              value: isDarkMode,
              onChanged: onDarkModeChanged,
            ),
          ],
        ),
      ),
    );
  }
}
