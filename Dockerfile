# Sử dụng image cơ bản của Frappe
FROM frappe/erpnext-worker:latest

# Cài đặt các thư viện và phụ thuộc cần thiết
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Sao chép mã nguồn của bạn vào image
COPY . /home/frappe/frappe-bench/apps/your_app/

# Đặt thư mục làm việc
WORKDIR /home/frappe/frappe-bench

# Tạo database và áp dụng migrations (nếu cần)
RUN bench new-site --install-app your_app

# Khởi động ứng dụng
CMD ["bench", "start"]