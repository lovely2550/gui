#!/bin/sh
set -e  # เมื่อเกิดข้อผิดพลาดใดๆ จะหยุดการทำงานทันที

echo "เริ่มการรัน lint..."

# ตรวจสอบว่ามี argument ถูกส่งเข้ามาไหม
if [ "$#" -eq 0 ]; then
  # ถ้าไม่มี argument ให้รัน eslint ตรวจสอบไฟล์ทั้งหมดในโฟลเดอร์ src
  eslint src/
else
  # ถ้ามี argument ให้รัน eslint กับ argument เหล่านั้น
  eslint "$@"
fi

echo "การรัน lint เสร็จสิ้น"