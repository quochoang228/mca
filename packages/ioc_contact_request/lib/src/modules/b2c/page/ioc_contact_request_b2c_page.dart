part of '../../../../ioc_contact_request.dart';

class IocContactRequestB2CPage extends StatefulHookConsumerWidget {
  const IocContactRequestB2CPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IocContactRequestB2CPageState();
}

class _IocContactRequestB2CPageState extends ConsumerState<IocContactRequestB2CPage> {
  @override
  void initState() {
    setUpData();
    super.initState();
  }

  void setUpData() {
    Future(() {
      ref.read(iocContactRequestB2CProvider.notifier).getListContactB2C(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Yêu cầu tiếp xúc B2C',
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DSButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(Routes.iocContactRequestCreatePage);
            },
            label: 'Tạo YCTX',
            icon: Icon(Icons.add,color: DSCoreColors.white,),
            // icon: CDNAssets.icons.infoCircle.svg(),
            padding: EdgeInsets.symmetric(
              vertical: DSSpacing.spacing4,
              horizontal: DSSpacing.spacing6,
            ),
          ),
        ],
      ),
      // bottomAction: DSButton(label: 'Tao YCTX', onPressed: () {
      // }),
      body: ref.watch(iocContactRequestB2CProvider).match(
            notLoaded: (_) => const SizedBox(),
            loading: (_) => const ListLoading(),
            noData: (_) => const BaseEmptyState(),
            failed: (error) => BaseEmptyState(
              title: error.error.message ?? '',
            ),
            fetched: (data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: DSSpacing.spacing25,
                      horizontal: DSSpacing.spacing4,
                    ),
                    color: DSColors.backgroundWhite,
                    child: Row(
                      children: [
                        Expanded(
                          child: DSTextField(
                            controller: TextEditingController(),
                            // prefix: MyAssets.icons.user.svg(),
                            labelText: 'Tìm kiếm',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.data.length,
                      separatorBuilder: (context, index) => const Gap(DSSpacing.spacing2),
                      padding: const EdgeInsets.symmetric(vertical: DSSpacing.spacing2),
                      itemBuilder: (context, index) {
                        var item = data.data[index];
                        return InkWell(
                          onTap: () {
                            context.push(IOCContactRequestService.iocContactRequestB2CDetail, extra: item);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(DSSpacing.spacing4),
                            decoration: BoxDecoration(
                              color: DSColors.backgroundWhite,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  item.tangentCode ?? '',
                                  style: DSTextStyle.labelMedium,
                                ),
                                const Gap(DSSpacing.spacing2),
                                Text(
                                  'Tạo bởi: Đặng Quốc Huy - 454151 - 0347000678',
                                  style: DSTextStyle.captionMedium.applyColor(DSColors.textSubtitle),
                                ),
                                const Gap(DSSpacing.spacing3),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: DSColors.backgroundGray,
                                        border: Border.all(
                                          color: DSColors.borderDivider,
                                        ),
                                        borderRadius: BorderRadius.circular(DSSpacing.spacing2),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: DSSpacing.spacing4 + 2,
                                        horizontal: DSSpacing.spacing2,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            item.endDate?.getFormat(pattern: 'EEEE') ?? '',
                                            style: DSTextStyle.headlineMedium,
                                          ),
                                          Container(
                                            color: DSColors.borderDefault,
                                            height: 1,
                                            width: 24,
                                          ),
                                          Text(item.endDate?.getFormat(pattern: 'd') ?? '', style: DSTextStyle.headlineLarge),
                                          Text(item.endDate?.getFormat(pattern: 'MMMM') ?? '', style: DSTextStyle.headlineSmall),
                                        ],
                                      ),
                                    ),
                                    const Gap(DSSpacing.spacing2),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            item.stateStr ?? '',
                                            style: DSTextStyle.bodySmall.applyColor(DSColors.warning),
                                          ),
                                          const Gap(DSSpacing.spacing1),
                                          Text(
                                            item.customerName ?? '',
                                            style: DSTextStyle.bodySmall.applyColor(DSColors.textLabel),
                                          ),
                                          const Gap(DSSpacing.spacing1),
                                          Text(
                                            item.address ?? '',
                                            style: DSTextStyle.bodySmall.applyColor(DSColors.textLabel),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }
}
