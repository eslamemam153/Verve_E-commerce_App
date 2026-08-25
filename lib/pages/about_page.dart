import 'package:flutter/material.dart';
import 'package:flutter_session_1/pages/main_navigation_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // لون الخلفية الرمادي الفاتح بيخلي الكروت البيضاء تظهر بشكل شيك
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            // بيمسح الـ Stack بتاع الشاشات ويرجعك لـ MainNavigationScreen (الهوم)
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MainNavigationBar(),
              ),
              (route) => false,
            );
          },
        ),
        title: const Text(
          "About",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // 1. App Version Info (بيانات التطبيق)
            const Text(
              "Verve 24.11.2", // استبدلت Droply بـ Verve
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "(142356971256)",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // 2. Section 1 (كارت التحديثات)
            _buildSectionBlock(["View changelog"]),
            const SizedBox(height: 20),

            // 3. Section 2 (كارت الروابط العامة)
            _buildSectionBlock([
              "Visit Verve.com", // استبدلت Hotelio
              "Visit for inspiration",
              "We are hiring!",
            ]),
            const SizedBox(height: 30),

            // 4. Legal Title (عنوان قسم الشؤون القانونية)
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Legal",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 5. Section 3 (كارت الشؤون القانونية)
            _buildSectionBlock([
              "Acknowledgments",
              "Privacy Policy",
              "Security Policy",
              "Terms of Service",
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- Helper Method ---
  // الدالة دي بتوفر علينا كتابة كود الكارت والـ Divider كل شوية
  // بنديها List فيها أسماء العناصر، وهي بترسم الكارت بالكامل
  Widget _buildSectionBlock(List<String> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // إضافة بوردر خفيف جداً زي الصورة
        border: Border.all(color: Colors.grey.shade300, width: 0.8),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  items[index],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
                onTap: () {
                  // هنا تقدر تحط الـ Navigation لكل زرار
                },
              ),
              // بنضيف خط فاصل (Divider) بعد كل عنصر، ما عدا العنصر الأخير
              if (index < items.length - 1)
                Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                  indent: 16,
                  endIndent: 16,
                ),
            ],
          );
        }),
      ),
    );
  }
}
