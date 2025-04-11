import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../ioc_contact_request.dart';

class FormConstructionInfo extends StatefulHookConsumerWidget {
  const FormConstructionInfo({
    super.key,
    this.formState,
  });

  final FormBuilderState? formState;

  @override
  ConsumerState createState() => _FormConstructionInfoState();
}

class _FormConstructionInfoState extends ConsumerState<FormConstructionInfo> {
  @override
  Widget build(BuildContext context) {
    final iocContactRequestB2CDetail = ref.watch(iocContactRequestB2CDetailProvider);

    return DsViewContainer(
      title: 'Thông tin công trình',
      isExpandable: true,
      child: Column(
        children: [
          DsTextInfo(
            title: 'Địa điểm thi công:',
            subTitle: iocContactRequestB2CDetail.addressSpecificConstruction?.addressDetail ?? '',
          ),
          const Gap(DSSpacing.spacing15s),
          DsTextInfo(
            title: 'Loại công trình:',
            subTitle: iocContactRequestB2CDetail.detail.communeName ?? '',
          ),
          const Gap(DSSpacing.spacing15s),
          DsTextInfo(
            title: 'Dịch vụ quan tâm:',
            subTitle: iocContactRequestB2CDetail.dataItemsDVQT ?? '',
          ),
          const Gap(DSSpacing.spacing15s),
          DsTextInfo(
            title: 'Hạng mục thực hiện:',
            subTitle: iocContactRequestB2CDetail.dataItemsDVQT ?? '',
          ),
          const Gap(DSSpacing.spacing15s),
          DsTextInfo(
            title: 'Thời gian XD dự kiến (Dương lịch):',
            subTitle: iocContactRequestB2CDetail.detail.estimatedConstructionTime.toString(),
          ),
          const Gap(DSSpacing.spacing15s),
          DsTextInfo(
            title: 'Ngân sách dự kiến:',
            subTitle: double.parse(iocContactRequestB2CDetail.detail.estimatedBudget ?? '0')
                .toString(),
          ),
          const Gap(DSSpacing.spacing15s),
          DsTextInfo(
            title: 'Chi tiết nhu cầu:',
            subTitle: iocContactRequestB2CDetail.detail.contentCustomer ?? '',
          ),
        ],
      ),
    );
  }
}
