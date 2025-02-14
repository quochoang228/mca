part of '../../../ioc_contact_request.dart';

class IocContactRequestPage extends StatefulHookConsumerWidget {
  const IocContactRequestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IocContactRequestPageState();
}

class _IocContactRequestPageState extends ConsumerState<IocContactRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IOC YCTX',
          style: BaseStyle.titleMedium.semiBold(),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: BaseSpacing.spacing2,
          horizontal: BaseSpacing.spacing4,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: BaseSpacing.spacing2,
              horizontal: BaseSpacing.spacing4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BaseRadius.radiusMd),
              border: Border.all(
                color: CoreColors.neutral02,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mã YCTX',
                      style: BaseStyle.labelMedium.regular(),
                    ),
                    Text(
                      'FHODSHJ489239483',
                      style: BaseStyle.labelMedium,
                    ),
                  ],
                ),
                const Gap(BaseSpacing.spacing2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Người tạo',
                      style: BaseStyle.labelMedium.regular(),
                    ),
                    Text(
                      'Hoàng Tiến Quốc',
                      style: BaseStyle.labelMedium,
                    ),
                  ],
                ),
                const Gap(BaseSpacing.spacing2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trạng thái', style: BaseStyle.labelMedium.regular()),
                    Text(
                      'Đã tạo',
                      style: BaseStyle.labelMedium.applyColor(
                        BaseColors.success,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Gap(BaseSpacing.spacing2),
        itemCount: 16,
      ),
    );
  }
}
