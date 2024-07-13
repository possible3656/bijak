import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/magic_loader.dart';
import '../../../utils/widgets/nudge_bar.dart';
import '../controllers/home_controller.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_loaded_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NudgeBar(),
      appBar: const HomeAppBar(),
      body: Obx(
        () => controller.loading.value
            ? const Center(child: MagicLoader())
            : const HomeLoadedView(),
      ),
    );
  }
}
