FROM ubuntu

COPY . /opt/myblog/

WORKDIR /opt/myblog/

# 安裝系統依賴
RUN apt-get update \
    && apt-get install -y python3 python3-pip python3-venv pkg-config libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# 建立虛擬環境
RUN python3 -m venv /opt/venv

# 確保虛擬環境優先於系統 Python
ENV PATH="/opt/venv/bin:$PATH"

# 安裝 Python 套件
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# 設定 PYTHONPATH
ENV PYTHONPATH=/opt/myblog

# 啟動程式
ENTRYPOINT ["python", "main.py"]
