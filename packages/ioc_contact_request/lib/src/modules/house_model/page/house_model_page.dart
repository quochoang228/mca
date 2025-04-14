part of '../../../../ioc_contact_request.dart';

class HouseModelPage extends StatefulHookConsumerWidget {
  const HouseModelPage({
    super.key,
    required this.tangentCustomerId,
  });

  final int tangentCustomerId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AiContactRequestB2cState();
}

class _AiContactRequestB2cState extends ConsumerState<HouseModelPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _architecturalDesignTabController;
  final _formKey = GlobalKey<FormBuilderState>();
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
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _architecturalDesignTabController = TabController(
      length: ArchitecturalDesignEnum.values.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final aiIocContactRequestB2C = ref.watch(aiIocContactRequestB2CProvider);

    var listRoomTypeSelected = useState<List<AppParam>>([]);

    var listStylishDesignSelected = useState<List<AppParam>>([]);

    var lstImage = useState<List<XFile>>([]);

    var architecturalDesignTabSeleted =
        useState(ArchitecturalDesignEnum.architecture);

    var selectedFloorIndex = useState(1);

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: DSSpacing.spacing4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      controller: _architecturalDesignTabController,
                      tabs: ArchitecturalDesignEnum.values
                          .map(
                            (e) => Tab(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  color:
                                      e == architecturalDesignTabSeleted.value
                                          ? DSColors.primarySurface
                                          : DSColors.secondaryBackground,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // SvgPicture.asset(e ==
                                    //         ArchitecturalDesignEnum
                                    //             .architecture
                                    //     ? Assets.ic_architecture
                                    //     : Assets.interior),\

                                    Text(e.label),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      labelColor: DSColors.primary,
                      unselectedLabelColor: DSColors.textLabel,
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: false,
                      labelStyle: DSTextStyle.bodySmall.semiBold(),
                      unselectedLabelStyle: DSTextStyle.bodySmall,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                      dividerHeight: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      onTap: (index) {
                        architecturalDesignTabSeleted.value =
                            ArchitecturalDesignEnum.values[index];
                      },
                    ),

                    architecturalDesignTabSeleted.value ==
                            ArchitecturalDesignEnum.interior
                        ? ChooseItemView<AppParam>(
                            name:
                                AIIocContactRequestB2CFieldNames.roomType.name,
                            title:
                                AIIocContactRequestB2CFieldNames.roomType.title,
                            hintText:
                                'Chọn ${AIIocContactRequestB2CFieldNames.roomType.title.toLowerCase()}',
                            items: aiIocContactRequestB2C.listRoofType ?? [],
                            itemsSelected: listRoomTypeSelected.value,
                            // initialValue: listRoomTypeSelected.value.name,
                            selectionListType: SelectionListType.singleSelect,
                            isRequired: true,
                            onSelected: (value) {
                              _formKey.currentState?.patchValue({
                                AIIocContactRequestB2CFieldNames.roomType.name:
                                    value
                                        .map((e) => e.name ?? '')
                                        .toList()
                                        .join(';'),
                              });
                              listRoomTypeSelected.value = value.toList();
                            },
                            getLabel: (int index) {
                              return aiIocContactRequestB2C
                                      .listRoofType![index].name ??
                                  '';
                            },
                          )
                        : const SizedBox(),
                    const Gap(8),

                    ChooseItemView<AppParam>(
                      name: AIIocContactRequestB2CFieldNames.stylishDesign.name,
                      title:
                          AIIocContactRequestB2CFieldNames.stylishDesign.title,
                      hintText:
                          'Chọn ${AIIocContactRequestB2CFieldNames.stylishDesign.title.toLowerCase()}',
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
                    const Gap(8),

                    architecturalDesignTabSeleted.value ==
                            ArchitecturalDesignEnum.architecture
                        ? ChooseItemView<AppParam>(
                            name:
                                AIIocContactRequestB2CFieldNames.roofType.name,
                            title:
                                AIIocContactRequestB2CFieldNames.roofType.title,
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
                                    value
                                        .map((e) => e.name ?? '')
                                        .toList()
                                        .join(';'),
                              });
                              listRoomTypeSelected.value = value.toList();
                            },
                            getLabel: (int index) {
                              return aiIocContactRequestB2C
                                      .listRoofType![index].name ??
                                  '';
                            },
                          )
                        : const SizedBox(),

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
                                  selectedFloorIndex.value = index;
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: selectedFloorIndex.value == index
                                        ? DSColors.primary
                                        : DSColors.secondaryBackground,
                                    borderRadius: BorderRadius.circular(360),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${index + 1}',
                                    style: DSTextStyle.bodyMedium.copyWith(
                                      color: selectedFloorIndex.value == index
                                          ? DSColors.backgroundWhite
                                          : DSColors.textLabel,
                                      fontWeight:
                                          selectedFloorIndex.value == index
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

                    DsTextFieldV2(
                      name: 'name',
                      title: 'Số ảnh hiển thị',
                      hintText: 'Nhập số ảnh hiển thị',
                      isRequired: true,
                    ),
                    const Gap(16),
                    DsTextFieldV2(
                      name: 'note',
                      title: 'Mô tả',
                      hintText: 'Nhập mô tả',
                      maxLines: 4,
                      minLines: 4,
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
                          onTap: () async {
                            var image = await ImagePicker().pickMultiImage(
                              requestFullMetadata: false,
                              limit: 5,
                            );
                            if (image.isNotEmpty) {
                              lstImage.value = image;
                            }
                          },
                          child: DottedBorderWidget(
                            color: DSColors.textPlaceholder,
                            radius: 5,
                            padding: EdgeInsets.all(DSSpacing.spacing6),
                            child: Icon(Icons.add_photo_alternate),
                          ),
                        ),
                        const Gap(8),
                        lstImage.value.isEmpty
                            ? const SizedBox()
                            : SizedBox(
                                height: MediaQuery.sizeOf(context).width * 0.3,
                                child: ListView.separated(
                                  itemCount: lstImage.value.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var item = lstImage.value[index];
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      height: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: DSColors.backgroundBlack,
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(item.path),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Gap(8),
                                ),
                              ),
                      ],
                    ),
                    const Gap(24),

                    DSButton(
                      label: 'Tạo mẫu',
                      onPressed: () {},
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
