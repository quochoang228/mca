import 'package:ag/ag.dart';
import 'package:cdn/cdn.dart';
import 'package:ds/ds.dart';
import 'package:di/di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:convert';
import 'package:logs/logs.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:router/router.dart';
import 'package:utils/utils.dart';

import 'package:ag/ag.dart';
import 'package:auth/auth.dart';
import 'package:di/di.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../ioc_contact_request.dart';

/// part --

part 'src/constant/ioc_contact_request_constant.dart';
part 'src/data/api/ioc_contact_request_api.dart';
part 'src/data/local/auth_local_storage.dart';
part 'src/data/repository/ioc_contact_request_repository.dart';
part 'src/di/ioc_contact_request_di.dart';
part 'src/services/ioc_contact_request_service.dart';


part 'src/router/ioc_contact_request_router.dart';

part 'src/ui/page/ioc_contact_request_page.dart';
part 'src/ui/page/ioc_contact_request_detail_page.dart';

part 'src/ui/state/ioc_request_contact_detail_state.dart';

part 'src/ui/provider/ioc_contact_request_provider.dart';
part 'src/ui/provider/ioc_contact_request_detail_provider.dart';

part 'src/entities/ioc_contact_request_b2b.dart';
part 'src/entities/app_param.dart';
