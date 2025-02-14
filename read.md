# Thêm submodule 
`git submodule add https://github.com/quochoang228/pub.git packages/pub`

# Kiểm tra trạng thái của các submodule
`git submodule status`

# Sau khi pull repo chính. Cần cập nhật submodules
`git submodule update --remote --merge`

# Update dependencies trong các packages
`melos bootstrap` hoặc `melos run pub_get`

# Khi thay đổi code trong các submodule từ SA cần thực hiện 2 bước để có thể
# commit code lên

Bước 1: Commit thay đổi từ submodule
* Di chuyển vào thư mục submodule
`cd packages/xxx`
* Thực hiện các thay đổi, sau đó commit và push như bình thường
`git add .
git commit -m "Comment feature xxx"
git push origin main`

Bước 2: Cập nhật repo chính
* Quay lại thư mục gốc của repo chính
`cd ../..`
* Cập nhật tham chiếu của submodule trong repo chính
`
git add packages/xxx
git commit -m "Update xxx submodule"
git push origin main
`
// Tạo template
`flutter create --template=package xxx`

