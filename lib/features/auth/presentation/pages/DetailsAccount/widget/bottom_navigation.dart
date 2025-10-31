import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';

class bottomNavigation extends StatelessWidget {
  bottomNavigation({super.key, required this.step, required this.route});
  int step;
  String route;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (step != 1) ...[
              Expanded(
                child: MainButton(
                  buttonText: 'Back',
                  onPressed: () {
                    pop(context);
                  },
                  height: 45,
                ),
              ),
            ],
            Gap(20),
            if (step == 1) ...[
              MainButton(
                width: 180,
                buttonText: (step == 3) ? 'Done' : 'Next',
                onPressed: () {
                  pushTo(
                    context: context,
                    route: route,
                  );
                },
                height: 45,
              ),
            ],
            if (step != 1) ...[
              Expanded(
                child: MainButton(
                  buttonText: (step == 3) ? 'Done' : 'Next',
                  onPressed: () {
                    if (route == Routes.login_H || route == Routes.login_P) {
                      pushAndRemoveUntil(
                          context: context, route: Routes.welcom);
                    }
                    FirebaseAuth.instance.currentUser!.updateDisplayName('Done');
                    pushTo(
                      context: context,
                      route: route,
                    );
                  },
                  height: 45,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
