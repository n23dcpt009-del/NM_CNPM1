// Tài khoản demo (key: username -> password)
const DEMO_USERS = {
  "nv001": "123456",
  "hr01": "admin"
};

const form = document.getElementById("loginForm");
const userInput = document.getElementById("username");
const passInput = document.getElementById("password");
const userErr = document.getElementById("userErr");
const passErr = document.getElementById("passErr");
const formMsg = document.getElementById("formMsg");

const togglePwd = document.getElementById("togglePwd");
const btnCancel = document.getElementById("btnCancel");
const remember = document.getElementById("remember");

// Tải username đã “Remember me”
window.addEventListener("DOMContentLoaded", () => {
  const savedUser = localStorage.getItem("remember_username");
  if (savedUser) {
    userInput.value = savedUser;
    remember.checked = true;
  }
});

// Hiện/ẩn mật khẩu
togglePwd.addEventListener("click", () => {
  passInput.type = passInput.type === "password" ? "text" : "password";
});

// Cancel: xóa form + thông báo
btnCancel.addEventListener("click", () => {
  form.reset();
  userErr.textContent = "";
  passErr.textContent = "";
  formMsg.textContent = "Đã xóa dữ liệu nhập.";
});

// Kiểm tra dữ liệu cơ bản
function validate() {
  let ok = true;
  userErr.textContent = "";
  passErr.textContent = "";
  formMsg.textContent = "";

  const u = userInput.value.trim();
  const p = passInput.value;

  if (u.length === 0) {
    userErr.textContent = "Vui lòng nhập username.";
    ok = false;
  } else if (u.length < 3) {
    userErr.textContent = "Username tối thiểu 3 ký tự.";
    ok = false;
  }

  if (p.length === 0) {
    passErr.textContent = "Vui lòng nhập mật khẩu.";
    ok = false;
  } else if (p.length < 4) {
    passErr.textContent = "Mật khẩu tối thiểu 4 ký tự.";
    ok = false;
  }

  return ok;
}

// Giả lập xác thực (so sánh với DEMO_USERS)
function fakeAuth(username, password) {
  return DEMO_USERS[username] && DEMO_USERS[username] === password;
}

form.addEventListener("submit", (e) => {
  e.preventDefault();
  if (!validate()) return;

  const u = userInput.value.trim();
  const p = passInput.value;

  // Lưu/clear Remember me
  if (remember.checked) {
    localStorage.setItem("remember_username", u);
  } else {
    localStorage.removeItem("remember_username");
  }

  if (fakeAuth(u, p)) {
    formMsg.style.color = "#22c55e"; // green-500
    formMsg.textContent = "Đăng nhập thành công! (demo)";
    // Ở bản demo: chỉ hiển thị thông báo. Nếu muốn chuyển trang:
    // window.location.href = "dashboard.html";
  } else {
    formMsg.style.color = "#ef4444";
    formMsg.textContent = "Sai username hoặc password.";
  }
});
