// ignore_for_file: prefer_expression_function_bodies

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../router/route_paths.dart';
import '../../../../shared/custom_button_with_widget.dart';
import '../../../../theme/src/app_colors.dart';
import '../../../../theme/src/app_text_styles.dart';
import '../providers/workers_controller.dart';

class WorkersListPage extends HookConsumerWidget {
  const WorkersListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workersNotifier = ref.watch(workersControllerProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text('Workers', style: AppTextStyles.h1),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomButtonWithWidget(
              widget: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.person,
                  size: 50,
                ),
                Text(
                  'Tap here to ADD new Worker',
                  style: AppTextStyles.p6,
                ),
              ]),
              onPressed: () {
                GoRouter.of(context).goNamed(
                  RoutePaths.addWorker,
                );
              },
              buttonColor: const Color.fromARGB(88, 209, 216, 210),
              isExpanded: true,
            ),
          ),
          Text('Your Workers', style: AppTextStyles.h3),
          const Divider(),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Center(
                child: workersNotifier.when(
                  data: (workers) => workers.isEmpty
                      ? Column(
                          children: [
                            const Icon(
                              Icons.error,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'There is no workers added, add first one.',
                              style: AppTextStyles.p6,
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: workers.length,
                          itemBuilder: (context, index) {
                            final worker = workers[index];
                            return Card(
                              color: const Color.fromARGB(88, 209, 216, 210),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: worker.profileImage,
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              worker.name,
                                              style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              worker.title,
                                              style: AppTextStyles.p3.copyWith(fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.secondary),
                    ),
                  ),
                  error: (e, __) => Text(
                    e.toString(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
