import 'package:cdn/gen/assets.gen.dart';
import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../ioc_contact_request.dart';

class FormCustomerInfo extends StatefulHookConsumerWidget {
  const FormCustomerInfo({
    super.key,
    this.formState,
    required this.validAndSaveFunc,
  });

  final FormBuilderState? formState;
  final Function validAndSaveFunc;

  @override
  ConsumerState createState() => _FormCustomerInfoState();
}

class _FormCustomerInfoState extends ConsumerState<FormCustomerInfo> {
  @override
  Widget build(BuildContext context) {
    final iocContactRequestB2CDetail = ref.watch(iocContactRequestB2CDetailProvider);

    return DsViewContainer(
      title: 'Thông tin liên hệ',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CDNAssets.icons.calendar1.svg(),
          const Gap(DSSpacing.spacing2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      iocContactRequestB2CDetail.detail.customerName ?? '',
                      style: DSTextStyle.labelLarge.applyColor(
                        DSColors.textLabel,
                      ),
                    )),
                    CDNAssets.icons.callCircle.svg(),
                  ],
                ),
                Text(
                  (iocContactRequestB2CDetail.currentContact?.isEncryptCustomerPhone ?? true) == true ? '**********' : iocContactRequestB2CDetail.currentContact?.customerIdentification ?? '',
                  style: DSTextStyle.labelLarge.applyColor(
                    DSColors.textLabel,
                  ),
                ),
                const Gap(DSSpacing.spacing1),
                Text(
                  iocContactRequestB2CDetail.addressCustomer != null ? iocContactRequestB2CDetail.addressCustomer?.addressDetail ?? '' : '',
                  style: DSTextStyle.bodyMedium.applyColor(
                    DSColors.textBody,
                  ),
                ),
                const Gap(DSSpacing.spacing3),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: DSColors.borderDefault,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: DSSpacing.spacing3, vertical: DSSpacing.spacing1),
                  child: Text('Khách hàng cá nhân', style: DSTextStyle.captionMedium.applyColor(DSColors.textBody)),
                ),
                const Gap(DSSpacing.spacing15s),
                Row(
                  children: [
                    DSButton.icon(
                      label: 'Xem thông tin khách hàng',
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                          backgroundColor: DSColors.backgroundWhite,
                          isScrollControlled: true,
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.8,
                          ),
                          builder: (context) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    DsTextInfo(title: 'Loại khách hàng', subTitle: 'Cá nhân'),
                                    DsTextInfo(title: 'Loại khách hàng', subTitle: 'Cá nhân'),
                                    DsTextInfo(title: 'Loại khách hàng', subTitle: 'Cá nhân'),
                                    DsTextInfo(title: 'Loại khách hàng', subTitle: 'Cá nhân'),
                                    const Gap(DSSpacing.spacing6),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: DSButton(
                                        label: 'Liên hệ khách hàng',
                                        icon: CDNAssets.icons.callCalling.svg(),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      foregroundColor: DSColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
