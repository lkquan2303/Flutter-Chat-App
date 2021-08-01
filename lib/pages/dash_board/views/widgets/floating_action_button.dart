import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

FloatingActionButton buildFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {},
    backgroundColor: kPrimaryColor,
    child: const Icon(
      Icons.person_add_alt_1,
      color: Colors.white,
    ),
  );
}
