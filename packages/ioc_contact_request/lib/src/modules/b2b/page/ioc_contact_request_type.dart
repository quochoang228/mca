part of '../../../../ioc_contact_request.dart';

class IocContactRequestType extends StatelessWidget {
  const IocContactRequestType({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Yêu cầu tiếp xúc',
      body: Padding(
        padding: const EdgeInsets.all(DSSpacing.spacing4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DSButton(
              label: 'Yêu cầu tiếp xúc B2B',
              onPressed: () {
                context.push(IOCContactRequestService.iocContactRequest);
              },
            ),
            const Gap(DSSpacing.spacing4),
            DSButton(
              label: 'Yêu cầu tiếp xúc B2C',
              onPressed: () {
                context.push(IOCContactRequestService.iocContactRequestB2C);
              },
            ),
          ],
        ),
      ),
    );
  }
}
