// ignore_for_file: prefer_expression_function_bodies, use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../router/route_paths.dart';
import '../../../../shared/custom_button_with_widget.dart';
import '../../../../theme/src/app_colors.dart';
import '../../../../theme/src/app_text_styles.dart';
import '../../../services/presentation/providers/service_controller.dart';
import '../providers/add_worker_provider.dart';

class AddWorkerServicesPage extends HookConsumerWidget {
  const AddWorkerServicesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceNotifier = ref.watch(serviceControllerProvider);
    final workerProvider = ref.read(addWorkerProvider);
    // final controller = useTextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text("${workerProvider.name}'s Services", style: AppTextStyles.h1),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomButtonWithWidget(
              widget: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.design_services,
                  size: 50,
                ),
                Text(
                  'Tap here to ADD new\n${workerProvider.name} service',
                  style: AppTextStyles.p6,
                  textAlign: TextAlign.center,
                ),
              ]),
              onPressed: () {
                GoRouter.of(context).goNamed(
                  RoutePaths.addService,
                );
              },
              buttonColor: const Color.fromARGB(88, 209, 216, 210),
              isExpanded: true,
            ),
          ),
          Text("${workerProvider.name}'s services", style: AppTextStyles.h3),
          const Divider(),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Center(
                child: serviceNotifier.when(
                  data: (services) => services.isEmpty
                      ? Column(
                          children: [
                            const Icon(
                              Icons.error,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'There is no services added, add first one.',
                              style: AppTextStyles.p6,
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            final service = services[index];
                            return Dismissible(
                              key: Key(service.id),
                              onDismissed: (_) {
                                ref.read(serviceControllerProvider.notifier).deleteService(
                                      service.id,
                                    );
                              },
                              background: Container(
                                alignment: Alignment.centerRight,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                                child: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(Icons.delete),
                                ),
                              ),
                              child: Card(
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
                                              imageUrl: service.serviceImage,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            service.title,
                                            style: AppTextStyles.p1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
