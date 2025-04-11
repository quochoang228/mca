import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../ioc_contact_request.dart';

class FormContactInfo extends StatefulHookConsumerWidget {
  const FormContactInfo({
    super.key,
    this.formState,
  });

  final FormBuilderState? formState;

  @override
  ConsumerState createState() => _FormConstructionInfoState();
}

class _FormConstructionInfoState extends ConsumerState<FormContactInfo> {
  @override
  Widget build(BuildContext context) {
    final iocContactRequestB2CDetail =
        ref.watch(iocContactRequestB2CDetailProvider);

    var listReceptionChannelSelected = useState<AppParam>(AppParam());
    var listSourceSelected = useState<AppParam>(AppParam());
    var listCustomerResourcesSelected = useState<AppParam>(AppParam());

    var isSelectedOldCus = useState(false);

    return DsViewContainer(
      title: 'Thông tin tiếp xúc',
      isExpandable: true,
      child: Column(
        children: [
          // DsTextInfo(
          //   title: 'Kênh tiếp nhận:',
          //   subTitle:
          //       iocContactRequestB2CDetail.listCustomerResources?.first.name ??
          //           '',
          // ),
          ChooseItemView<AppParam>(
            name: IocContactRequestB2CFieldNames.receptionChannel.name,
            title: IocContactRequestB2CFieldNames.receptionChannel.title,
            hintText:
                'Chọn ${IocContactRequestB2CFieldNames.receptionChannel.title.toLowerCase()}',
            items: iocContactRequestB2CDetail.listReceptionChannel ?? [],
            itemsSelected: [listReceptionChannelSelected.value],
            initialValue: listReceptionChannelSelected.value.name,
            onSelected: (value) {
              widget.formState?.patchValue({
                IocContactRequestB2CFieldNames.receptionChannel.name:
                    value.map((e) => e.name ?? '').toList().join(';'),
              });
              listReceptionChannelSelected.value = value.first;
            },
            getLabel: (int index) {
              return iocContactRequestB2CDetail
                      .listReceptionChannel![index].name ??
                  '';
            },
          ),
          const Gap(DSSpacing.spacing15s),
          ChooseItemView<AppParam>(
            name: IocContactRequestB2CFieldNames.source.name,
            title: IocContactRequestB2CFieldNames.source.title,
            hintText:
                'Chọn ${IocContactRequestB2CFieldNames.source.title.toLowerCase()}',
            items: isSelectedOldCus.value
                ? iocContactRequestB2CDetail.listSourceXHH ?? []
                : iocContactRequestB2CDetail.listSourceYCTK ?? [],
            itemsSelected: [listSourceSelected.value],
            initialValue: listSourceSelected.value.name,
            onSelected: (value) {
              widget.formState?.patchValue({
                IocContactRequestB2CFieldNames.source.name:
                    value.map((e) => e.name ?? '').toList().join(';'),
              });
              listSourceSelected.value = value.first;
            },
            getLabel: (int index) {
              return iocContactRequestB2CDetail
                      .listCustomerResources![index].name ??
                  '';
            },
          ),
          const Gap(DSSpacing.spacing15s),
          ChooseItemView<AppParam>(
            name: IocContactRequestB2CFieldNames.customerResources.name,
            title: IocContactRequestB2CFieldNames.customerResources.title,
            hintText:
                'Chọn ${IocContactRequestB2CFieldNames.customerResources.title.toLowerCase()}',
            items: iocContactRequestB2CDetail.listCustomerResources ?? [],
            itemsSelected: [listCustomerResourcesSelected.value],
            initialValue: listCustomerResourcesSelected.value.name,
            selectionListType: SelectionListType.multiSelect,
            isRequired: true,
            onSelected: (value) {
              widget.formState?.patchValue({
                IocContactRequestB2CFieldNames.customerResources.name:
                    value.map((e) => e.name ?? '').toList().join(';'),
              });
              listCustomerResourcesSelected.value = value.first;
            },
            getLabel: (int index) {
              return iocContactRequestB2CDetail
                      .listCustomerResources![index].name ??
                  '';
            },
          ),

          // FormBuilderDropdown(
          //   name: 'receptionChannel',
          //   isExpanded: true,
          //   icon: Icon(Icons.keyboard_arrow_down_outlined),
          //   // decoration: Style.inputDecorationBorder(
          //   //   hintText: '-- Lựa chọn --',
          //   // ),
          //   // validator: FormBuilderValidators.compose([
          //   //       (val) {
          //   //     if (!createContactController.checkedRoleCSKH && val == null) return ErrorString.required;
          //   //     return null;
          //   //   }
          //   // ]),
          //   items:
          //       iocContactRequestB2CDetail.listCustomerResources?.map((option) {
          //             return DropdownMenuItem(
          //               value: option,
          //               onTap: () {
          //                 // createContactController.otherReceptionChannel.value = option;
          //                 // if(option.code == "13"){
          //                 //   isSelectedOldCus.value = true;
          //                 //   createContactController.source.value = createContactController.listSourceXHH.first;
          //                 //   createContactController.listResourcesSelected.clear();
          //                 //   createContactController.listResourcesSelected.add(ParamDto(name: "Khách hàng cũ giới thiệu", code: "20", parType: "CUSTOMER_RESOURCES", parOrder: "20"));
          //                 //   widget.onUpdate();
          //                 // } else {
          //                 //   isSelectedOldCus.value = false;
          //                 //   // createContactController.source.value = createContactController.listSourceYCTK.last;
          //                 // }
          //               },
          //               child: Text(option.name ?? ''),
          //             );
          //           }).toList() ??
          //           [],
          // ),
          // FormBuilderDropdown(
          //   name: 'source',
          //   isExpanded: true,
          //   icon: Icon(Icons.keyboard_arrow_down_outlined),
          //   // decoration: Style.inputDecorationBorder(
          //   //   hintText: '-- Lựa chọn --',
          //   // ),
          //   // validator: FormBuilderValidators.compose([
          //   //       (val) {
          //   //     if (!createContactController.checkedRoleCSKH && val == null) return ErrorString.required;
          //   //     return null;
          //   //   }
          //   // ]),
          //   items: iocContactRequestB2CDetail.listSourceYCTK?.map((option) {
          //         return DropdownMenuItem(
          //           value: option,
          //           onTap: () {
          //             // createContactController.otherReceptionChannel.value = option;
          //             // if(option.code == "13"){
          //             //   isSelectedOldCus.value = true;
          //             //   createContactController.source.value = createContactController.listSourceXHH.first;
          //             //   createContactController.listResourcesSelected.clear();
          //             //   createContactController.listResourcesSelected.add(ParamDto(name: "Khách hàng cũ giới thiệu", code: "20", parType: "CUSTOMER_RESOURCES", parOrder: "20"));
          //             //   widget.onUpdate();
          //             // } else {
          //             //   isSelectedOldCus.value = false;
          //             //   // createContactController.source.value = createContactController.listSourceYCTK.last;
          //             // }
          //           },
          //           child: Text(option.name ?? ''),
          //         );
          //       }).toList() ??
          //       [],
          // ),
          // const Gap(DSSpacing.spacing15s),
          // DsTextInfo(
          //     title: 'Nguồn thông tin khách hàng:',
          //     subTitle: '219 Trung Kính, Cầu Giấy, Hà Nội'),
        ],
      ),
    );
  }
}
