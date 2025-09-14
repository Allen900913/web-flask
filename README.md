# MyBlog

一個使用 Flask 開發的個人部落格系統，支援 Markdown 編輯、文章管理、圖片上傳等功能。

## 🚀 功能特色

- **文章管理**: 支援新增、編輯、刪除文章
- **Markdown 支援**: 使用 Showdown.js 實現 Markdown 即時預覽
- **用戶認證**: 基於 Flask-Login 的登入系統
- **圖片上傳**: 支援圖片上傳和管理
- **響應式設計**: 使用 Bootstrap 5 框架
- **Docker 支援**: 提供完整的 Docker 容器化部署

## 🛠️ 技術棧

### 後端
- **Flask**: Web 框架
- **SQLAlchemy**: ORM 資料庫操作
- **Flask-Login**: 用戶認證
- **Flask-WTF**: 表單處理
- **bcrypt**: 密碼加密

### 前端
- **Bootstrap 5**: UI 框架
- **jQuery**: JavaScript 庫
- **Showdown.js**: Markdown 轉換

### 資料庫
- **MySQL 8.0**: 關聯式資料庫

### 部署
- **Docker**: 容器化
- **Docker Compose**: 多容器編排

## 🚀 快速開始

### 方法一：本地開發環境

#### 1. 克隆專案
```bash
git clone <your-repository-url>
cd myblog
```

#### 2. 建立虛擬環境
```bash
python -m venv myenv
# Windows
myenv\Scripts\activate
# Linux/Mac
source myenv/bin/activate
```

#### 3. 安裝依賴
```bash
pip install -r requirements.txt
```

#### 4. 設置環境變數
```bash
# 複製環境變數範例檔案
cp .env.example .env
# 編輯 .env 檔案，設置你的資料庫連線資訊
```

#### 5. 設置 MySQL 資料庫
```sql
CREATE DATABASE myblog_db;
CREATE USER 'myblog_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON myblog_db.* TO 'myblog_user'@'localhost';
FLUSH PRIVILEGES;
```

#### 6. 啟動應用程式
```bash
python main.py
```

應用程式將在 `http://localhost:8080` 啟動。

### 方法二：Docker 部署 (推薦)

#### 1. 使用 Docker Compose
```bash
# 克隆專案
git clone <your-repository-url>
cd myblog

# 啟動服務
docker-compose up -d
```

#### 2. 訪問應用程式
- 應用程式: `http://localhost`
- MySQL 資料庫會自動建立並初始化

## 🔧 配置說明

### 環境變數

| 變數名 | 說明 | 預設值 |
|--------|------|--------|
| `MYSQL_HOST` | MySQL 主機地址 | `localhost` |
| `MYSQL_PORT` | MySQL 連接埠 | `3306` |
| `MYSQL_USER` | MySQL 用戶名 | `root` |
| `MYSQL_PWD` | MySQL 密碼 | `123456` |
| `MYSQL_DB` | 資料庫名稱 | `myblog_db` |

### 預設帳號

系統會自動建立預設管理員帳號：
- 用戶名: `root`
- 密碼: `123456`

## 📖 使用說明

### 文章管理
1. 登入系統後，點擊「發布新文章」
2. 支援 Markdown 語法編寫
3. 即時預覽功能
4. 可編輯和刪除已發布的文章

### 圖片上傳
1. 進入圖片管理頁面
2. 選擇本地圖片檔案
3. 上傳後可在文章中引用

## 🐳 Docker 部署詳細說明

### 建置自定義映像
```bash
docker build -t myblog .
```

### 單獨運行容器
```bash
# 運行 MySQL
docker run -d --name mysql_server \
  -e MYSQL_ROOT_PASSWORD=nevertellyou \
  -e MYSQL_DATABASE=myblog_db \
  -v mysql_data:/var/lib/mysql \
  mysql:8.0

# 運行應用程式
docker run -d --name myblog_server \
  --link mysql_server \
  -p 8080:8080 \
  -e MYSQL_HOST=mysql_server \
  -e MYSQL_PWD=nevertellyou \
  myblog
```

## 🔒 安全注意事項

- 修改預設密碼
- 使用環境變數管理敏感資訊
- 定期更新依賴套件
- 在生產環境中設置適當的防火牆規則

## 📝 開發計畫

- [ ] 添加評論系統
- [ ] 實現標籤分類
- [ ] 支援文章搜尋
- [ ] 添加 RSS 訂閱
- [ ] 實現文章備份功能

## 📄 授權條款

此專案採用 MIT 授權條款。詳細資訊請參閱 [LICENSE](LICENSE) 檔案。

---

⭐ 如果這個專案對你有幫助，請給個 Star！
