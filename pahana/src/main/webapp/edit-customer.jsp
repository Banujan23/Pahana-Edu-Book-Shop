<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String accountNumber = request.getParameter("accountNumber");
  String name = request.getParameter("name");
  String address = request.getParameter("address");
  String telephone = request.getParameter("telephone");
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8" />
  <title>Edit Customer | Pahana Edu</title>
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

    /* Header */
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

    /* Card shell */
    .shell{
      background:linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.04));
      border:1px solid var(--stroke); border-radius:1.25rem;
      box-shadow:0 18px 40px rgba(0,0,0,.45);
    }
    .section-title{ border-left:4px solid var(--crimson); padding-left:.75rem; font-weight:700; }

    /* Controls */
    .form-label i{ color:var(--crimson); }
    .form-control, .input-group-text, textarea{
      background-color: rgba(255,255,255,.06);
      border-color: rgba(255,255,255,.18);
      color:#e9ecef;
    }
    .form-control:focus, textarea:focus{
      border-color: var(--crimson);
      box-shadow: var(--halo);
    }
    .invalid-feedback{ color:#ffb3bd; }
    .form-text{ color:var(--ash); }

    /* Buttons */
    .btn-crimson{
      --bs-btn-bg: var(--crimson); --bs-btn-border-color: var(--crimson);
      --bs-btn-hover-bg: var(--crimson-700); --bs-btn-hover-border-color: var(--crimson-700);
      color:#fff; box-shadow:0 10px 24px rgba(229,9,42,.28);
    }
    .btn-ghost{ color:var(--crimson); border-color:var(--crimson); }
    .btn-ghost:hover{ background:var(--crimson); color:#fff; }

    /* Footer */
    footer.app-footer{ border-top:1px solid var(--stroke); background:linear-gradient(180deg, rgba(11,11,13,.92), var(--ink-900)); }
    .link-faded{ color:var(--ash); text-decoration:none; } .link-faded:hover{ color:#fff; }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header class="app-header">
  <nav class="navbar navbar-expand-lg py-3">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center gap-3" href="main-menu.jsp">
        <span class="brand-mark"><i class="fa-solid fa-user-pen"></i></span>
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
          <li class="nav-item"><a class="nav-link" href="CustomerServlet"><i class="fa-solid fa-users me-1"></i> Customers</a></li>
          <li class="nav-item"><a class="nav-link" href="ItemServlet"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a></li>
          <li class="nav-item"><a class="nav-link" href="BillServlet"><i class="fa-solid fa-list me-1"></i> Bills</a></li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<!-- Main -->
<main class="container flex-grow-1 d-flex align-items-center py-5">
  <div class="row justify-content-center w-100">
    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
      <div class="shell">
        <div class="p-4 p-md-5">
          <div class="text-center mb-4">
            <h1 class="h4 fw-bold mb-1 section-title d-inline-block">Edit Customer</h1>
            <p class="text-secondary mb-0">Update details or delete this customer</p>
          </div>

          <form action="CustomerServlet" method="post" class="needs-validation" novalidate id="editCustomerForm">
            <!-- Keep account number hidden for submission -->
            <input type="hidden" name="accountNumber" value="<%= accountNumber != null ? accountNumber : "" %>">

            <!-- Display account number (read-only) -->
            <div class="mb-3">
              <label class="form-label fw-semibold"><i class="fa-solid fa-hashtag me-2"></i>Account Number</label>
              <input type="text" class="form-control" value="<%= accountNumber != null ? accountNumber : "" %>" disabled>
            </div>

            <!-- Name -->
            <div class="mb-3">
              <label for="name" class="form-label fw-semibold"><i class="fa-solid fa-user me-2"></i>Name</label>
              <input type="text" class="form-control" id="name" name="name"
                     placeholder="Customer name" value="<%= name != null ? name : "" %>" required>
              <div class="invalid-feedback">Please enter the customer's name.</div>
            </div>

            <!-- Address -->
            <div class="mb-3">
              <label for="address" class="form-label fw-semibold"><i class="fa-solid fa-location-dot me-2"></i>Address</label>
              <textarea id="address" name="address" class="form-control" rows="3" required><%= address != null ? address : "" %></textarea>
              <div class="invalid-feedback">Please provide the customer's address.</div>
            </div>

            <!-- Telephone (optional) -->
            <div class="mb-4">
              <label for="telephone" class="form-label fw-semibold"><i class="fa-solid fa-phone me-2"></i>Telephone <span class="text-secondary">(optional)</span></label>
              <div class="input-group">
                <span class="input-group-text">+94</span>
                <input type="text" class="form-control" id="telephone" name="telephone"
                       inputmode="tel" placeholder="7XXXXXXXX"
                       value="<%= telephone != null ? telephone : "" %>">
              </div>
              <div class="form-text">Example: 771234567</div>
            </div>

            <!-- Actions -->
            <div class="d-flex gap-2">
              <button type="submit" class="btn btn-crimson flex-fill d-flex justify-content-center align-items-center gap-2" id="updateBtn">
                <i class="fa-solid fa-floppy-disk"></i>
                <span class="btn-text">Update</span>
                <i class="fa-solid fa-circle-notch fa-spin d-none" aria-hidden="true"></i>
              </button>

              <button type="submit" name="delete" value="true"
                      class="btn btn-outline-danger flex-fill d-flex justify-content-center align-items-center gap-2"
                      id="deleteBtn"
                      onclick="return confirm('Are you sure you want to delete this customer?');">
                <i class="fa-solid fa-trash-can"></i>
                <span class="btn-text">Delete</span>
                <i class="fa-solid fa-circle-notch fa-spin d-none" aria-hidden="true"></i>
              </button>
            </div>

            <div class="mt-3">
              <a href="CustomerServlet" class="btn btn-ghost w-100">
                <i class="fa-solid fa-arrow-left-long me-1"></i> Back to Customer List
              </a>
            </div>
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
      <a href="main-menu.jsp" class="link-faded"><i class="fa-solid fa-house me-1"></i> Home</a>
      <a href="CustomerServlet" class="link-faded"><i class="fa-solid fa-users me-1"></i> Customers</a>
      <a href="ItemServlet" class="link-faded"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a>
      <a href="BillServlet" class="link-faded"><i class="fa-solid fa-list me-1"></i> Bills</a>
    </div>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Client-side validation & busy-state handling -->
<script>
  (() => {
    'use strict';
    const form = document.getElementById('editCustomerForm');
    const updateBtn = document.getElementById('updateBtn');
    const deleteBtn = document.getElementById('deleteBtn');

    form.addEventListener('submit', (e) => {
      if (!form.checkValidity()) {
        e.preventDefault();
        e.stopPropagation();
        form.classList.add('was-validated');
        return;
      }
      // Determine which button submitted
      const clicked = document.activeElement && document.activeElement.closest('button[type="submit"]');
      const targetBtn = clicked || updateBtn;

      // Busy state on the clicked button
      targetBtn.disabled = true;
      const spin = targetBtn.querySelector('.fa-circle-notch');
      const text = targetBtn.querySelector('.btn-text');
      if (spin) spin.classList.remove('d-none');
      if (text) text.textContent = (targetBtn === deleteBtn) ? 'Deleting...' : 'Updating...';

      // Prevent double submit: disable the other button too
      (targetBtn === updateBtn ? deleteBtn : updateBtn).disabled = true;
    }, false);
  })();
</script>
</body>
</html>
