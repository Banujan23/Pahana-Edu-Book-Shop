<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8" />
    <title>Login | Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        :root{
            --ink:#0b0b0d; --ink-900:#08080a; --ash:#aeb4bd; --stroke:rgba(255,255,255,.12);
            --panel:rgba(255,255,255,.06); --crimson:#e5092a; --crimson-700:#c20824;
            --halo:0 0 0 .25rem rgba(229,9,42,.35);
        }
        html,body{
            background:
                    radial-gradient(900px 400px at 12% -10%, rgba(229,9,42,.14), transparent),
                    radial-gradient(700px 300px at 110% 0%, rgba(229,9,42,.10), transparent),
                    var(--ink);
        }
        .app-header{
            background:linear-gradient(180deg,var(--ink-900),rgba(11,11,13,.92));
            border-bottom:1px solid var(--stroke);
            backdrop-filter: blur(6px);
        }
        .brand-mark{
            display:inline-flex;width:2.5rem;height:2.5rem;border-radius:.85rem;
            align-items:center;justify-content:center;color:#fff;
            background:linear-gradient(135deg,var(--crimson),var(--crimson-700));
            box-shadow:0 10px 26px rgba(229,9,42,.35);
        }
        .nav-link{ color:var(--ash);} .nav-link:hover{ color:#fff;}

        .shell{
            background:linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.04));
            border:1px solid var(--stroke); border-radius:1.25rem;
            box-shadow:0 18px 40px rgba(0,0,0,.45);
        }
        .form-control, .input-group-text{
            background-color: rgba(255,255,255,.06);
            border-color: rgba(255,255,255,.18);
            color:#e9ecef;
        }
        .form-control:focus{ border-color:var(--crimson); box-shadow:var(--halo); }
        .btn-crimson{
            --bs-btn-bg:var(--crimson); --bs-btn-border-color:var(--crimson);
            --bs-btn-hover-bg:var(--crimson-700); --bs-btn-hover-border-color:var(--crimson-700);
            color:#fff; box-shadow:0 10px 24px rgba(229,9,42,.28);
        }
        .btn-ghost{ color:var(--crimson); border-color:var(--crimson); }
        .btn-ghost:hover{ background:var(--crimson); color:#fff; }

        footer.app-footer{ border-top:1px solid var(--stroke); background:linear-gradient(180deg, rgba(11,11,13,.92), var(--ink-900)); }
        .link-faded{ color:var(--ash); text-decoration:none; } .link-faded:hover{ color:#fff; }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<%
    String error = request.getParameter("error");
    String message = request.getParameter("message");
%>

<!-- Header -->
<header class="app-header">
    <nav class="navbar navbar-expand-lg py-3">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-3" href="#">
                <span class="brand-mark"><i class="fa-solid fa-receipt"></i></span>
                <div class="d-flex flex-column lh-sm">
                    <span class="fw-semibold text-white">Pahana Edu Billing</span>
                    <small class="text-secondary">Bookshop System</small>
                </div>
            </a>
        </div>
    </nav>
</header>

<main class="container flex-grow-1 d-flex align-items-center py-5">
    <div class="row justify-content-center w-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">

            <div class="shell overflow-hidden">
                <div class="p-4 p-md-5">
                    <div class="text-center mb-4">
                        <h1 class="h4 fw-bold mb-1">Welcome back</h1>
                        <p class="text-secondary mb-0">Sign in to continue</p>
                    </div>

                    <%-- Messages --%>
                    <%
                        if ("logout".equals(message)) {
                    %>
                    <div class="alert alert-success d-flex align-items-center" role="alert">
                        <i class="fa-solid fa-circle-check me-2"></i><div>Logout successful!</div>
                    </div>
                    <%
                    } else if (error != null) {
                    %>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="fa-solid fa-triangle-exclamation me-2"></i><div>Invalid username or password.</div>
                    </div>
                    <%
                        }
                    %>

                    <form action="login" method="post" class="needs-validation" novalidate id="loginForm">
                        <!-- Username -->
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="username" name="username" placeholder="username" required>
                            <label for="username"><i class="fa-solid fa-user me-2 text-danger"></i>Username</label>
                            <div class="invalid-feedback">Please enter your username.</div>
                        </div>

                        <!-- Password with toggle -->
                        <div class="input-group mb-3">
                            <div class="form-floating flex-grow-1">
                                <input type="password" class="form-control" id="password" name="password" placeholder="password" required>
                                <label for="password"><i class="fa-solid fa-lock me-2 text-danger"></i>Password</label>
                                <div class="invalid-feedback">Please enter your password.</div>
                            </div>
                            <button class="btn btn-outline-light" type="button" id="togglePwd" tabindex="-1" aria-label="Show password">
                                <i class="fa-solid fa-eye"></i>
                            </button>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="remember">
                                <label class="form-check-label" for="remember">Remember me</label>
                            </div>
                            <a href="help.jsp" class="link-faded text-decoration-none">Need help?</a>
                        </div>

                        <button id="submitBtn" type="submit" class="btn btn-crimson w-100 d-flex justify-content-center align-items-center gap-2">
                            <span class="btn-text">Login</span>
                            <i class="fa-solid fa-circle-notch fa-spin d-none" aria-hidden="true"></i>
                        </button>
                    </form>


                </div>
            </div>

            <p class="text-center text-secondary small mt-4 mb-0">
                &copy; 2025 Pahana Edu Bookshop System
            </p>

        </div>
    </div>
</main>

<!-- Footer -->
<footer class="app-footer mt-auto py-4">
    <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between gap-3">
        <div class="text-secondary small">
            <span class="text-white">Pahana Edu</span> · Fast, reliable billing for your bookstore
        </div>
        <div class="d-flex gap-3 small">
            <a href="#" class="link-faded"><i class="fa-solid fa-shield-halved me-1"></i> Security</a>
            <a href="help.jsp" class="link-faded"><i class="fa-solid fa-circle-question me-1"></i> Help</a>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- JS: validation, busy state, show/hide password -->
<script>
    // Validation & busy state
    (() => {
        'use strict';
        const form = document.getElementById('loginForm');
        const submitBtn = document.getElementById('submitBtn');
        const spin = submitBtn.querySelector('.fa-circle-notch');
        const btnText = submitBtn.querySelector('.btn-text');

        form.addEventListener('submit', (e) => {
            if (!form.checkValidity()) {
                e.preventDefault();
                e.stopPropagation();
            } else {
                submitBtn.disabled = true;
                spin.classList.remove('d-none');
                btnText.textContent = 'Signing in...';
            }
            form.classList.add('was-validated');
        }, false);
    })();

    // Show/hide password
    const togglePwd = document.getElementById('togglePwd');
    const pwd = document.getElementById('password');
    togglePwd.addEventListener('click', () => {
        const isText = pwd.type === 'text';
        pwd.type = isText ? 'password' : 'text';
        togglePwd.innerHTML = isText
            ? '<i class="fa-solid fa-eye"></i>'
            : '<i class="fa-solid fa-eye-slash"></i>';
        togglePwd.setAttribute('aria-label', isText ? 'Show password' : 'Hide password');
    });
</script>
</body>
</html>
