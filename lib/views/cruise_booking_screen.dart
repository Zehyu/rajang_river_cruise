
import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';

import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatefulWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<CruiseBookingScreen> createState() =>
      _CruiseBookingScreenState();
}

class _CruiseBookingScreenState
    extends State<CruiseBookingScreen> {

  // Action Button Message
  void _showActionMessage(String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action button pressed'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Title Section
  Widget _buildTitle(CruiseBookingViewModel vm) {
    return TitleSectionWidget(
      title: vm.destination.name,
      location: vm.destination.location,
      starCount: vm.starCount,
      isRated: vm.hasRated,
      onStarTap: vm.toggleRating,
    );
  }

  // Action Bar
  Widget _buildActions() {
    return ActionBarWidget(
      onCall: () => _showActionMessage('CALL'),
      onRoute: () => _showActionMessage('ROUTE'),
      onShare: () => _showActionMessage('SHARE'),
    );
  }

  // Interactive Booking Controls
  Widget _buildPreferences(CruiseBookingViewModel vm) {
    return BookingControlsWidget(
      visitDate: vm.visitDate,
      selectedPackage: vm.selectedPackage,
      packages: vm.destination.packages,
      isDarkMode: vm.isDarkMode,
      onDateSelected: vm.setVisitDate,
      onPackageChanged: vm.setPackage,
      onDarkModeChanged: vm.setDarkMode,
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rajang River Cruise & Heritage',
        ),
        centerTitle: false,
      ),

      body: ListenableBuilder(
        listenable: vm,
        builder: (context, child) {

          return OrientationBuilder(
            builder: (context, orientation) {

              // ==================================
              // FIGURE 1: PORTRAIT LAYOUT
              // ==================================
              if (orientation == Orientation.portrait) {
                return ListView(
                  children: [

                    // 1. Header Image
                    HeaderImageWidget(
                      imagePath: vm.destination.imagePath,
                      height: 230,
                    ),

                    // 2. Title Section
                    _buildTitle(vm),

                    // 3. Action Bar
                    _buildActions(),

                    // 4. Description Paragraph
                    DescriptionWidget(
                      description:
                      vm.destination.description,
                    ),

                    // 5. Interactive Controls
                    _buildPreferences(vm),

                    const SizedBox(height: 20),
                  ],
                );
              }

              // ==================================
              // FIGURE 2: LANDSCAPE LAYOUT
              // ==================================
              else {
                return Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.stretch,
                  children: [

                    // LEFT PANE: HEADER IMAGE ONLY
                    Expanded(
                      flex: 1,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return HeaderImageWidget(
                            imagePath:
                            vm.destination.imagePath,
                            height: constraints.maxHeight,
                          );
                        },
                      ),
                    ),

                    const VerticalDivider(width: 1),

                    // RIGHT PANE: ALL DETAILS
                    Expanded(
                      flex: 1,
                      child: ListView(
                        children: [

                          // 1. Title Section
                          _buildTitle(vm),

                          // 2. Action Bar
                          _buildActions(),

                          // 3. Description Paragraph
                          DescriptionWidget(
                            description:
                            vm.destination.description,
                          ),

                          // 4. Interactive Controls
                          _buildPreferences(vm),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}
