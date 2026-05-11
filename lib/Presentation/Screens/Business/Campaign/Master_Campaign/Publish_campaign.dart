import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublishCampaign extends StatefulWidget {
  const PublishCampaign({super.key});

  @override
  State<PublishCampaign> createState() => _PublishCampaignState();
}

class _PublishCampaignState extends State<PublishCampaign> {
  bool agreeToTerms = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: -10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF9136F3),
            size: 20,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Publish Campaign",
          style: TextStyle(
            color: Color(0xFF9136F3),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 1. Payment Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F6FF),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xFFE1D0FF).withOpacity(0.5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.campaign_outlined,
                        color: Color(0xFF9136F3),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Campaign",
                        style: TextStyle(
                          color: Color(0xFF9136F3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    color: Colors.black12,
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                  const SizedBox(height: 12),
                  _buildPriceRow("Primary Fee", "₹ 349"),
                  const SizedBox(height: 12),
                  _buildPriceRow("Fee", "+ ₹ 99"),
                  const SizedBox(height: 16),
                  Container(
                    height: 2,
                    color: const Color(0xFFE1D0FF),
                    width: double.infinity,
                  ),
                  const SizedBox(height: 16),
                  _buildPriceRow("Total", "₹ 448", isBold: true),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 2. Promotional Code Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFBF9FF),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Promotional Code",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE1D0FF)),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Have a promotional code?",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: 13,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          color: const Color(0xFFE1D0FF),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Apply",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 3. Terms & Conditions
            GestureDetector(
              onTap: () => setState(() => agreeToTerms = !agreeToTerms),
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: agreeToTerms
                          ? const Color(0xFF4A6572)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: agreeToTerms
                            ? const Color(0xFF4A6572)
                            : Colors.black26,
                        width: 2,
                      ),
                    ),
                    child: agreeToTerms
                        ? const Icon(Icons.check, color: Colors.white, size: 16)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "I Agree with the term & Condition Policy",
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 4. Proceed to Payment Button
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFBB93FF), Color(0xFF5765FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5765FF).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Final payment action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Proceed to Payment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: isBold ? Colors.black87 : Colors.black54,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
