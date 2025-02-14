# Nên:
- Hiểu rõ cấu trúc của dự án và mối quan hệ giữa repo chính và submodules.
- Sử dụng các lệnh Git dành riêng cho submodules như `git submodule update --init --recursive`.
- Cẩn thận khi commit và push thay đổi, đảm bảo bạn đang làm việc trong đúng repo (chính hoặc submodule).
- Sử dụng các công cụ như Melos để quản lý dependencies và tasks across
  submodules.

# Cách Git xử lý submodules
1. Lưu trữ submodules:

- Git không lưu trữ code của submodule trực tiếp trong repo chính.
- Thay vào đó, Git lưu trữ một tham chiếu (reference) đến một commit cụ thể trong repo của submodule.
- Tham chiếu này được lưu trong file `.gitmodules` ở thư mục gốc của repo chính.

2. Clone repo có submodules:

- Khi clone một repo có submodules, ban đầu các thư mục submodule sẽ trống.
- Bạn cần chạy `git submodule init` và `git submodule update` để tải nội dung của submodules.
- Hoặc sử dụng `git clone --recursive` để clone repo chính và tất cả submodules
  cùng một lúc.

3. Cập nhật submodules:

- Khi có thay đổi trong repo của submodule, repo chính không tự động cập nhật.
- Bạn cần chạy `git submodule update --remote` để cập nhật submodules về phiên bản mới nhất.
- Sau đó, bạn cần commit thay đổi này trong repo chính.

4. Làm việc với submodules:

- Khi bạn cd vào thư mục submodule, bạn đang làm việc trực tiếp với repo của submodule đó.
- Mọi thay đổi, commit, và push trong thư mục submodule sẽ ảnh hưởng đến repo của submodule, không phải repo chính.

5. Theo dõi thay đổi:

- Git theo dõi submodule bằng cách lưu trữ SHA-1 hash của commit hiện tại của submodule.
- Khi bạn chạy `git status` trong repo chính, nó sẽ cho biết nếu submodule có
  thay đổi.

6. Xung đột submodule:

- Xung đột có thể xảy ra khi merge hoặc rebase nếu cả hai branches đều thay đổi phiên bản của submodule.
- Bạn cần giải quyết xung đột bằng cách chọn phiên bản submodule muốn sử dụng.

7. Xóa submodule:

- Xóa submodule phức tạp hơn so với thêm submodule.
- Bạn cần xóa tham chiếu trong `.gitmodules`, xóa mục trong `.git/config`, và xóa thư mục của submodule.

8. Nested submodules:

- Git hỗ trợ submodules lồng nhau, nhưng điều này có thể làm tăng độ phức tạp của quản lý dự án.

9. Branching và submodules:

- Mỗi branch trong repo chính có thể tham chiếu đến các phiên bản khác nhau của submodule.
- Khi chuyển branch, bạn có thể cần cập nhật submodules.

10. Performance:

- Với nhiều submodules, các thao tác Git có thể chậm hơn, đặc biệt là clone và fetch.