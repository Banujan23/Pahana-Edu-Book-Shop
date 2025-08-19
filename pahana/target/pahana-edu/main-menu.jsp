<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.icbt.model.User" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8" />
  <title>Pahana Edu – Main Menu</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome 6 -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <style>
    :root{
      --ink:#0b0b0d; --ink-900:#08080a; --ash:#aeb4bd; --stroke:rgba(255,255,255,.12);
      --panel:rgba(255,255,255,.06); --panel-2:rgba(255,255,255,.04);
      --crimson:#e5092a; --crimson-700:#c20824; --halo:0 0 0 .25rem rgba(229,9,42,.35);
      --sbw:280px;             /* sidebar width */
      --header-h:64px;         /* updated on load to exact header height */
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
      display:inline-flex;width:2.2rem;height:2.2rem;border-radius:.7rem;align-items:center;justify-content:center;color:#fff;
      background:linear-gradient(135deg,var(--crimson),var(--crimson-700));
      box-shadow:0 10px 26px rgba(229,9,42,.35);
    }

    /* Body layout: grid so sidebar + content share the same top line */
    .app-body{ padding:1rem; }
    @media (min-width: 992px){
      .app-body{
        display:grid;
        grid-template-columns: var(--sbw) 1fr;
        gap: 1.25rem;
      }
    }

    /* Sidebar (offcanvas acts as sticky panel on lg+) */
    .app-sidebar{
      background:linear-gradient(180deg,var(--panel),var(--panel-2));
      border:1px solid var(--stroke);
      border-radius:1rem;
    }
    .app-sidebar .nav-link{
      color:var(--ash);
      border-radius:.6rem;
      display:flex; align-items:center; gap:.6rem;
      padding:.55rem .75rem;
    }
    .app-sidebar .nav-link .fa-solid{ width:1.1rem; text-align:center; }
    .app-sidebar .nav-link:hover, .app-sidebar .nav-link.active{
      color:#fff; background:rgba(229,9,42,.16);
    }
    @media (min-width: 992px){
      .offcanvas-lg{
        position: sticky;
        top: var(--header-h);                            /* align exactly below header */
        height: calc(100vh - var(--header-h));           /* fill remaining vertical space */
        transform: none !important;
        visibility: visible !important;
      }
      .offcanvas-backdrop{ display:none; }
    }

    /* Content shell + cards */
    .shell{
      background:linear-gradient(180deg,var(--panel),var(--panel-2));
      border:1px solid var(--stroke);
      border-radius:1.25rem;
      box-shadow:0 18px 40px rgba(0,0,0,.45);
    }
    .quick-card{
      background:rgba(255,255,255,.04);
      border:1px solid var(--stroke);
      border-radius:1rem;
      padding:1rem;
      transition:transform .16s ease, border-color .16s ease, box-shadow .16s ease;
    }
    .quick-card:hover{ transform:translateY(-2px); border-color:rgba(229,9,42,.45); box-shadow:0 12px 28px rgba(0,0,0,.5); }
    .pill{
      display:inline-flex; align-items:center; gap:.4rem;
      border:1px solid var(--stroke); background:rgba(255,255,255,.06);
      color:#fff; padding:.3rem .55rem; border-radius:999px;
    }

    /* Buttons */
    .btn-crimson{
      --bs-btn-bg:var(--crimson); --bs-btn-border-color:var(--crimson);
      --bs-btn-hover-bg:var(--crimson-700); --bs-btn-hover-border-color:var(--crimson-700);
      color:#fff; box-shadow:0 10px 24px rgba(229,9,42,.28);
    }
    .btn-outline-light{ border-color:rgba(255,255,255,.35); }
    .btn:focus{ box-shadow:var(--halo); }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header class="app-header">
  <nav class="navbar navbar-expand-lg py-3" id="topbar">
    <div class="container-fluid px-3">
      <div class="d-flex align-items-center gap-2">
        <button class="btn btn-outline-light d-lg-none me-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar" aria-label="Toggle menu">
          <i class="fa-solid fa-bars"></i>
        </button>
        <a class="navbar-brand d-flex align-items-center gap-3" href="#">
          <span class="brand-mark"><i class="fa-solid fa-receipt"></i></span>
          <div class="d-flex flex-column lh-sm">
            <span class="fw-semibold text-white">Pahana Edu Billing</span>
            <small class="text-secondary">Bookshop System</small>
          </div>
        </a>
      </div>

      <div class="ms-auto d-flex align-items-center gap-3 pe-2">
        <span class="text-secondary small">
          Signed in as <strong class="text-white"><%= user.getUsername() %></strong>
        </span>
        <a class="btn btn-outline-danger" href="LogoutServlet" onclick="return confirm('Are you sure you want to logout?')">
          <i class="fa-solid fa-right-from-bracket me-1"></i> Logout
        </a>
      </div>
    </div>
  </nav>
</header>

