import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CampaignDatePickerModal extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const CampaignDatePickerModal({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<CampaignDatePickerModal> createState() =>
      _CampaignDatePickerModalState();
}

class _CampaignDatePickerModalState extends State<CampaignDatePickerModal> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialDate;
    _selectedDay = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFEDEDED),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: const Color(0xFFADACAE).withOpacity(0.42),
          width: 1.w,
        ),
      ),
      child: Container(
        width: 312.w,
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selected date",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4A4A4A),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF626262),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(2.r),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16.r,
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 24.h, thickness: 1, color: const Color(0xFFD9D9D9)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(_focusedDay),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4A4A4A),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Color(0xFF4A4A4A),
                      ),
                      onPressed: () {
                        setState(() {
                          _focusedDay = DateTime(
                            _focusedDay.year,
                            _focusedDay.month - 1,
                          );
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF4A4A4A),
                      ),
                      onPressed: () {
                        setState(() {
                          _focusedDay = DateTime(
                            _focusedDay.year,
                            _focusedDay.month + 1,
                          );
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            // Simple Calendar Grid
            SizedBox(
              height: 280.h,
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Color(0xFF9136F3),
                    onPrimary: Colors.white,
                    onSurface: Color(0xFF4A4A4A),
                  ),
                ),
                child: CalendarDatePicker(
                  initialDate: _selectedDay ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  onDateChanged: (date) {
                    setState(() {
                      _selectedDay = date;
                    });
                    widget.onDateSelected(date);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCampaignDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required ValueChanged<DateTime> onDateSelected,
}) {
  showDialog(
    context: context,
    builder: (context) => CampaignDatePickerModal(
      initialDate: initialDate,
      onDateSelected: onDateSelected,
    ),
  );
}
