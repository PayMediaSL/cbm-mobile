// import 'dart:async';


// import 'package:app/helpers/colors.dart';
// import 'package:app/services/screen_size_calculator.dart';
// import 'package:app/utils/log_util.dart';
// import 'package:app/utils/navigation_util.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sticky_headers/sticky_headers/widget.dart';

// class WizardLayout extends StatefulWidget {
//   const WizardLayout(
//     this.steps, {
//     super.key,
//     this.onPrimaryTap,
//     this.onSecondaryTap,
//     required this.children,
//     required this.controller,
//     this.onBackPress,
//     this.stickySubSections = false,
//     // this.progressNotifier,
//     this.showNavigationBar = true,
//   });

//   final int steps;

//   // Btn config
//   final void Function(int page)? onPrimaryTap;
//   final void Function(int page)? onSecondaryTap;

//   final WizardLayoutController controller;

//   final List<WizardItem> children;
//   final void Function(int currentPage)? onBackPress;

//   final bool stickySubSections;
//   // final GenericValueNotifier<bool>? progressNotifier;
//   static const passwordScreenId = 2;
//   final bool showNavigationBar;

//   @override
//   State<WizardLayout> createState() => _WizardLayoutState();
// }

// class _WizardLayoutState extends State<WizardLayout> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         WizardStreamBuilder(
//             // stream: wizardPageStream,
//             stream: widget.controller.wizardPageStream,
//             children: widget.children,
//             builder: (context, currentItem, currentPage) {
//               final double footerHeight =
//                   currentItem.twoButtonLayout || currentItem.btnRaised
//                       ? 150
//                       : 70;
//               return WillPopScope(
//                 onWillPop: () {
//                   if (widget.onBackPress != null) {
//                     widget.onBackPress?.call(currentPage);
//                     return Future.value(false);
//                   } else {
//                     if (currentPage > 0) {
//                       widget.controller.updateWizardPage(currentPage - 1);
//                       return Future.value(false);
//                     } else {
//                       return Future.value(true);
//                     }
//                   }
//                 },
//                 child: GestureDetector(
//                   behavior: HitTestBehavior.translucent,
//                   onPanDown: (dragDetails) {
//                     // grabFocus(context);
//                   },
//                   onTap: () {
//                     grabFocus(context);
//                   },
//                   onTapDown: (tapDown) {
//                     // grabFocus(context);
//                   },
//                   child: Scaffold(
//                     backgroundColor: AppColors.white,
//                     resizeToAvoidBottomInset: true,
//                     appBar: _getWizardPageHeader(currentPage),
//                     body: SingleChildScrollView(
//                       primary: false,
//                       child: Column(
//                         children: [
//                           Container(
//                             width: double.maxFinite,
//                             color: AppColors.transparent,
//                             // height: content height = total screen height - (Vertical padding + app bar height + footer height)
//                             height: ScreenUtils.height -
//                                 (ScreenUtils.safeArea +
//                                     AppBar().preferredSize.height +
//                                     footerHeight),
//                             child: SingleChildScrollView(
//                               physics: const BouncingScrollPhysics(),
//                               primary: true,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(height: UI.PADDING),
//                                   const Text("One App"),
//                                   const SizedBox(height: UI.PADDING_2X),
//                                   _getBodyWithStickyHeader(),
//                                   ...(widget.stickySubSections
//                                       ? currentItem.children
//                                       : [])
//                                 ],
//                               ),
//                             ),
//                           ),
//                           _getFooter(footerHeight),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//         widget.progressNotifier != null
//             ? ValueListenableBuilder(
//                 valueListenable: widget.progressNotifier!,
//                 builder: (context, visible, child) {
//                   return Visibility(
//                     visible: visible,
//                     child: Container(
//                       color: AppColors.primaryBlue.withOpacity(0.05),
//                       child: const Center(
//                         child: Loader(),
//                       ),
//                     ),
//                   );
//                 })
//             : Container(),
//       ],
//     );
//   }

