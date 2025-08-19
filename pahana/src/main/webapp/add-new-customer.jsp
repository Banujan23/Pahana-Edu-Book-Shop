<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8" />
  <title>Add New Customer | Pahana Edu</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome 6 (NEW icon set) -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />

  <style>
    :root{
      --ink:#0b0b0d;
      --ink-900:#08080a;
      --ink-700:#141418;
      --ash:#aeb4bd;
      --snow:#f8f9fa;
      --crimson:#e5092a;         /* Primary red */
      --crimson-700:#c20824;
      --halo: 0 0 0 .25rem rgba(229,9,42,.35);
      --stroke: rgba(255,255,255,.12);
      --panel: rgba(255,255,255,.05);
    }

    html, body {
      background:
              radial-gradient(900px 400px at 10% -10%, rgba(229,9,42,.18), transparent),
              radial-gradient(700px 300px at 110% 0%, rgba(229,9,42,.13), transparent),
              var(--ink);
    }

    /* Header */
    .app-header{
      background: linear-gradient(180deg, var(--ink-900), rgba(11,11,13,.9));
      border-bottom: 1px solid var(--stroke);
      backdrop-filter: blur(6px);
    }
    .brand-mark{
      display:inline-flex; width:2.5rem; height:2.5rem; border-radius:.85rem;
      align-items:center; justify-content:center; color:#fff;
      background: linear-gradient(135deg, var(--crimson), var(--crimson-700));
      box-shadow: 0 10px 26px rgba(229,9,42,.35);
    }
    .nav-link {
      color: var(--ash);
    }
    .nav-link:hover, .nav-link:focus { color: #fff; }
    .nav-link.active{
      color:#fff; position:relative;
    }
    .nav-link.active::after{
      content:""; position:absolute; left:.25rem; right:.25rem; bottom:-.65rem; height:3px; border-radius:2px;
      background: linear-gradient(90deg, transparent, var(--crimson), transparent);
    }

    /* Shell */
    .shell{
      border: 1px solid var(--stroke);
      background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.04));
      border-radius: 1.25rem;
      overflow: hidden;
      box-shadow: 0 18px 40px rgba(0,0,0,.45);
    }

    /* Left brand panel */
    .brand-panel{
      background:
              linear-gradient(160deg, rgba(229,9,42,.12), rgba(229,9,42,.04)),
              radial-gradient(600px 300px at 80% -10%, rgba(229,9,42,.25), transparent),
              var(--ink-700);
      border-right: 1px solid var(--stroke);
      padding: 2rem;
    }
    .stat-chip{
      display:flex; align-items:center; gap:.5rem;
      padding:.5rem .75rem; border:1px solid var(--stroke); border-radius:.75rem;
      background: rgba(255,255,255,.04);
    }

    /* Form */
    .section-title{
      font-weight: 700;
      border-left: 4px solid var(--crimson);
      padding-left: .75rem;
    }
    .form-control, .form-select, .input-group-text, textarea{
      background-color: rgba(255,255,255,.06);
      border-color: rgba(255,255,255,.18);
      color:#e9ecef;
    }
    .form-control:focus, .form-select:focus, textarea:focus{
      border-color: var(--crimson);
      box-shadow: var(--halo);
    }
    .form-text{ color: var(--ash); }
    .invalid-feedback{ color: #ffb3bd; }

    /* Buttons */
    .btn-crimson{
      --bs-btn-bg: var(--crimson);
      --bs-btn-border-color: var(--crimson);
      --bs-btn-hover-bg: var(--crimson-700);
      --bs-btn-hover-border-color: var(--crimson-700);
      color:#fff;
      box-shadow: 0 10px 24px rgba(229,9,42,.28);
    }
    .btn-ghost{
      color: var(--crimson);
      border-color: var(--crimson);
    }
    .btn-ghost:hover{ background: var(--crimson); color:#fff; }

    /* Footer */
    footer.app-footer{
      border-top: 1px solid var(--stroke);
      background: linear-gradient(180deg, rgba(11,11,13,.9), var(--ink-900));
    }
    .link-faded{ color: var(--ash); text-decoration:none; }
    .link-faded:hover{ color: #fff; }

    /* Small helper */
    .hint{
      font-size: .85rem; color: var(--ash);
    }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header class="app-header">
  <nav class="navbar navbar-expand-lg py-3">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center gap-3" href="main-menu.jsp">
        <span class="brand-mark"><i class="fa-solid fa-receipt"></i></span>
        <div class="d-flex flex-column lh-sm">
          <span class="fw-semibold text-white">Pahana Edu Billing</span>
          <small class="text-secondary">Bookshop System</small>
        </div>
      </a>

      <button class="navbar-toggler border-0 text-white" type="button" data-bs-toggle="collapse" data-bs-target="#topnav">
        <i class="fa-solid fa-bars"></i>
      </button>

      <div class="collapse navbar-collapse" id="topnav">
        <ul class="navbar-nav ms-auto align-items-lg-center gap-lg-2">
          <li class="nav-item"><a class="nav-link" href="main-menu.jsp"><i class="fa-solid fa-grid-2 me-1"></i> Dashboard</a></li>
          <li class="nav-item"><a class="nav-link active" href="show-customer.jsp"><i class="fa-solid fa-users me-1"></i> Customers</a></li>
          <li class="nav-item"><a class="nav-link" href="ItemServlet"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a></li>
          <li class="nav-item ms-lg-2"><a class="btn btn-ghost btn-sm" href="logout"><i class="fa-solid fa-right-from-bracket me-1"></i> Logout</a></li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<!-- Main -->
<main class="container flex-grow-1 py-5">
  <div class="row justify-content-center">
    <div class="col-12 col-xl-10">
      <div class="shell row g-0">
        <!-- Left brand/summary panel -->
        <aside class="col-12 col-lg-5 brand-panel d-flex flex-column justify-content-between">
          <div>
            <div class="d-flex align-items-center gap-3 mb-3">
              <span class="brand-mark" style="width:2.25rem;height:2.25rem;"><i class="fa-solid fa-user-plus"></i></span>
              <div>
                <h2 class="h5 text-white mb-0">Add New Customer</h2>
                <span class="hint">Quick registration in just a minute</span>
              </div>
            </div>

            <p class="text-secondary mb-4">
              Keep customer information clear and concise. A valid name and address are required.
              Telephone is optional, but helps for quick notifications.
            </p>

            <div class="d-flex flex-wrap gap-2">
              <div class="stat-chip"><i class="fa-solid fa-shield-halved"></i><span class="hint">Validated inputs</span></div>
              <div class="stat-chip"><i class="fa-solid fa-bolt"></i><span class="hint">Fast submit</span></div>
              <div class="stat-chip"><i class="fa-solid fa-lock"></i><span class="hint">Secure</span></div>
            </div>
          </div>

          <div class="mt-4">
            <div class="d-flex align-items-center gap-2">
              <i class="fa-solid fa-circle-info text-white-50"></i>
              <span class="hint">Fields marked required must be completed before saving.</span>
            </div>
          </div>
        </aside>

        <!-- Right form panel -->
        <section class="col-12 col-lg-7 p-4 p-md-5">
          <div class="mb-4">
            <h3 class="h6 text-uppercase text-secondary mb-1">Customer details</h3>
            <h2 class="section-title h5 mb-0">Registration Form</h2>
          </div>

          <form action="CustomerServlet" method="post" class="needs-validation" novalidate id="addCustomerForm">
            <!-- Name -->
            <div class="mb-3">
              <label for="name" class="form-label fw-semibold"><i class="fa-solid fa-user me-2 text-danger"></i>Name</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="Ex: Nimal Perera" required>
              <div class="invalid-feedback">Please enter the customer's name.</div>
            </div>

            <!-- Address -->
            <div class="mb-3">
              <label for="address" class="form-label fw-semibold"><i class="fa-solid fa-location-dot me-2 text-danger"></i>Address</label>
              <textarea id="address" name="address" class="form-control" rows="3" placeholder="Street, City, Postal Code" required></textarea>
              <div class="form-text">Provide enough detail for delivery or contact purposes.</div>
              <div class="invalid-feedback">Please provide the address.</div>
            </div>

            <!-- Telephone -->
            <div class="mb-4">
              <label for="telephone" class="form-label fw-semibold"><i class="fa-solid fa-phone me-2 text-danger"></i>Telephone <span class="text-secondary">(optional)</span></label>
              <div class="input-group">
                <span class="input-group-text">+94</span>
                <input
                        type="text"
                        class="form-control"
                        id="telephone"
                        name="telephone"
                        placeholder="7XXXXXXXX"
                        inputmode="numeric"
                        pattern="^[7][0-9]{8}$"
                        aria-describedby="telHelp">
              </div>
              <div id="telHelp" class="form-text">Sri Lanka mobile format: starts with 7 and has 9 digits (e.g., <code>771234567</code>).</div>
              <div class="invalid-feedback">Enter a valid SL mobile number (e.g., 771234567) or leave it blank.</div>
            </div>

            <!-- Actions -->
            <div class="d-grid d-sm-flex gap-2">
              <button type="submit" class="btn btn-crimson w-100 d-inline-flex align-items-center justify-content-center gap-2" id="submitBtn">
                <i class="fa-solid fa-floppy-disk"></i>
                <span class="btn-text">Register Customer</span>
                <i class="fa-solid fa-circle-notch fa-spin d-none" id="btnSpinner" aria-hidden="true"></i>
              </button>
              <a href="show-customer.jsp" class="btn btn-outline-light w-100">
                <i class="fa-solid fa-arrow-left-long me-1"></i> Back to List
              </a>
            </div>
          </form>
        </section>
      </div>

      <!-- Secondary links -->
      <div class="d-flex flex-column flex-sm-row gap-2 justify-content-between mt-3">
        <a href="main-menu.jsp" class="link-faded"><i class="fa-solid fa-house me-1"></i> Back to Home</a>
        <span class="hint">&copy; 2025 Pahana Edu Bookshop System</span>
      </div>
    </div>
  </div>
</main>

<!-- Footer -->
<footer class="app-footer mt-auto py-4">
  <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between gap-3">
    <div class="text-secondary small">
      <span class="text-white">Pahana Edu</span> · Billing Platform — Crafted for speed & reliability
    </div>
    <div class="d-flex gap-3 small">
      <a href="show-customer.jsp" class="link-faded"><i class="fa-solid fa-users me-1"></i> Customers</a>
      <a href="ItemServlet" class="link-faded"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a>
      <a href="#" class="link-faded"><i class="fa-solid fa-shield-halved me-1"></i> Privacy</a>
      <a href="#" class="link-faded"><i class="fa-solid fa-life-ring me-1"></i> Support</a>
    </div>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Client-side validation + busy state -->
<script>
  (() => {
    'use strict';
    const form = document.getElementById('addCustomerForm');
    const submitBtn = document.getElementById('submitBtn');
    const spinner = document.getElementById('btnSpinner');
    const btnTextSpan = submitBtn.querySelector('.btn-text');

    form.addEventListener('submit', (e) => {
      if (!form.checkValidity()) {
        e.preventDefault();
        e.stopPropagation();
      } else {
        submitBtn.disabled = true;
        spinner.classList.remove('d-none');
        btnTextSpan.textContent = 'Saving...';
      }
      form.classList.add('was-validated');
    }, false);
  })();
</script>
</body>
</html>
