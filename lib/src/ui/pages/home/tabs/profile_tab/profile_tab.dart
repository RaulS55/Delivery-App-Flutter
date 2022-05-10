import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/data/repositories/authentication_repository.dart';
import 'package:deliveryproyect/src/data/repositories/preference_repository.dart';
import 'package:deliveryproyect/src/data/repositories/websocket_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/global_controler/notification_controller.dart';
import 'package:deliveryproyect/src/utils/date_format.dart';
import 'package:deliveryproyect/src/utils/dialogs.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  void _singOut(BuildContext context) async {
    final isOk = await Dialogs.confirm(context, title: "ACTION REQUIRED");
    if (isOk) {
      Get.i.remuve<User>();
      await Get.i.find<AuthenticationRepository>().singOut();
      await Get.i.find<PreferenceRepository>().setOnboardReady(false);
      await Get.i.find<WebsocketRepository>().disconnect();
      context.read<NotificationControler>().clear();

      Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Get.i.find<User>();
    return Container(
      color: CupertinoColors.systemGroupedBackground,
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Align(
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    "https://lifestylemadeinitaly.it/wp-content/uploads/Creazione-avatar-FB.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          CupertinoFormSection.insetGrouped(
            margin: const EdgeInsets.all(15).copyWith(top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            header: const Text("User Information"),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  "Id:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                child: Text(user.id),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Name:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                child: Text(user.name),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Last Name:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                child: Text(user.lastName),
              ),
              CupertinoTextFormFieldRow(
                prefix: Text(
                  "Email:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                initialValue: user.email,
                textAlign: TextAlign.right,
                style: MyFontStyles.regular.copyWith(color: Colors.black),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Birthday:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                child: Text(user.birthDay.format),
              ),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("Payment Metods"),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  "Credit Card:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                child: CupertinoButton(
                    child: const Icon(Icons.credit_card), onPressed: () {}),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Paypal:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                child: CupertinoButton(
                    child: const Icon(Icons.paypal), onPressed: () {}),
              ),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("Acount"),
            children: [
              CupertinoFormRow(
                prefix: Text(
                  "Configuration:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                child: CupertinoButton(
                    child: const Icon(Icons.settings), onPressed: () {}),
              ),
              CupertinoFormRow(
                prefix: Text(
                  "Sing Out:",
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
                child: CupertinoButton(
                    child: const Icon(Icons.logout_outlined),
                    onPressed: () => _singOut(context)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
