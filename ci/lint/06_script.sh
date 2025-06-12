#!/bin/bash

# สคริปต์นี้ทำหน้าที่ตรวจสอบโค้ด (Linting) สำหรับโปรเจกต์

set -e  # ให้สคริปต์หยุดทำงานทันทีเมื่อเจอข้อผิดพลาด

echo "Start linting..."

# ตรวจสอบโค้ด Python ด้วย flake8
flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics

# ตรวจสอบโค้ด Python ด้วย flake8 แต่ครอบคลุมกว้างกว่าเดิม
flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics

echo "Linting complete."