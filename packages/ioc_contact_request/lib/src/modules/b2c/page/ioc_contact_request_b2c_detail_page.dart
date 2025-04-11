part of '../../../../ioc_contact_request.dart';

class IocContactRequestB2CDetailPage extends StatefulHookConsumerWidget {
  const IocContactRequestB2CDetailPage({
    super.key,
    required this.contactRequest,
  });

  final IocContactRequest contactRequest;

  @override
  ConsumerState<IocContactRequestB2CDetailPage> createState() =>
      _IocContactRequestB2CDetailPageState();
}

class _IocContactRequestB2CDetailPageState
    extends ConsumerState<IocContactRequestB2CDetailPage> {
  @override
  void initState() {
    Future(() {
      ref.read(iocContactRequestB2CDetailProvider.notifier).getContactDetailB2C(
            widget.contactRequest.tangentCustomerId,
          );
      ref
          .read(iocContactRequestB2CDetailProvider.notifier)
          .getAppParamByParType();
    });

    super.initState();
  }

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final iocContactRequestB2CDetail =
        ref.watch(iocContactRequestB2CDetailProvider);

    void fillData(
      Map<String, FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>
          fields,
      IocContactRequest contactRequest,
    ) {
      // fields['type']?.didChange(contactRequest.type);
      // _createContactController.typeCustomer.value = contactRequest.type;
      //
      // if (_createContactController.typeCustomer.value == 1 && _createContactController.isRoleCSKH.value && contactRequest.state == Strings.CUSTOMER_POTENTIAL) {
      //   Future.delayed(Duration(milliseconds: 0), () {
      //     fields['isRoleCSKH'].didChange(true);
      //   });
      // }
      // fields['customerName'].didChange(contact?.customerName);
      // if (contact?.type == 1) {
      //   fields['customerGender'].didChange(contact?.customerGender);
      //   fields['placeOfIssue'].didChange(contact?.placeOfIssue);
      //   fields['customerIdentificationType'].didChange(contact?.customerIdentificationType);
      //   fields['estimatedBudget'].didChange(double.parse(contact?.estimatedBudget ?? '0').formatCurrencyWithoutUnit());
      //   fields['contentCustomer'].didChange(contact?.contentCustomer);
      //   _createContactController.listSpecificConstruction.forEach((element) {
      //     if (element.code == contact?.modelOfTheBuilder) {
      //       fields['modelOfTheBuilder'].didChange(element);
      //       if (element.name == 'Khác') {
      //         _createContactController.otherConstructionType.value = element;
      //       }
      //     }
      //   });
      //   _createContactController.listModelOfTheBuilder.forEach((element) {
      //     if (element.code == contact?.items) {
      //       fields['items'].didChange(element);
      //       fields['dataDvqt'].didChange(element.parOrder);
      //       _createContactController.dataItemsDVQT.value = element.parOrder;
      //       if (element.name.contains('Khác')) {
      //         _createContactController.otherItems.value = element;
      //         // fields['itemsDescription'].didChange(contact?.itemsDescription);
      //       }
      //     }
      //   });
      //   _createContactController.estimatedConstructionTime?.value = contact?.estimatedConstructionTime;
      //   _createContactController.lstContactClue.addAll(contact?.lstContactClue);
      // }
      //
      // fields['customerPhone'].didChange((contact?.isEncryptCustomerPhone ?? true) == true ? StringUtils.encryptPhoneNumbers(contact?.customerPhone ?? "") : (contact?.customerPhone ?? ""));
      // _createContactController.dateOfBirth?.value = contact?.dateOfBirth;
      // iocContactRequestB2CDetail.addressCustomer = AddressSelected(
      //   addressDetail: "${contact?.address != null ? "${contact?.address}, " : ''}"
      //       "${contact?.communeName}, "
      //       "${contact?.districtName}, "
      //       "${contact?.provinceName}",
      //   provinceId: contact?.provinceId,
      //   idAreaWard: contact?.areaId,
      //   provinceName: contact?.provinceName,
      //   districtName: contact?.districtName,
      //   areaWardName: contact?.communeName,
      //   address: contact?.address,
      // );

      // fields['customerIdentification'].didChange((contact?.isEncryptCustomerPhone ?? true) == true ? ('**********') : contact?.customerIdentification);
      // _createContactController.dateOfIssue?.value = contact?.dateOfIssue;
      // if (contact?.specificConstructionProvince != null) {
      //   _createContactController.addressSpecificConstruction.value = AddressSelected(
      //       addressDetail: "${contact?.specificAddressDetail != null ? "${contact?.specificAddressDetail}, " : ''}"
      //           "${contact?.specificConstructionCommune}, "
      //           "${contact?.specificConstructionDistrict}, "
      //           "${contact?.specificConstructionProvince}",
      //       provinceId: contact.provinceId,
      //       idAreaWard: contact.areaId,
      //       provinceName: contact?.specificConstructionProvince,
      //       districtName: contact?.specificConstructionDistrict,
      //       areaWardName: contact?.specificConstructionCommune,
      //       address: contact?.specificAddressDetail);
      // }
      //
      // _createContactController.listReceptionChannel.forEach((element) {
      //   if (element.code == contact?.receptionChannel) {
      //     fields['receptionChannel'].didChange(element);
      //
      //     if (element.name == 'Khác') {
      //       _createContactController.otherReceptionChannel.value = element;
      //     }
      //   }
      // });
      // _createContactController.listResourcesSelected.clear();
      // _createContactController.listCustomerResources.forEach((element) {
      //   if ((contact?.customerResources ?? '').split(',').contains(element.code)) {
      //     element.isChecked = true;
      //     _createContactController.listResourcesSelected.add(element);
      //
      //     if (element.name == 'Khác') {
      //       _createContactController.otherCustomerResources.value = element;
      //     }
      //   }
      // });
      // _createContactController.suggestTime?.value = contact?.suggestTime;
      // _createContactController.performerResponsible = EmployeeDto(
      //   sysUserId: contact?.performerId,
      //   fullName: contact?.performerName,
      //   provinceCode: contact?.provinceCode,
      //   phone: contact?.performerPhone,
      // );
      // _createContactController.campaignController.text = "${contact?.provinceCode ?? ''} - ${contact?.performerName ?? ''} - ${contact?.performerPhone ?? ''}";
      // var source = controller.currentContact?.value?.source;
      // if (_createContactController.listSourceYCTK.length > 0 && controller.currentContact?.value != null) {
      //   Future.delayed(Duration(milliseconds: 50), () {
      //     fields['source']?.didChange(_createContactController.listSourceYCTK?.firstWhere((element) => element.code == source, orElse: () => null));
      //   });
      // }
    }

    return Layout(
      title: 'Chi tiết YCTX B2C',
      action: [
        IconButton(
          icon: Icon(Icons.history, color: DSCoreColors.white),
          onPressed: () {
            // Navigator.pushNamed(context, Routes.createContactRequestB2CPage);
          },
        ),
      ],
      body: Stack(
        children: [
          FormBuilder(
            key: _formKey,
            initialValue: {
              'customerIdentification': (iocContactRequestB2CDetail
                              .currentContact?.isEncryptCustomerPhone ??
                          true) ==
                      true
                  ? '**********'
                  : iocContactRequestB2CDetail
                      .currentContact?.customerIdentification,
              'phone': (iocContactRequestB2CDetail
                              .currentContact?.isEncryptCustomerPhone ??
                          true) ==
                      true
                  ? '**********'
                  : iocContactRequestB2CDetail.currentContact?.customerPhone,
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DsViewContainer(
                    isHeader: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DsTitle(
                              title: iocContactRequestB2CDetail
                                      .detail.tangentCode ??
                                  '',
                              icon: CDNAssets.icons.copy.svg(),
                            ),
                            DsTitle(
                              // textDirection: TextDirection.rtl,
                              title:
                                  iocContactRequestB2CDetail.detail.stateStr ??
                                      '',
                              icon: CDNAssets.icons.infoCircle.svg(),
                            ),
                          ],
                        ),
                        const Gap(DSSpacing.spacing2),
                        DsTitle.caption(
                          title: 'Tạo bởi: Đặng Quốc Huy - 454151 - 0347000678',
                          color: DSColors.textSubtitle,
                        ),
                        DsTitle.caption(
                          title:
                              'Thực hiện: Đặng Quốc Huy - 454151 - 0347000678',
                          color: DSColors.textSubtitle,
                        ),
                        const Gap(DSSpacing.spacing3),
                        DsDivider(),
                        const Gap(DSSpacing.spacing4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DsTitle.body(
                              title: 'Hạn hoàn thành:',
                              color: DSColors.textSubtitle,
                            ),
                            DsTitle(
                              title: 'Thứ 7, 23/06/2024',
                              customStyle:
                                  DSTextStyle.labelMediumPromient.copyWith(
                                color: DSColors.textLabel,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DsTitle.body(
                              title: 'Giai đoạn:',
                              color: DSColors.textSubtitle,
                            ),
                            DsTitle(
                              title:
                                  iocContactRequestB2CDetail.detail.typeStr ??
                                      '',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(DSSpacing.spacing2),
                  FormCustomerInfo(
                    formState: _formKey.currentState,
                    validAndSaveFunc: () {},
                  ),
                  const Gap(DSSpacing.spacing2),
                  FormConstructionInfo(
                    formState: _formKey.currentState,
                  ),
                  const Gap(DSSpacing.spacing2),
                  FormContactInfo(
                    formState: _formKey.currentState,
                  ),
                  const Gap(DSSpacing.spacing2),
                  DsViewContainer(
                    title: 'Thông tin dự án',
                    isExpandable: false,
                    isDivider: false,
                    paddingContent: EdgeInsets.zero,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180,
                          child: StatusListScreen(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(
                vertical: DSSpacing.spacing2,
                horizontal: DSSpacing.spacing4,
              ),
              decoration: BoxDecoration(
                color: DSColors.backgroundWhite,
                boxShadow: const [
                  DSEffect.shadowNavBarEffect1,
                  DSEffect.shadowNavigationBarEffect1,
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DSButton(
                    label: 'Lưu lại',
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        // fillData(_formKey.currentState?.fields, iocContactRequestB2CDetail.currentContact);
                        // _createContactController.createContactRequestB2C();
                      }
                    },
                  ),
                  const Gap(DSSpacing.spacing2),
                  DSButton.icon(
                    label: 'AI thiết kế ảnh mẫu',
                    borderSide: BorderSide(
                      color: DSCoreColors.primary,
                      width: 1,
                    ),
                    foregroundColor: DSCoreColors.primary,
                    icon: Icon(Icons.lens_blur_outlined),
                    onPressed: () {
                      context.push(
                        IOCContactRequestService.iocContactRequestB2CAI,
                        extra:
                            iocContactRequestB2CDetail.detail.tangentCustomerId,
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
