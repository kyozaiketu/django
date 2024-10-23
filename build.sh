#!/usr/bin/env bash
# 出错时退出
set -o errexit

# 安装依赖
pip install -r requirements.txt

# 收集静态文件
python manage.py collectstatic --no-input

# 运行数据库迁移
python manage.py migrate

# 创建超级用户
python manage.py create_superuser

# 启动 Gunicorn 服务器并指定 UvicornWorker 和端口
gunicorn mysite.asgi:application -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:$PORT
