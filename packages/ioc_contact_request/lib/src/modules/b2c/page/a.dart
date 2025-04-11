import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Map<String, String>> expenses = [
    {
      'title': 'Chi phí sửa chữa bảo dưỡng định kỳ',
      'amount': '1.200.000 vnđ',
      'date': '12/02/2025',
      'status': 'Đã duyệt',
    },
    {
      'title': 'Chi phí sửa chữa bảo dưỡng định kỳ',
      'amount': '1.200.000 vnđ',
      'date': '12/02/2025',
      'status': 'Đã duyệt',
    },
    {
      'title': 'Chi phí sửa chữa bảo dưỡng định kỳ',
      'amount': '1.200.000 vnđ',
      'date': '12/02/2025',
      'status': 'Chờ duyệt',
    },
  ];

  final Set<int> selectedIndexes = {};

  void _toggleSelected(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDark ? const Color(0xFF121212) : const Color(0xFFF7F7F8);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
            child: Row(
              children: [
                BackButton(color: isDark ? Colors.white : Colors.black),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chi phí lệnh điều xe',
                      style: TextStyle(
                        color: isDark ? Colors.white : const Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '29F-01234 13/02/2015\nHà Nội - Hạ Long',
                      style: TextStyle(
                        color:
                            isDark ? Colors.grey[400] : const Color(0xFF757575),
                        fontSize: 12,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Chi phí đã thêm',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: expenses.length,
              separatorBuilder: (context, index) => const Gap(16),
              itemBuilder: (context, index) {
                final item = expenses[index];
                final isSelected = selectedIndexes.contains(index);
                return GestureDetector(
                  onTap: () => _toggleSelected(index),
                  child: AnimatedScale(
                    scale: isSelected ? 1.02 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: ExpenseCard3(
                      index: index,
                      title: item['title']!,
                      amount: item['amount']!,
                      date: item['date']!,
                      status: item['status']!,
                      isSelected: isSelected,
                    ),
                  ),
                );
              },
            ),
          ),
          AnimatedContainer(
            // opacity: selectedIndexes.isEmpty ? 0 : 1,
            duration: Duration(milliseconds: 800),
            height: selectedIndexes.isEmpty ? 0 : 68,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: SizedBox(
              width: double.infinity,
              // height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: selectedIndexes.isEmpty ? null : () {},
                child: const Text(
                  'Sửa chi phí',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseCard extends StatelessWidget {
  final int index;
  final String title;
  final String amount;
  final String date;
  final String status;
  final bool isSelected;

  const ExpenseCard({
    super.key,
    required this.index,
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF212121);
    final subColor = isDark ? Colors.grey[300]! : const Color(0xFF757575);

    Color statusColor;
    Color statusBg;
    if (status == 'Đã duyệt') {
      statusColor = const Color(0xFF2E7D32);
      statusBg = const Color(0xFFE8F5E9);
    } else {
      statusColor = const Color(0xFF9E9E9E);
      statusBg = const Color(0xFFF5F5F5);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? const Color(0xFF1976D2)
              : (isDark ? Colors.grey[700]! : const Color(0xFFE0E0E0)),
          width: isSelected ? 1.8 : 1,
        ),
        boxShadow: isDark
            ? []
            : const [
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow('Tên chi phí', title, textColor, subColor),
                  const SizedBox(height: 4),
                  _infoRow(
                      'Số tiền', amount, const Color(0xFFD32F2F), subColor),
                  const SizedBox(height: 4),
                  _infoRow('Ngày sử dụng', date, textColor, subColor),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Trạng thái',
                          style: TextStyle(fontSize: 14, color: subColor)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusBg,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(
      String label, String value, Color valueColor, Color labelColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: labelColor)),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 14,
              fontWeight: valueColor != labelColor
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class ExpenseCard2 extends StatelessWidget {
  final int index;
  final String title;
  final String amount;
  final String date;
  final String status;
  final bool isSelected;

  const ExpenseCard2({
    super.key,
    required this.index,
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = status == 'Đã duyệt'
        ? const Color(0xFF34A853)
        : const Color(0xFF757575);
    final statusBg = status == 'Đã duyệt'
        ? const Color(0xFFE6F4EA)
        : const Color(0xFFF2F2F2);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        // margin: const EdgeInsets.only(bottom: 16),
        // padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: const Color(0xFF2F80ED), width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Số thứ tự
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //   decoration: BoxDecoration(
            //     color: const Color(0xFF2F80ED),
            //     borderRadius: BorderRadius.circular(4),
            //   ),
            //   child: Text(
            //     'Chi phí ${index + 1}',
            //     style: const TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 13,
            //     ),
            //   ),
            // ),
            Container(
              height: 32,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF2196F3),
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(12),
                //   topRight: Radius.circular(12),
                // ),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12).copyWith(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow('Tên chi phí', title),
                  const SizedBox(height: 4),
                  _infoRow('Số tiền', amount,
                      valueColor: const Color(0xFFD32F2F)),
                  const SizedBox(height: 4),
                  _infoRow('Ngày sử dụng', date),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Trạng thái', style: TextStyle(fontSize: 14)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusBg,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 children: [
// // Tên chi phí
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Tên chi phí',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF212121),
//                         ),
//                       ),
//                       Expanded(
//                         child: Text(
//                           title,
//                           textAlign: TextAlign.right,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Color(0xFF212121),
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Divider(height: 16, thickness: 1),

//                   // Số tiền
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Số tiền',
//                         style:
//                             TextStyle(fontSize: 14, color: Color(0xFF212121)),
//                       ),
//                       Text(
//                         amount,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFFD32F2F),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),

//                   // Ngày sử dụng
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Ngày sử dụng',
//                         style:
//                             TextStyle(fontSize: 14, color: Color(0xFF212121)),
//                       ),
//                       Text(
//                         date,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFF212121),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),

//                   // Trạng thái
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Trạng thái',
//                         style:
//                             TextStyle(fontSize: 14, color: Color(0xFF212121)),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: statusBg,
//                           // borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           status,
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: statusColor,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              color: valueColor ?? const Color(0xFF212121),
              fontSize: 14,
              fontWeight:
                  valueColor != null ? FontWeight.w600 : FontWeight.normal,
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class ExpenseCard3 extends StatelessWidget {
  final int index;
  final String title;
  final String amount;
  final String date;
  final String status;
  final bool isSelected;

  const ExpenseCard3({
    super.key,
    required this.index,
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = status == 'Đã duyệt'
        ? const Color(0xFF34A853)
        : const Color(0xFF757575);
    final statusBg = status == 'Đã duyệt'
        ? const Color(0xFFE6F4EA)
        : const Color(0xFFF2F2F2);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          // border:
          //     isSelected ? Border.all(color: Colors.blue, width: 1.5) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        padding: EdgeInsets.all(isSelected ? 1.5 : 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow('Tên chi phí', title),
                    const SizedBox(height: 4),
                    _infoRow('Số tiền', amount,
                        valueColor: const Color(0xFFD32F2F)),
                    const SizedBox(height: 4),
                    _infoRow('Ngày sử dụng', date),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Trạng thái',
                            style: TextStyle(fontSize: 14)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: statusBg,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              color: valueColor ?? const Color(0xFF212121),
              fontSize: 14,
              fontWeight:
                  valueColor != null ? FontWeight.w600 : FontWeight.normal,
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
