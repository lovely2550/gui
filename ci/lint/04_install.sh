#!/bin/bash
# สคริปต์ติดตั้งสำหรับ CI (Continuous Integration) ที่จะทำงานในขั้นตอน lint

set -euxo pipefail
# เปิดโหมด:
# -e: ออกจากสคริปต์ถ้ามีคำสั่งล้มเหลว
# -u: ออก error ถ้าใช้ตัวแปรที่ไม่ได้กำหนด
# -x: แสดงคำสั่งที่กำลังรัน
# -o pipefail: ตรวจสอบ error จากทุกคำสั่งใน pipeline

sudo apt-get update -y
# อัพเดตข้อมูลแพ็กเกจในระบบ

sudo apt-get install -y shellcheck
# ติดตั้ง shellcheck เครื่องมือเช็ค syntax shell script

pip3 install yamllint
# ติดตั้ง yamllint ผ่าน pip3 เพื่อเช็ค syntax ของไฟล์ YAML

pip3 install jsonlint
# ติดตั้ง jsonlint ผ่าน pip3 เพื่อเช็ค syntax ของไฟล์ JSON