<!-- Body: perfectly aligned grid -->
<div class="app-body container-fluid">
  <!-- Sidebar -->
  <div class="offcanvas offcanvas-start offcanvas-lg app-sidebar" tabindex="-1" id="sidebar" aria-labelledby="sidebarLabel">
    <div class="offcanvas-header d-lg-none">
      <h5 class="offcanvas-title" id="sidebarLabel">Menu</h5>
      <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body d-flex flex-column gap-3">
      <nav class="nav flex-column">
        <a class="nav-link" href="add-new-customer.jsp"><i class="fa-solid fa-user-plus"></i> Add New Customer</a>
        <a class="nav-link" href="CustomerServlet"><i class="fa-solid fa-user-pen"></i> Edit Customer</a>
        <a class="nav-link" href="ItemServlet"><i class="fa-solid fa-boxes-stacked"></i> Manage Items</a>
        <a class="nav-link" href="display-account.jsp"><i class="fa-solid fa-wallet"></i> Display Account</a>
        <a class="nav-link" href="BillServlet"><i class="fa-solid fa-receipt"></i> Print Bill</a>
        <a class="nav-link" href="help.jsp"><i class="fa-solid fa-life-ring"></i> Help</a>
      </nav>

      <div class="mt-auto small text-secondary">
        <div class="pill"><i class="fa-solid fa-circle-info"></i> Tip</div>
        <div class="mt-2">Use the sidebar to jump between tasks. On mobile, tap the menu button.</div>
      </div>
    </div>
  </div>

  <!-- Main content -->
  <main class="p-0">
    <div class="shell p-4 p-md-5 mb-4">
      <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
        <div>
          <div class="pill mb-2"><i class="fa-solid fa-rocket me-2"></i> Quick actions</div>
          <h1 class="h4 fw-bold text-white mb-1">Welcome back</h1>
          <p class="text-secondary mb-0">Choose an action to get started</p>
        </div>
        <div class="d-flex gap-2">
          <a href="BillServlet" class="btn btn-crimson"><i class="fa-solid fa-file-invoice-dollar me-2"></i>Create Bill</a>
          <a href="ItemServlet" class="btn btn-outline-light"><i class="fa-solid fa-box-open me-2"></i>Manage Items</a>
        </div>
      </div>
    </div>

    <div class="row g-3 g-lg-4">
      <div class="col-12 col-sm-6 col-xl-4">
        <a href="add-new-customer.jsp" class="text-decoration-none">
          <div class="quick-card h-100 d-flex align-items-center gap-3">
            <span class="brand-mark" style="width:2.2rem;height:2.2rem;"><i class="fa-solid fa-user-plus"></i></span>
            <div>
              <div class="text-white fw-semibold">Add New Customer</div>
              <div class="text-secondary small">Create a new customer profile.</div>
            </div>
          </div>
        </a>
      </div>

      <div class="col-12 col-sm-6 col-xl-4">
        <a href="CustomerServlet" class="text-decoration-none">
          <div class="quick-card h-100 d-flex align-items-center gap-3">
            <span class="brand-mark" style="width:2.2rem;height:2.2rem;"><i class="fa-solid fa-user-pen"></i></span>
            <div>
              <div class="text-white fw-semibold">Edit Customer</div>
              <div class="text-secondary small">Search and update customer details.</div>
            </div>
          </div>
        </a>
      </div>

      <div class="col-12 col-sm-6 col-xl-4">
        <a href="ItemServlet" class="text-decoration-none">
          <div class="quick-card h-100 d-flex align-items-center gap-3">
            <span class="brand-mark" style="width:2.2rem;height:2.2rem;"><i class="fa-solid fa-boxes-stacked"></i></span>
            <div>
              <div class="text-white fw-semibold">Manage Items</div>
              <div class="text-secondary small">Add, edit, or remove items.</div>
            </div>
          </div>
        </a>
      </div>

      <div class="col-12 col-sm-6 col-xl-4">
        <a href="display-account.jsp" class="text-decoration-none">
          <div class="quick-card h-100 d-flex align-items-center gap-3">
            <span class="brand-mark" style="width:2.2rem;height:2.2rem;"><i class="fa-solid fa-wallet"></i></span>
            <div>
              <div class="text-white fw-semibold">Display Account</div>
              <div class="text-secondary small">View account balances and history.</div>
            </div>
          </div>
        </a>
      </div>

      <div class="col-12 col-sm-6 col-xl-4">
        <a href="BillServlet" class="text-decoration-none">
          <div class="quick-card h-100 d-flex align-items-center gap-3">
            <span class="brand-mark" style="width:2.2rem;height:2.2rem;"><i class="fa-solid fa-receipt"></i></span>
            <div>
              <div class="text-white fw-semibold">Print Bill</div>
              <div class="text-secondary small">Generate and print customer bills.</div>
            </div>
          </div>
        </a>
      </div>

      <div class="col-12 col-sm-6 col-xl-4">
        <a href="help.jsp" class="text-decoration-none">
          <div class="quick-card h-100 d-flex align-items-center gap-3">
            <span class="brand-mark" style="width:2.2rem;height:2.2rem;"><i class="fa-solid fa-life-ring"></i></span>
            <div>
              <div class="text-white fw-semibold">Help</div>
              <div class="text-secondary small">Documentation and support.</div>
            </div>
          </div>
        </a>
      </div>
    </div>

    <p class="text-center text-secondary small mt-4 mb-0">
      &copy; 2025 Pahana Edu Bookshop Billing System
    </p>
  </main>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Ensure sidebar is always perfectly aligned below the header
  const header = document.getElementById('topbar');
  function setHeaderH(){
    const h = header ? header.offsetHeight : 64;
    document.documentElement.style.setProperty('--header-h', h + 'px');
  }
  window.addEventListener('load', setHeaderH);
  window.addEventListener('resize', setHeaderH);
</script>
</body>
</html>
