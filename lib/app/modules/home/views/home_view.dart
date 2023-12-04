// ignore_for_file: use_super_parameters

import 'package:bismillah/app/utils/appwrite_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView.separated(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 10,
              color: Colors.grey,
            );
          },
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SizedBox(
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: //TODO:https://youtu.be/ZRT2pLoOKc8?si=l9splGhT9aoBmLDv&t=233
                      '${AppwriteConstants.endPoint}/storage/buckets/${AppwriteConstants.employeeBucketId}/files/${state[index].image}/view?project=${AppwriteConstants.projectID}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              title: Text(
                //TODO:https://youtu.be/ZRT2pLoOKc8?si=VaYRwefTE9gDWv7m&t=234
                state[index].name,
                style: const TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                state[index].departement,
                style: const TextStyle(fontSize: 14),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      //TODO:https://youtu.be/haok75fnIQQ?si=zTLEm_iuRdq9VEQ6&t=98
                      // controller.moveToEditEmpoyee(state[index]);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            );
          },
          itemCount: state!.length,
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => Center(
          child: Text(error!),
        ),
        onEmpty: const Center(
          child: Text('No Post Found'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          controller.moveToCreateEmpoyee();
        },
      ),
    );
  }
}
