// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:cbm_one_app/helpers/colors.dart';
import 'package:cbm_one_app/providers/value_notifier/value_notifier.dart';
import 'package:cbm_one_app/screens/screen_layouts/authentication_layout/authentication_layout.dart';
import 'package:cbm_one_app/utils/assest_image.dart';
import 'package:cbm_one_app/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class WizardLayout extends StatefulWidget {
  const WizardLayout(
    this.steps, {
    super.key,
    this.onPrimaryTap,
    this.onSecondaryTap,
    required this.children,
    required this.controller,
    this.onBackPress,
    this.stickySubSections = false,
    this.progressNotifier,
    this.showNavigationBar = true,
  });

  final int steps;
  final void Function(int page)? onPrimaryTap;
  final void Function(int page)? onSecondaryTap;

  final WizardLayoutController controller;
  final List<WizardItem> children;
  final void Function(int currentPage)? onBackPress;

  final bool stickySubSections;
  final GenericValueNotifier<bool>? progressNotifier;
  static const passwordScreenId = 2;
  final bool showNavigationBar;

  @override
  State<WizardLayout> createState() => _WizardLayoutState();
}

class _WizardLayoutState extends State<WizardLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WizardStreamBuilder(
            // stream: wizardPageStream,
            stream: widget.controller.wizardPageStream,
            children: widget.children,
            builder: (context, currentItem, currentPage) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanDown: (dragDetails) {
                  // grabFocus(context);
                },
                onTap: () {
                  grabFocus(context);
                },
                onTapDown: (tapDown) {
                  // grabFocus(context);
                },
                child: AuthenticationLayout(
                  backgroundColor: HexColor("#F7F8FC"),
                  onBackButtonTap: () {
                    if (widget.onBackPress != null) {
                      widget.onBackPress?.call(currentPage);
                    } else {
                      if (currentPage > 0) {
                        widget.controller.updateWizardPage(currentPage - 1);
                      }
                    }
                  },
                  isContainer1: true,
                  isContainer2: true,
                  isBodyLeadingIcon: true,
                  isBodyLeadingAvailable: true,
                  useImage: true,
                  imageName: ImageAsset().authBg,
                  isHeadingAvailable: true,
                  isSubHeadingAvailable: true,
                  headerText: currentItem.title,
                  headerSubText: currentItem.subtitle,
                  defaultButton: currentItem.defaulButton,
                  buttontitle: currentItem.buttonTitle,
                  onTap: () => widget.onPrimaryTap?.call(currentPage),
                  container2CustomWidget: Column(
                    children: [...currentItem.children],
                  ),
                ),
              );
            }),
        widget.progressNotifier != null
            ? ValueListenableBuilder(
                valueListenable: widget.progressNotifier!,
                builder: (context, visible, child) {
                  return Visibility(
                    visible: visible,
                    child: Container(
                      color: AppColors.primaryBlueColor.withOpacity(0.05),
                      child: const Center(
                          // child: Loader(),
                          ),
                    ),
                  );
                })
            : Container(),
      ],
    );
  }
}

class WizardItem {
  const WizardItem({
    this.title = "",
    this.subtitle = "",
    this.btnRaised = false,
    // this.twoButtonLayout = false,
    this.defaulButton = false,
    this.primaryBtnTitle = '',
    this.secondaryBtnTitle = '',
    this.children = const <Widget>[],
    this.thisProgress = 1,
    this.mainBtnReplacement,
    this.buttonTitle = "",
    this.infoText,
    this.infoTextMessage,
  });

  final String title;
  final String subtitle;
  final String buttonTitle;
  final String? infoText;
  final String? infoTextMessage;
  final double thisProgress;

  // Btn config
  final bool btnRaised;
  // final bool twoButtonLayout;
  final bool defaulButton;
  final String primaryBtnTitle;
  final String secondaryBtnTitle;
  final List<Widget> children;
  final Widget? mainBtnReplacement;
}

class WizardStreamBuilder extends StatelessWidget {
  const WizardStreamBuilder({
    super.key,
    this.stream,
    this.children = const <WizardItem>[],
    required this.builder,
  });

  final Stream<int>? stream;
  final List<WizardItem> children;
  final Widget Function(
      BuildContext context, WizardItem currentItem, int currentPage) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stream,
      initialData: 0,
      builder: (context, snapshot) {
        int currentPage = 0;
        if (snapshot.hasData) {
          currentPage = snapshot.data ?? 0;
        }
        if (children.isNotEmpty && (currentPage >= children.length)) {
          currentPage = children.length - 1;
        }
        WizardItem currentItem = children.elementAt(currentPage);
        return builder(context, currentItem, currentPage);
      },
    );
  }
}

class WizardLayoutController {
  final StreamController<int> _wizardPageController =
      StreamController<int>.broadcast();

  Stream<int> get wizardPageStream => _wizardPageController.stream;

  void updateWizardPage(int page) {
    _wizardPageController.add(page);
  }

  void dispose() {
    _wizardPageController.close();
  }
}
