import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../ioc_contact_request.dart';
import 'a.dart';

class AIContactRequestB2c extends StatefulHookConsumerWidget {
  const AIContactRequestB2c({
    super.key,
    required this.tangentCustomerId,
  });

  final int tangentCustomerId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AiContactRequestB2cState();
}

class _AiContactRequestB2cState extends ConsumerState<AIContactRequestB2c>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormBuilderState>();
  int _selectedFloorIndex = 0;
  int _imageCount = 0;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _tabController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future(() {
      ref.read(aiIocContactRequestB2CProvider.notifier).getAppParamByParType();
    });
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final aiIocContactRequestB2C = ref.watch(aiIocContactRequestB2CProvider);

    var listRoomTypeSelected = useState<List<AppParam>>([]);

    var listStylishDesignSelected = useState<List<AppParam>>([]);

    return Layout(
      title: 'AI từ vấn mẫu nhà',
      backgroundColor: DSColors.backgroundWhite,
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tab Bar
              Container(
                decoration: BoxDecoration(
                  color: DSColors.backgroundWhite,
                  // borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Xây mới'),
                    Tab(text: 'Nâng cấp'),
                  ],
                  labelColor: DSColors.primary,
                  unselectedLabelColor: DSColors.textLabel,
                  indicatorColor: DSColors.primary,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              const Gap(16),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: DSSpacing.spacing4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
// Kiến trúc / Nội thất tabs
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: DSColors.primarySurface,
                              borderRadius:
                                  BorderRadius.circular(DSRadius.radiusFull),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home_outlined,
                                    color: DSColors.backgroundWhite),
                                const Gap(8),
                                Text(
                                  'Kiến trúc',
                                  style:
                                      DSTextStyle.bodySmall.semiBold().copyWith(
                                            color: DSColors.primary,
                                          ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(DSSpacing.spacing4),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: DSColors.secondaryBackground,
                              borderRadius:
                                  BorderRadius.circular(DSRadius.radiusFull),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.chair_outlined,
                                    color: DSColors.textLabel),
                                const Gap(8),
                                Text(
                                  'Nội thất',
                                  style:
                                      DSTextStyle.bodySmall.semiBold().copyWith(
                                            color: DSColors.textLabel,
                                          ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),

                    ChooseItemView<AppParam>(
                      name: AIIocContactRequestB2CFieldNames.stylishDesign.name,
                      title:
                          AIIocContactRequestB2CFieldNames.stylishDesign.title,
                      hintText:
                          'Chọn ${AIIocContactRequestB2CFieldNames.roomType.title.toLowerCase()}',
                      items: aiIocContactRequestB2C.listStylishDesign ?? [],
                      itemsSelected: listStylishDesignSelected.value,
                      // initialValue: listRoomTypeSelected.value.name,
                      selectionListType: SelectionListType.singleSelect,
                      isRequired: true,
                      onSelected: (value) {
                        _formKey.currentState?.patchValue({
                          AIIocContactRequestB2CFieldNames.stylishDesign.name:
                              value.map((e) => e.name ?? '').toList().join(';'),
                        });
                        listStylishDesignSelected.value = value.toList();
                      },
                      getLabel: (int index) {
                        return aiIocContactRequestB2C
                                .listStylishDesign![index].name ??
                            '';
                      },
                    ),
                    const Gap(16),

                    ChooseItemView<AppParam>(
                      name: AIIocContactRequestB2CFieldNames.roofType.name,
                      title: AIIocContactRequestB2CFieldNames.roofType.title,
                      hintText:
                          'Chọn ${AIIocContactRequestB2CFieldNames.roofType.title.toLowerCase()}',
                      items: aiIocContactRequestB2C.listRoofType ?? [],
                      itemsSelected: listRoomTypeSelected.value,
                      // initialValue: listRoomTypeSelected.value.name,
                      selectionListType: SelectionListType.singleSelect,
                      isRequired: true,
                      onSelected: (value) {
                        _formKey.currentState?.patchValue({
                          AIIocContactRequestB2CFieldNames.roofType.name:
                              value.map((e) => e.name ?? '').toList().join(';'),
                        });
                        listRoomTypeSelected.value = value.toList();
                      },
                      getLabel: (int index) {
                        return aiIocContactRequestB2C
                                .listRoofType![index].name ??
                            '';
                      },
                    ),
                    const Gap(16),
                    // Số tầng
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Số tầng *',
                          style: DSTextStyle.bodyMedium.copyWith(
                            color: DSColors.textLabel,
                          ),
                        ),
                        const Gap(8),
                        Row(
                          children: List.generate(
                            6,
                            (index) => Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedFloorIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: _selectedFloorIndex == index
                                        ? DSColors.primary
                                        : DSColors.secondaryBackground,
                                    borderRadius: BorderRadius.circular(360),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${index + 1}',
                                    style: DSTextStyle.bodyMedium.copyWith(
                                      color: _selectedFloorIndex == index
                                          ? DSColors.backgroundWhite
                                          : DSColors.textLabel,
                                      fontWeight: _selectedFloorIndex == index
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),

                    // Số ảnh hiển thị
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Số ảnh hiển thị',
                          style: DSTextStyle.bodyMedium.copyWith(
                            color: DSColors.textLabel,
                          ),
                        ),
                        const Gap(4),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: DSColors.borderDefault),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  // readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Số ảnh hiển thị không quá 5 ảnh',
                                    hintStyle: DSTextStyle.bodyMedium.copyWith(
                                      color: DSColors.textPlaceholder,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),

                    // Mô tả
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mô tả',
                          style: DSTextStyle.bodyMedium.copyWith(
                            color: DSColors.textLabel,
                          ),
                        ),
                        const Gap(4),
                        Container(
                          height: 120,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: DSColors.borderDefault),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _descriptionController,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nhập mô tả...',
                              hintStyle: DSTextStyle.bodyMedium.copyWith(
                                color: DSColors.textSubtitle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),

                    // Ảnh tham chiếu
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ảnh tham chiếu',
                          style: DSTextStyle.bodyMedium.copyWith(
                            color: DSColors.textLabel,
                          ),
                        ),
                        const Gap(8),
                        GestureDetector(
                          onTap: () {
                            // Handle image upload
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ExpenseScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: DSColors.borderDefault,
                                // style: BorderStyle.dashed,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: DSColors.textPlaceholder,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),

                    // Tạo mẫu button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle form submission
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DSColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Tạo mẫu',
                          style: DSTextStyle.bodyLarge.copyWith(
                            color: DSColors.backgroundWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Gap(24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
