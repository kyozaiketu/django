#!/usr/bin/env bash
# 出错时退出
set -o errexit

echo "正在安装依赖..."
pip install -r requirements.txt
echo "依赖安装完成"

echo "正在收集静态文件..."
python manage.py collectstatic --no-input
echo "静态文件收集完成"

echo "正在应用数据库迁移..."
python manage.py migrate
echo "数据库迁移完成"


python manage.py create_superuser

echo "正在启动 Gunicorn..."
# gunicorn mysite.asgi:application -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:$PORT
echo "Gunicorn 启动完成"