//   Widget _getFooter(double footerHeight) {
//     return WizardStreamBuilder(
//         stream: widget.controller.wizardPageStream,
//         children: widget.children,
//         builder: (context, currentItem, currentPage) {
//           return Container(
//             color: AppColors.transparent,
//             height: footerHeight,
//             child: Align(
//               alignment: currentItem.btnRaised
//                   ? Alignment.topCenter
//                   : Alignment.center,
//               child: FittedBox(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Visibility(
//                       visible: currentItem.btnRaised,
//                       child: const SizedBox(height: UI.PADDING),
//                     ),
//                     Visibility(
//                       visible: currentItem.twoButtonLayout,
//                       child: MainButton(
//                         isMainButton: false,
//                         buttontitle: currentItem.secondaryBtnTitle,
//                         btnOnPress: () =>
//                             widget.onSecondaryTap?.call(currentPage),
//                       ),
//                     ),
//                     Visibility(
//                       visible: currentItem.mainBtnReplacement != null,
//                       replacement: Column(
//                         children: [
//                           const SizedBox(height: UI.PADDING_2X),
//                           MainButton(
//                             isMainButton: true,
//                             buttontitle: currentItem.primaryBtnTitle,
//                             btnOnPress: () =>
//                                 widget.onPrimaryTap?.call(currentPage),
//                           ),
//                         ],
//                       ),
//                       child: currentItem.mainBtnReplacement ?? Container(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   Widget _getBodyWithStickyHeader() {
//     return WizardStreamBuilder(
//       stream: widget.controller.wizardPageStream,
//       children: widget.children,
//       builder: (context, currentItem, currentPage) {
//         return StickyHeader(
//           callback: (stuckAmount) {
//             printLog(stuckAmount);
//           },
//           header: Container(
//             color: AppColors.white,
//             padding:  EdgeInsets.symmetric(horizontal: UI.PADDING_2X),
//             alignment: Alignment.centerLeft,
//             child: Column(
//               children: [
//                 Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         currentItem.title ?? '',
//                         style: TextStyles.secondaryHeadingTextStyle,
//                         softWrap: true,
//                       ),
//                       Visibility(
//                         visible: currentItem.title != null,
//                         child: SizedBox(
//                           height: 20.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Visibility(
//                   visible: currentItem.infoText != null &&
//                       currentItem.infoTextMessage != null,
//                   child: InkWell(
//                     onTap: () {
//                       AlertUtil(context).showToast(
//                         alertType: AlertType.INFO,
//                         message: currentItem.infoTextMessage ?? '',
//                         bottom: 500,
//                         seconds: 7,
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           ImageAsset().infoIcon,
//                           width: ScreenUtils.width * 0.04,
//                         ),
//                         SizedBox(
//                           width: ScreenUtils.width * 0.015,
//                         ),
//                         Text(
//                           currentItem.infoText ?? '',
//                           style: TextStyles.secondaryHeadingTextStyle.copyWith(
//                             fontSize: 14.sp,
//                             color: AppColors.primaryBlue,
//                             decoration: TextDecoration.underline,
//                           ),
//                           softWrap: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: currentItem.infoText != null,
//                   child: SizedBox(
//                     height: 23.h,
//                   ),
//                 ),
//                 Visibility(
//                   visible: currentItem.detailText != null,
//                   child: Row(
//                     children: [
//                       Text(
//                         currentItem.detailText ?? '',
//                         style: TextStyles.secondaryHeadingTextStyle
//                             .copyWith(fontSize: 17.sp),
//                         softWrap: true,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Row(),
//               Visibility(
//                 visible: currentItem.title != null,
//                 child: SizedBox(
//                   height: 10.h,
//                 ),
//               ),
//               Visibility(
//                 visible: currentItem.subtitle != null,
//                 child: SizedBox(
//                   width: ScreenUtils.width - UI.PADDING_4X,
//                   child: Text(
//                     currentItem.subtitle ?? '',
//                     style: TextStyles.regularGreyTextStyle14pt
//                         .copyWith(color: AppColors.subtitleColor),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Visibility(
//                   visible: currentItem.subtitle != null,
//                   child: SizedBox(height: widget.stickySubSections ? 0 : 20.h)),
//               // ...List.generate(100, (index) => TextFormField()),
//               ...(widget.stickySubSections ? [] : currentItem.children),
//               SizedBox(height: widget.stickySubSections ? 0 : UI.PADDING_2X),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   PreferredSizeWidget _getWizardPageHeader(int currentPage) {
//     const otpScreen = 1;
//     const passwordScreenId = 2;
//     return AppBar(
//       elevation: 0,
//       backgroundColor: AppColors.white,
//       leading: currentPage == passwordScreenId || currentPage == otpScreen
//           ? Container()
//           : IconButton(
//               icon: const Icon(Icons.chevron_left),
//               onPressed: () {
//                 if (widget.onBackPress != null) {
//                   widget.onBackPress?.call(currentPage);
//                 } else {
//                   if (currentPage > 0) {
//                     widget.controller.updateWizardPage(currentPage - 1);
//                   } else {
//                     popScreen(context);
//                   }
//                 }
//               },
//             ),
//       actions: const [
//         // Added as a placeholder to center the indicator
//         IconButton(
//           icon: Icon(
//             Icons.chevron_left,
//             color: AppColors.transparent,
//           ),
//           onPressed: null,
//         )
//       ],
//       title: widget.showNavigationBar
//           ? WizardStreamBuilder(
//               stream: widget.controller.wizardPageStream,
//               children: widget.children,
//               builder: (context, currentItem, currentPage) {
//                 return WizardStepIndicator(
//                   steps: widget.steps,
//                   currentStep: currentItem.thisProgress,
//                 );
//               },
//             )
//           : null,
//     );
//   }
// }

