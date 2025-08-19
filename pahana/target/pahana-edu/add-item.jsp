<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8" />
  <title>Add New Item | Pahana Edu</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    :root{
      --pe-black: #0b0b0d;
      --pe-darker: #070709;
      --pe-red: #ef233c;          /* primary red */
      --pe-red-600:#d90429;
      --pe-red-300:#ff6b81;
      --pe-gray:#adb5bd;
      --pe-card: rgba(255,255,255,0.06);
      --pe-card-border: rgba(255,255,255,0.12);
      --pe-focus: 0 0 0 .25rem rgba(239,35,60,.35);
    }
    html, body { background: radial-gradient(1200px 600px at 20% -10%, rgba(239,35,60,.15), transparent),
    radial-gradient(1000px 500px at 120% 10%, rgba(239,35,60,.12), transparent),
    var(--pe-black); }

    .navbar {
      background: linear-gradient(180deg, var(--pe-darker), rgba(11,11,13,.85));
      border-bottom: 1px solid var(--pe-card-border);
      backdrop-filter: blur(6px);
    }
    .navbar .navbar-brand {
      letter-spacing: .3px;
    }
    .brand-badge{
      display:inline-flex; align-items:center; justify-content:center;
      width:2.25rem; height:2.25rem;
      border-radius: .75rem;
      background: linear-gradient(135deg,var(--pe-red),var(--pe-red-600));
      color:#fff;
      box-shadow: 0 8px 24px rgba(239,35,60,.35);
    }

    .card.pe-card {
      background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.04));
      border: 1px solid var(--pe-card-border);
      border-radius: 1.25rem;
      box-shadow: 0 10px 30px rgba(0,0,0,.35);
    }

    .section-title {
      border-left: 4px solid var(--pe-red);
      padding-left: .75rem;
    }

    .form-control, .form-select, .input-group-text {
      background-color: rgba(255,255,255,.06);
      border-color: rgba(255,255,255,.15);
      color: #e9ecef;
    }
    .form-control:focus, .form-select:focus {
      border-color: var(--pe-red);
      box-shadow: var(--pe-focus);
    }
    .input-group-text {
      color:#e9ecef;
      border-right: 0;
    }
    .form-text { color: var(--pe-gray); }

    .btn-pe {
      --bs-btn-bg: var(--pe-red);
      --bs-btn-border-color: var(--pe-red);
      --bs-btn-hover-bg: var(--pe-red-600);
      --bs-btn-hover-border-color: var(--pe-red-600);
      --bs-btn-active-bg: var(--pe-red-600);
      --bs-btn-active-border-color: var(--pe-red-600);
      --bs-btn-disabled-bg: #6c757d;
      --bs-btn-disabled-border-color: #6c757d;
      color: #fff;
      box-shadow: 0 8px 18px rgba(239,35,60,.25);
    }
    .btn-outline-pe {
      color: var(--pe-red);
      border-color: var(--pe-red);
    }
    .btn-outline-pe:hover { background: var(--pe-red); color:#fff; }

    .footer {
      border-top: 1px solid var(--pe-card-border);
      background: linear-gradient(180deg, rgba(11,11,13,.85), var(--pe-darker));
    }
    .link-muted { color: var(--pe-gray); text-decoration:none; }
    .link-muted:hover { color:#fff; }

    /* Subtle card float on hover */
    .pe-card:hover { transform: translateY(-2px); transition: transform .25s ease; }

    /* Improve invalid feedback visibility on dark */
    .invalid-feedback { color: #ffb3bd; }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header>
  <nav class="navbar navbar-expand-lg py-3">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center gap-3" href="main-menu.jsp">
        <span class="brand-badge"><i class="bi bi-journal-check"></i></span>
        <div class="d-flex flex-column lh-sm">
          <span class="fw-semibold">Pahana Edu Billing</span>
          <small class="text-secondary">Bookshop System</small>
        </div>
      </a>

      <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#topNav">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="topNav">
        <ul class="navbar-nav ms-auto align-items-lg-center gap-lg-2">
          <li class="nav-item">
            <a class="nav-link" href="ItemServlet"><i class="bi bi-box-seam me-1"></i> Items</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="main-menu.jsp"><i class="bi bi-grid me-1"></i> Dashboard</a>
          </li>
          <li class="nav-item ms-lg-2">
            <a class="btn btn-outline-pe btn-sm" href="logout"><i class="bi bi-box-arrow-right me-1"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<!-- Main -->
<main class="container flex-grow-1 d-flex align-items-center py-5">
  <div class="row justify-content-center w-100">
    <div class="col-12 col-md-10 col-lg-8 col-xl-7">
      <div class="card pe-card shadow-lg">
        <div class="card-body p-4 p-md-5">
          <div class="d-flex justify-content-between align-items-start mb-4">
            <div>
              <h1 class="h4 fw-bold mb-1 section-title">Add New Item</h1>
              <p class="text-secondary mb-0">Fill in the item details below. All fields are required.</p>
            </div>
            <a href="ItemServlet" class="btn btn-outline-pe btn-sm">
              <i class="bi bi-arrow-left-short me-1"></i> Back to List
            </a>
          </div>

          <form action="ItemServlet" method="post" class="needs-validation" novalidate id="addItemForm">
            <!-- Item Name -->
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="name" name="item_name" placeholder="Item Name" required>
              <label for="name"><i class="bi bi-box-seam me-1"></i> Item Name</label>
              <div class="invalid-feedback">Please enter the item name.</div>
            </div>

            <!-- Description -->
            <div class="mb-3">
              <label for="description" class="form-label"><i class="bi bi-card-text me-1"></i> Item Description</label>
              <input type="text" class="form-control" id="description" name="item_description" maxlength="120" required>
              <div class="form-text">Keep it short and clear (max 120 characters).</div>
              <div class="invalid-feedback">Please enter a short description.</div>
            </div>

            <!-- Price -->
            <div class="mb-3">
              <label for="price" class="form-label"><i class="bi bi-cash-coin me-1"></i> Price</label>
              <div class="input-group">
                <span class="input-group-text" id="price-addon">LKR</span>
                <input type="number" class="form-control" id="price" name="unit_price" step="0.01" min="0" aria-describedby="price-addon" placeholder="0.00" required>
              </div>
              <div class="form-text">Enter unit price in Sri Lankan Rupees.</div>
              <div class="invalid-feedback">Please enter a valid price (0 or more).</div>
            </div>

            <!-- Stock -->
            <div class="mb-4">
              <label for="stock" class="form-label"><i class="bi bi-123 me-1"></i> Stock Quantity</label>
              <input type="number" class="form-control" id="stock" name="stock_quantity" step="1" min="0" required>
              <div class="invalid-feedback">Please enter a valid stock quantity (0 or more).</div>
            </div>

            <!-- Actions -->
            <div class="d-grid d-sm-flex gap-2">
              <button type="submit" class="btn btn-pe w-100 d-inline-flex align-items-center justify-content-center gap-2" id="submitBtn">
                <span class="btn-text">Add Item</span>
                <span class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true"></span>
              </button>
              <button type="reset" class="btn btn-outline-pe w-100">
                <i class="bi bi-arrow-counterclockwise me-1"></i> Reset
              </button>
            </div>
          </form>

        </div>
      </div>
    </div>
  </div>
</main>

<!-- Footer -->
<footer class="footer mt-auto py-4">
  <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between gap-3">
    <div class="text-secondary small">
      &copy; 2025 <span class="text-white">Pahana Edu Bookshop System</span>. All rights reserved.
    </div>
    <div class="d-flex gap-3 small">
      <a href="main-menu.jsp" class="link-muted"><i class="bi bi-grid me-1"></i> Dashboard</a>
      <a href="ItemServlet" class="link-muted"><i class="bi bi-box-seam me-1"></i> Items</a>
      <a href="#" class="link-muted"><i class="bi bi-shield-lock me-1"></i> Privacy</a>
      <a href="#" class="link-muted"><i class="bi bi-life-preserver me-1"></i> Support</a>
    </div>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Client-side validation + busy state -->
<script>
  (() => {
    'use strict';
    const form = document.getElementById('addItemForm');
    const submitBtn = document.getElementById('submitBtn');
    const spinner = submitBtn.querySelector('.spinner-border');
    const btnText = submitBtn.querySelector('.btn-text');

    form.addEventListener('submit', (e) => {
      if (!form.checkValidity()) {
        e.preventDefault();
        e.stopPropagation();
      } else {
        submitBtn.disabled = true;
        spinner.classList.remove('d-none');
        btnText.textContent = 'Adding...';
      }
      form.classList.add('was-validated');
    }, false);
  })();
</script>
</body>
</html>
