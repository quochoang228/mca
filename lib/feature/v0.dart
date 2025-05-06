// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//     ),
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Baby Tracking App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: const Color(0xFFF5EEFF),
//         fontFamily: 'PingFang SC',
//       ),
//       home: const BabyTrackingApp(),
//     );
//   }
// }
//
// class BabyTrackingApp extends StatelessWidget {
//   const BabyTrackingApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildStatusBar(),
//             _buildNavigationTabs(),
//             _buildSearchBar(),
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   _buildFeatureIcons(),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: _buildBabyProfile(),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: _buildCountdownSection(),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: _buildFeatureCards(),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: _buildPeriodTracker(),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: _buildLiveStream(),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: _buildPromotionBanner(),
//                   ),
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: _buildFeatureGrid(),
//                   ),
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: _buildDoctorSection(),
//                   ),
//                   const SizedBox(height: 80), // Space for bottom navigation
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavigation(),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 60, right: 10),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           decoration: BoxDecoration(
//             color: const Color(0xFFFF6633),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: const Text(
//             '今晚20点1元抢',
//             style: TextStyle(color: Colors.white, fontSize: 12),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStatusBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             '09:54',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           Row(
//             children: [
//               Row(
//                 children: List.generate(
//                   4,
//                   (index) => Container(
//                     margin: const EdgeInsets.only(right: 1),
//                     width: 2,
//                     height: 12,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(1),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 4),
//               const Text('4G'),
//               const SizedBox(width: 4),
//               Container(
//                 width: 22,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 14,
//                       color: Colors.black,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavigationTabs() {
//     return Container(
//       height: 50,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           const Text(
//             '精选',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(width: 20),
//           const Text(
//             '工具库',
//             style: TextStyle(fontSize: 16),
//           ),
//           const SizedBox(width: 20),
//           const Text(
//             '问医生',
//             style: TextStyle(fontSize: 16),
//           ),
//           const SizedBox(width: 20),
//           const Text(
//             '米粉特惠',
//             style: TextStyle(fontSize: 16, color: Color(0xFFFF9933), fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(width: 20),
//           const Text(
//             '宝宝',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(width: 16),
//           Stack(
//             children: [
//               Container(
//                 width: 32,
//                 height: 32,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFEEEEEE),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Center(
//                   child: Text(
//                     '育儿',
//                     style: TextStyle(fontSize: 10),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           children: [
//             const Icon(Icons.search, color: Colors.grey, size: 20),
//             const SizedBox(width: 8),
//             const Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: '宝宝突声翻译',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(fontSize: 14),
//                   contentPadding: EdgeInsets.zero,
//                   isDense: true,
//                 ),
//               ),
//             ),
//             Container(
//               width: 32,
//               height: 32,
//               decoration: BoxDecoration(
//                 color: Colors.blue.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: const Center(
//                 child: Text(
//                   'AI',
//                   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFeatureIcons() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildCircleIcon(Icons.access_time, const Color(0xFFEEEEEE)),
//           _buildCircleIcon(Icons.star_border, const Color(0xFFEEEEEE)),
//           Stack(
//             children: [
//               _buildCircleIcon(Icons.assignment, const Color(0xFFEEEEEE)),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCircleIcon(IconData icon, Color color) {
//     return Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//       ),
//       child: Icon(icon, size: 20, color: Colors.grey.shade700),
//     );
//   }
//
//   Widget _buildBabyProfile() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE8F4FF),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Quoc宝宝',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     const Text(
//                       '2023.08.11 1岁3个月17天',
//                       style: TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                     const SizedBox(width: 4),
//                     Icon(Icons.edit, size: 12, color: Colors.grey.shade600),
//                   ],
//                 ),
//                 const SizedBox(height: 2),
//                 const Text(
//                   '77.8-83.8cm 9.8-12.2kg',
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Text(
//                       '同龄宝宝',
//                       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                     ),
//                     ShaderMask(
//                       shaderCallback: (bounds) => const LinearGradient(
//                         colors: [Colors.pink, Colors.blue],
//                       ).createShader(bounds),
//                       child: const Text(
//                         'pk',
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 const Text(
//                   '宝宝能正确脱下自己的袜子...',
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFFEEEE),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Text(
//                         '84%可以',
//                         style: TextStyle(fontSize: 10, color: Color(0xFFFF6666)),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFEEEEFF),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Text(
//                         '16%不可以',
//                         style: TextStyle(fontSize: 10, color: Color(0xFF6666FF)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Stack(
//             children: [
//               Image.asset(
//                 'assets/baby_illustration.png',
//                 width: 80,
//                 height: 100,
//                 fit: BoxFit.contain,
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: Container(
//                   width: 24,
//                   height: 24,
//                   decoration: const BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.play_arrow, color: Colors.white, size: 16),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCountdownSection() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   '预计排卵日',
//                   style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   '12月6日 周五',
//                   style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               const Text(
//                 '还有',
//                 style: TextStyle(fontSize: 10, color: Colors.grey),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFF6666),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Text(
//                   '8',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ),
//               const Text(
//                 '天',
//                 style: TextStyle(fontSize: 10, color: Colors.grey),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFeatureCards() {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildFeatureCard('记照片', const Color(0xFFFFE6F0), Icons.photo_camera),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: _buildFeatureCard('在家早教', const Color(0xFFE6F0FF), Icons.home),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: _buildFeatureCard('宝宝保险', const Color(0xFFFFF6E6), Icons.shield),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFeatureCard(String title, Color color, IconData icon) {
//     return Container(
//       height: 80,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 24, color: Colors.grey.shade700),
//           const SizedBox(height: 4),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPeriodTracker() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   '记经期',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   '经期健康分析 预测排卵日',
//                   style: TextStyle(fontSize: 10, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//           Image.asset(
//             'assets/calendar_icon.png',
//             width: 60,
//             height: 60,
//             fit: BoxFit.contain,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLiveStream() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   '妈网直播',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   '寒冬来袭 儿童感冒如何破局',
//                   style: TextStyle(fontSize: 10, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 48,
//             height: 48,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Center(
//               child: Text(
//                 'M',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPromotionBanner() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFF6F6),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.volume_up, size: 16, color: Colors.grey),
//           const SizedBox(width: 8),
//           const Expanded(
//             child: Text(
//               '子初婴儿湿巾29.9元640抽',
//               style: TextStyle(fontSize: 12),
//             ),
//           ),
//           const Icon(Icons.close, size: 16, color: Colors.grey),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFeatureGrid() {
//     final List<Map<String, dynamic>> features = [
//       {'icon': '📚', 'label': '绘本王国', 'color': const Color(0xFFFFEEDD)},
//       {'icon': '🎠', 'label': '益智玩具', 'color': const Color(0xFFFFEEDD)},
//       {'icon': '💉', 'label': '疫苗怎么打', 'color': const Color(0xFFE6F0FF)},
//       {'icon': '📈', 'label': '成长测评', 'color': const Color(0xFFFFEEDD)},
//       {'icon': '👨‍⚕️', 'label': '问医生', 'color': const Color(0xFFE6F0FF)},
//
//       {'icon': '🔍', 'label': '宝宝解名', 'color': const Color(0xFFFFEEDD)},
//       {'icon': '👨‍👩‍👧‍👦', 'label': '育儿交流群', 'color': const Color(0xFFE6FFE6)},
//       {'icon': '🎁', 'label': '免费试用', 'color': const Color(0xFFFFE6F0)},
//       {'icon': '🥛', 'label': '新国标奶粉', 'color': const Color(0xFFFFEEDD)},
//       {'icon': '🛡️', 'label': '宝宝买保险', 'color': const Color(0xFFFFEEDD)},
//
//       {'icon': '👗', 'label': '产后塑形', 'color': const Color(0xFFE6F0FF)},
//       {'icon': '⚖️', 'label': '减肥瘦身', 'color': const Color(0xFFFFE6F0)},
//       {'icon': '🌡️', 'label': '应季成长指南', 'color': const Color(0xFFE6F0FF)},
//       {'icon': '🍲', 'label': '备孕方法', 'color': const Color(0xFFFFEEDD)},
//       {'icon': '🧰', 'label': '更多工具', 'color': const Color(0xFFFFE6F0)},
//     ];
//
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 5,
//         childAspectRatio: 0.7,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 16,
//       ),
//       itemCount: features.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             Container(
//               width: 48,
//               height: 48,
//               decoration: BoxDecoration(
//                 color: features[index]['color'],
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Text(
//                   features[index]['icon'],
//                   style: const TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               features[index]['label'],
//               style: const TextStyle(fontSize: 10),
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildDoctorSection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             '问医生',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Row(
//             children: const [
//               Text(
//                 '99%妈妈都在问',
//                 style: TextStyle(fontSize: 12, color: Color(0xFFFF6633)),
//               ),
//               Icon(Icons.chevron_right, size: 16, color: Colors.grey),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBottomNavigation() {
//     return Container(
//       height: 70,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         border: Border(
//           top: BorderSide(color: Color(0xFFEEEEEE), width: 0.5),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem('育儿管家', 'assets/nav_home.png', true),
//           _buildNavItem('成长记录', 'assets/nav_growth.png', false),
//           _buildNavItem('娘家', 'assets/nav_family.png', false),
//           Stack(
//             children: [
//               _buildNavItem('育儿好货', 'assets/nav_products.png', false),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFF6633),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Text(
//                     '20点开抢',
//                     style: TextStyle(color: Colors.white, fontSize: 8),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           _buildNavItem('发现', 'assets/nav_discover.png', false),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem(String label, String iconPath, bool isActive) {
//     // Since we don't have actual assets, we'll use icons instead
//     IconData getIcon() {
//       switch (label) {
//         case '育儿管家':
//           return Icons.home;
//         case '成长记录':
//           return Icons.person;
//         case '娘家':
//           return Icons.message;
//         case '育儿好货':
//           return Icons.book;
//         case '发现':
//           return Icons.explore;
//         default:
//           return Icons.circle;
//       }
//     }
//
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           width: 24,
//           height: 24,
//           decoration: BoxDecoration(
//             color: isActive ? const Color(0xFFFF99CC) : Colors.transparent,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             getIcon(),
//             size: 16,
//             color: isActive ? Colors.white : Colors.grey,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 10,
//             color: isActive ? const Color(0xFFFF99CC) : Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