// class WizardItem {
//   const WizardItem({
//     this.title,
//     this.subtitle,
//     this.btnRaised = false,
//     this.twoButtonLayout = false,
//     this.primaryBtnTitle = '',
//     this.secondaryBtnTitle = '',
//     this.children = const <Widget>[],
//     this.thisProgress = 1,
//     this.mainBtnReplacement,
//     this.detailText,
//     this.infoText,
//     this.infoTextMessage,
//   });

//   final String? title;
//   final String? subtitle;
//   final String? detailText;
//   final String? infoText;
//   final String? infoTextMessage;
//   final double thisProgress;

//   // Btn config
//   final bool btnRaised;
//   final bool twoButtonLayout;
//   final String primaryBtnTitle;
//   final String secondaryBtnTitle;

//   final List<Widget> children;

//   final Widget? mainBtnReplacement;
// }

// class WizardStreamBuilder extends StatelessWidget {
//   const WizardStreamBuilder({
//     super.key,
//     this.stream,
//     this.children = const <WizardItem>[],
//     required this.builder,
//   });

//   final Stream<int>? stream;
//   final List<WizardItem> children;
//   final Widget Function(
//       BuildContext context, WizardItem currentItem, int currentPage) builder;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<int>(
//       stream: stream,
//       initialData: 0,
//       builder: (context, snapshot) {
//         int currentPage = 0;
//         if (snapshot.hasData) {
//           currentPage = snapshot.data ?? 0;
//         }

//         if (children.isNotEmpty && (currentPage >= children.length)) {
//           currentPage = children.length - 1;
//         }

//         WizardItem currentItem = children.elementAt(currentPage);
//         return builder(context, currentItem, currentPage);
//       },
//     );
//   }
// }

// class WizardStepIndicator extends StatelessWidget {
//   const WizardStepIndicator({
//     super.key,
//     this.steps = 1,
//     this.currentStep = 0,
//   });

//   final int steps;
//   final double currentStep;

//   @override
//   Widget build(BuildContext context) {
//     final double itemWidth = (ScreenUtils.width * 0.55) * 0.25;
//     String stepString = currentStep.toStringAsFixed(2);
//     int completeSteps = int.tryParse(stepString.split('.')[0]) ?? 0;
//     int substepPercentage = int.tryParse(stepString.split('.')[1]) ?? 0;
//     double subItemWidth = (itemWidth / 100) * substepPercentage;
//     return Center(
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: List.generate(
//           steps,
//           (index) => Container(
//             clipBehavior: Clip.antiAlias,
//             margin:  EdgeInsets.symmetric(horizontal: UI.PADDING * 0.3),
//             height: UI.PADDING * 0.6,
//             width: itemWidth,
//             decoration: BoxDecoration(
//               color: AppColors.liteBlue.withOpacity(0.5),
//               borderRadius: BorderRadius.circular(UI.BORDER_RADIUS),
//             ),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: AnimatedContainer(
//                 duration: const Duration(microseconds: 250),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryBlue,
//                   borderRadius: BorderRadius.circular(UI.BORDER_RADIUS),
//                 ),
//                 width: completeSteps >= (index + 1)
//                     ? itemWidth
//                     : (completeSteps == index ? subItemWidth : 0),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WizardLayoutController {
//   final StreamController<int> _wizardPageController =
//       StreamController<int>.broadcast();

//   Stream<int> get wizardPageStream => _wizardPageController.stream;

//   void updateWizardPage(int page) {
//     _wizardPageController.add(page);
//   }

//   void dispose() {
//     _wizardPageController.close();
//   }
// }
