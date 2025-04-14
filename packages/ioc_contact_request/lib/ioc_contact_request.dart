import 'package:ag/ag.dart';
import 'package:cdn/cdn.dart';
import 'package:ds/ds.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ioc_contact_request/src/modules/b2c/widgets/form_construction_info.dart';
import 'package:ioc_contact_request/src/modules/b2c/widgets/form_customer_info.dart';
import 'dart:convert';
import 'package:logs/logs.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:router/router.dart';
import 'package:utils/utils.dart';

import 'package:auth/auth.dart';

import 'package:intl/intl.dart';

import 'src/modules/b2c/widgets/a.dart';
import 'src/modules/b2c/widgets/form_contact_info.dart';

import 'dart:io';

import 'package:cdn/gen/assets.gen.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../ioc_contact_request.dart';
import 'src/modules/house_model/enum/architectural_design_enum.dart';
import 'src/modules/house_model/widget/dot.dart';

/// part --

part 'src/constant/ioc_contact_request_constant.dart';
part 'src/data/api/ioc_contact_request_api.dart';
part 'src/data/local/auth_local_storage.dart';
part 'src/data/repository/ioc_contact_request_repository.dart';
part 'src/di/ioc_contact_request_di.dart';
part 'src/services/ioc_contact_request_service.dart';


part 'src/extension/string.dart';


part 'src/router/ioc_contact_request_router.dart';

part 'src/modules/b2b/page/ioc_contact_request_page.dart';
part 'src/modules/b2b/page/ioc_contact_request_detail_page.dart';

part 'src/modules/b2b/state/ioc_request_contact_detail_state.dart';

part 'src/modules/b2b/provider/ioc_contact_request_provider.dart';
part 'src/modules/b2b/provider/ioc_contact_request_detail_provider.dart';

part 'src/entities/app_param.dart';
part 'src/entities/approve_logs.dart';
part 'src/entities/collect_project.dart';
part 'src/entities/construction_image_info.dart';
part 'src/entities/contact_clue.dart';
part 'src/entities/customer_dto.dart';
part 'src/entities/employee_dto.dart';
part 'src/entities/ioc_contact_request.dart';
part 'src/entities/prepare_bidding.dart';
part 'src/modules/b2b/page/ioc_contact_request_type.dart';
part 'src/entities/state_info.dart';
part 'src/entities/user_info_dto.dart';
part 'src/entities/address_selected.dart';


part 'src/modules/b2c/page/ioc_contact_request_b2c_page.dart';
part 'src/modules/b2c/page/ioc_contact_request_b2c_detail_page.dart';
part 'src/modules/b2c/provider/ioc_contact_request_b2c_provider.dart';
part 'src/modules/b2c/provider/ioc_contact_request_b2c_detail_provider.dart';
part 'src/modules/b2c/state/ioc_request_contact_b2c_detail_state.dart';
part 'src/modules/b2c/state/option.dart';
part 'src/modules/b2c/state/ai_ioc_request_contact_b2c_state.dart';
part 'src/modules/b2c/provider/ai_ioc_contact_request_b2c_provider.dart';


part 'src/modules/house_model/page/house_model_page.dart';

