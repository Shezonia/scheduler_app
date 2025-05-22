document.addEventListener("DOMContentLoaded", () => {
  const baseURL = "http://localhost:3000";
  const signupURL = `${baseURL}/signup`;
  const loginURL = `${baseURL}/login`;
  const spinner = document.getElementById("spinner");

  // Signup form submission
  const signupForm = document.getElementById("SignupForm");
  signupForm.addEventListener("submit", async (e) => {
  e.preventDefault();
  spinner.style.display = "flex";

  const password = document.getElementById("password").value;
  const confirmPassword = document.getElementById("cnfpass").value;

  if (password !== confirmPassword) {
    swal("Check Password!", "Passwords don't match", "warning");
    spinner.style.display = "none";
    return;
  }

  const userDetails = {
    user: {
      name: SignupForm.name.value.trim(),
      email: SignupForm.email.value.trim(),
      password: password,
      password_confirmation: confirmPassword
    }
  };

  console.log("Sending signup request with data:", userDetails);

  try {
    const res = await fetch(signupURL, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(userDetails),
    });

    console.log("Received response status:", res.status);

    if (res.ok) {
      const data = await res.json();
      console.log("Signup success response data:", data);
      swal("Signup Successful", "Please Login", "success");
      SignupForm.reset();
    } else {
      const errData = await res.json().catch(() => ({}));
      console.error("Signup failed response data:", errData);
      swal("Signup Failed", errData.message || "Bad request", "error");
    }
  } catch (error) {
    console.error("Fetch signup error:", error);
    swal("Error", "Something went wrong", "error");
  } finally {
    spinner.style.display = "none";
  }
});


  // Login form submission
  const loginForm = document.getElementById("LoginForm");
  loginForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    spinner.style.display = "flex";

    const loginDetails = {
      email: loginForm.login_email.value.trim(),
      password: loginForm.login_pass.value,
    };

    try {
      const res = await fetch(loginURL, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(loginDetails),
      });

      if (res.ok) {
        const data = await res.json();
        swal("Login Successful", "Redirecting to Dashboard...", "success");

        localStorage.setItem("username", data.user.name);
        localStorage.setItem("useremail", data.user.email);

        setTimeout(() => {
          window.location.href = "Dashboard.html";
        }, 1000);
      } else {
        const errData = await res.json();
        swal("Login Failed", errData.message || "Invalid credentials", "error");
      }
    } catch (error) {
      swal("Error", "Something went wrong", "error");
      console.error("Login error:", error);
    } finally {
      spinner.style.display = "none";
    }
  });
});
