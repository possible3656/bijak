import 'package:bijak/app/modules/home/views/widgets/home_app_bar.dart';
import 'package:bijak/app/modules/home/views/widgets/home_loaded_view.dart';
import 'package:bijak/app/utils/widgets/magic_loader.dart';
import 'package:bijak/app/utils/widgets/nudge_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const NudgeBar(),
        appBar: const HomeAppBar(),
        body: Obx(() => controller.loading.value
            ? const Center(child: MagicLoader())
            : const HomeLoadedView()));
  }
}
