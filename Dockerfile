# ===========================
# Stage 1: Build environment
# ===========================
FROM python:3.12-alpine AS builder

WORKDIR /opt/myblog

# 安裝 build 階段需要的套件
RUN apk add --no-cache \
    build-base \
    pkgconfig \
    mariadb-dev

# 建立虛擬環境
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# 複製需求檔案並安裝套件
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# ===========================
# Stage 2: Runtime environment
# ===========================
FROM python:3.12-alpine AS runtime

WORKDIR /opt/myblog

# 安裝 runtime 需要的最小依賴
RUN apk add --no-cache mariadb-connector-c

# 從 builder 複製虛擬環境和程式碼
COPY --from=builder /opt/venv /opt/venv
COPY . .

# 設定 PATH 與 PYTHONPATH
ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONPATH=/opt/myblog

# 啟動程式
ENTRYPOINT ["python", "main.py"]
