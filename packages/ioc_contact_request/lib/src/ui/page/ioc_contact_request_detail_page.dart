part of '../../../ioc_contact_request.dart';

class IocContactRequestDetailPage extends StatefulHookConsumerWidget {
  const IocContactRequestDetailPage({
    super.key,
    required this.contactRequest,
  });

  final IocContactRequestB2B contactRequest;

  @override
  ConsumerState<IocContactRequestDetailPage> createState() => _IocContactRequestDetailPageState();
}

class _IocContactRequestDetailPageState extends ConsumerState<IocContactRequestDetailPage> {
  @override
  void initState() {
    Future(() {
      ref.read(iocContactRequestDetailProvider.notifier).getDataBranch();
      ref.read(iocContactRequestDetailProvider.notifier).getAllByParType();
      ref.read(iocContactRequestDetailProvider.notifier).getAppParamByParType();
      ref.read(iocContactRequestDetailProvider.notifier).getContactDetailB2B(
            widget.contactRequest.tangentCustomerId,
          );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final iocContactRequestDetail = ref.watch(iocContactRequestDetailProvider);

    var selectedValue = useState("");

    return Layout(
      title: 'Chi tiết YCTX',
      body: SingleChildScrollView(
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
                        title: iocContactRequestDetail.detail.tangentCode ?? '',
                        icon: CDNAssets.icons.copy.svg(),
                      ),
                      DsTitle(
                        textDirection: TextDirection.rtl,
                        title: iocContactRequestDetail.detail.stateStr ?? '',
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
                    title: 'Thực hiện: Đặng Quốc Huy - 454151 - 0347000678',
                    color: DSColors.textSubtitle,
                  ),
                  const Gap(DSSpacing.spacing3),
                  DsDivider(),
                  const Gap(DSSpacing.spacing3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DsTitle.body(
                        title: 'Hạn hoàn thành:',
                        color: DSColors.textSubtitle,
                      ),
                      DsTitle(
                        title: 'Thứ 7, 23/06/2024',
                        customStyle: DSTextStyle.labelMediumPromient.copyWith(
                          color: DSColors.textLabel,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DsTitle.body(
                        title: 'Trạng thái:',
                        color: DSColors.textSubtitle,
                      ),
                      DsTitle(
                        title: iocContactRequestDetail.detail.typeStr ?? '',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(DSSpacing.spacing2),
            DsViewContainer(
              title: 'Thông tin liên hệ',
              // rightAction: DSButton.icon(
              //   label: 'Chỉnh sửa',
              //   icon: DSAssets.icons.infoCircle.svg(),
              //   onPressed: () {},
              // ),
              child: Column(
                children: [
                  DsTextInfo(
                    title: 'Mã số thuế:',
                    subTitle: iocContactRequestDetail.detail.communeName ?? '',
                  ),
                  DsTextInfo(
                    title: 'Tên khách hàng:',
                    subTitle: iocContactRequestDetail.detail.status ?? '',
                  ),
                  DsTextInfo(
                    title: 'Số điện thoại:',
                    subTitle: iocContactRequestDetail.detail.status ?? '',
                  ),
                  DsTextInfo(
                    title: 'Địa chỉ:',
                    subTitle: iocContactRequestDetail.detail.address ?? '',
                  ),
                  DsTextInfo(
                    title: 'Loại khách hàng:',
                    subTitle: iocContactRequestDetail.detail.typeStr ?? '',
                  ),
                  DsTextInfo(
                    title: 'Trụ:',
                    subTitle: iocContactRequestDetail.detail.typeStr ?? '',
                  ),
                  DsTextInfo(
                    title: 'Nhân sự phụ trách:',
                    subTitle: iocContactRequestDetail.detail.typeStr ?? '',
                  ),
                  DsTextInfo(
                    title: 'Đơn vị phụ trách:',
                    subTitle: iocContactRequestDetail.detail.typeStr ?? '',
                  ),
                ],
              ),
            ),
            const Gap(DSSpacing.spacing2),
            DsViewContainer(
              title: 'Thông tin liên hệ',
              isExpandable: true,
              child: Column(
                children: [
                  DSTextField(
                    controller: TextEditingController()..text = 'Đặng Quốc Huy',
                    labelText: 'Họ và tên',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController()..text = 'Đặng Quốc Huy',
                    labelText: 'Số điện thoại',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController()..text = 'Đặng Quốc Huy',
                    labelText: 'Chức vụ',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController()..text = 'Đặng Quốc Huy',
                    labelText: 'Ngày tiếp xúc',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    maxLines: 3,
                    minLines: 3,
                    labelText: 'Nội dung tiếp xúc',
                    hintText: 'Nhập nội dung tpep xuc',
                    isRequired: true,
                  ),
                ],
              ),
            ),
            const Gap(DSSpacing.spacing2),
            DsViewContainer(
              title: 'Thông tin dự án',
              isExpandable: true,
              child: Column(
                children: [
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Tên dự án',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Trụ',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Lĩnh vực',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Ngành nghề',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Địa chỉ doanh nghiệp',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Nguồn giới thiệu',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Thời gian triển khai dự kiến',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Giá trị dự kiến (sau VAT)',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Hạng mục triển khai',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Tình trạng dự án',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Chi tiết tình trạng dự án',
                    isRequired: true,
                    minLines: 3,
                    maxLines: 3,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Loại tham gia',
                    isRequired: true,
                  ),
                  const Gap(16),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Nguồn dữ liệu',
                    isRequired: true,
                  ),
                ],
              ),
            ),
            const Gap(DSSpacing.spacing2),
            DsViewContainer(
              title: 'Thông tin tiêp xúc',
              isDivider: false,
              paddingContent: EdgeInsets.all(DSSpacing.spacing4).copyWith(
                top: DSSpacing.spacing0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DsTitle.body(title: 'Kết quả tiếp xúc'),
                  MediaSelectView(
                    mediaDTOs: [
                      MediaDto(
                        url: 'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png',
                      ),
                      MediaDto(),
                      MediaDto(),
                    ],
                    title: 'Kết quả tiếp xúc',
                  ),
                  // Gap(DSSpacing.spacing3),
                  DSTextField(
                    controller: TextEditingController(),
                    labelText: 'Kết quả tiếp xúc',
                    isRequired: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListBranch extends HookConsumerWidget {
  const ListBranch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listBranch = ref.watch(iocContactRequestDetailProvider.select((state) => state.listBranch));

    return listBranch.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              ...listBranch.map((branch) => Text(branch.name ?? '')),
            ],
          );
  }
}
