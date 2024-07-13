import 'package:bijak/app/modules/home/controllers/home_controller.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NudgeBar extends StatelessWidget {
  const NudgeBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(() => controller.cartItems.value.isNotEmpty
        ? SafeArea(
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${controller.getItemCount().toString()} Item(s)',
                      style: TextStyles.black14Bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '₹ ${controller.getTotalPrice().toString()}',
                      textAlign: TextAlign.end,
                      style: TextStyles.black14Bold,
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox.shrink());
  }
}