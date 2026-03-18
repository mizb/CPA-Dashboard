FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 设置环境变量，防止 Python 写入 .pyc 文件，并使输出无缓冲
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 复制 requirements 文件并安装依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目的所有文件到容器的工作目录
COPY . .

# 暴露 Flask 运行的端口
EXPOSE 6060

# 启动应用程序
# 注意：配置中默认 host 为 127.0.0.1，如果要让外部访问可以设置 WEBUI_HOST=0.0.0.0环境变量
ENV WEBUI_HOST=0.0.0.0
ENV WEBUI_PORT=6060

CMD ["python", "app.py"]
