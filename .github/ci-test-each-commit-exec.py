#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import subprocess

# ฟังก์ชันหลักสำหรับรันคำสั่ง shell
def run_cmd(cmd):
    print(f"รันคำสั่ง: {cmd}")
    try:
        # ใช้ subprocess.run เพื่อรันคำสั่ง shell และดึงผลลัพธ์ออกมา
        result = subprocess.run(cmd, shell=True, check=True,
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print(f"ผลลัพธ์: {result.stdout.decode('utf-8')}")
        return True
    except subprocess.CalledProcessError as e:
        # กรณีเกิดข้อผิดพลาดในการรันคำสั่ง
        print(f"คำสั่งล้มเหลว: {e.stderr.decode('utf-8')}", file=sys.stderr)
        return False

# ฟังก์ชันตรวจสอบว่ามีการเปลี่ยนแปลงไฟล์ .py หรือไม่
def is_py_changed():
    # เช็คไฟล์ที่ถูกแก้ไขใน commit ล่าสุด
    cmd = "git diff --name-only HEAD~1 HEAD"
    output = subprocess.check_output(cmd, shell=True).decode('utf-8')
    # ถ้ามีไฟล์ .py ใน list นั้นคืนค่า True
    return any(fname.endswith(".py") for fname in output.splitlines())

def main():
    # ถ้าไฟล์ Python มีการเปลี่ยนแปลงใน commit นี้
    if is_py_changed():
        # รันคำสั่งทดสอบ (เช่น pytest)
        if not run_cmd("pytest"):
            print("ทดสอบไม่ผ่าน, ออกโปรแกรมด้วยสถานะผิดพลาด", file=sys.stderr)
            sys.exit(1)
    else:
        print("ไม่มีการเปลี่ยนแปลงไฟล์ .py ไม่ต้องรันทดสอบ")

if __name__ == "__main__":
    main()