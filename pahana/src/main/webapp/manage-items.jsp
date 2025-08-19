<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.icbt.model.Item" %>
<%
  List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8" />
  <title>Items List | Pahana Edu</title>
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
    }
    html,body{
      background:
              radial-gradient(900px 400px at 12% -10%, rgba(229,9,42,.14), transparent),
              radial-gradient(700px 300px at 110% 0%, rgba(229,9,42,.10), transparent),
              var(--ink);
    }

    /* Header */
    .app-header{ background:linear-gradient(180deg,var(--ink-900),rgba(11,11,13,.92)); border-bottom:1px solid var(--stroke); backdrop-filter: blur(6px); }
    .brand-mark{
      display:inline-flex;width:2.5rem;height:2.5rem;border-radius:.85rem;align-items:center;justify-content:center;color:#fff;
      background:linear-gradient(135deg,var(--crimson),var(--crimson-700)); box-shadow:0 10px 26px rgba(229,9,42,.35);
    }
    .nav-link{ color:var(--ash);} .nav-link:hover{ color:#fff;}

    /* Shell / table */
    .shell{ background:linear-gradient(180deg,var(--panel),var(--panel-2)); border:1px solid var(--stroke); border-radius:1.25rem; box-shadow:0 18px 40px rgba(0,0,0,.45); }
    .table thead th{ background:rgba(255,255,255,.04); border-bottom:1px solid var(--stroke)!important; }
    .table tbody td, .table tfoot th{ border-top:1px solid var(--stroke)!important; }
    .table td, .table th{ vertical-align:middle; }
    .money, .qty{ font-variant-numeric: tabular-nums; }

    /* Buttons */
    .btn-crimson{ --bs-btn-bg:var(--crimson); --bs-btn-border-color:var(--crimson); --bs-btn-hover-bg:var(--crimson-700); --bs-btn-hover-border-color:var(--crimson-700); color:#fff; box-shadow:0 10px 24px rgba(229,9,42,.28); }

    /* Footer */
    footer.app-footer{ border-top:1px solid var(--stroke); background:linear-gradient(180deg, rgba(11,11,13,.92), var(--ink-900)); }
    .link-faded{ color:var(--ash); text-decoration:none; } .link-faded:hover{ color:#fff; }

    /* Focus */
    .btn:focus{ box-shadow:var(--halo); }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header class="app-header">
  <nav class="navbar navbar-expand-lg py-3">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center gap-3" href="main-menu.jsp">
        <span class="brand-mark"><i class="fa-solid fa-boxes-stacked"></i></span>
        <div class="d-flex flex-column lh-sm">
          <span class="fw-semibold text-white">Pahana Edu Billing</span>
          <small class="text-secondary">Bookshop System</small>
        </div>
      </a>

      <div class="ms-auto">
        <a class="btn btn-crimson" href="add-item.jsp">
          <i class="fa-solid fa-plus me-2"></i> Add New Item
        </a>
      </div>
    </div>
  </nav>
</header>

<!-- Main -->
<main class="container py-5 flex-grow-1">
  <header class="text-center mb-4">
    <h1 class="h4 fw-bold mb-1 text-white">Item List</h1>
    <p class="text-secondary mb-0">View, edit, and manage items</p>
  </header>

  <div class="shell">
    <div class="p-3 p-md-0">
      <div class="table-responsive">
        <table class="table align-middle mb-0">
          <thead>
          <tr>
            <th>Item Code</th>
            <th>Name</th>
            <th>Description</th>
            <th class="text-end">Price (LKR)</th>
            <th class="text-end">Stock</th>
            <th class="text-center" style="width: 220px;">Actions</th>
          </tr>
          </thead>
          <tbody>
          <% if (items != null && !items.isEmpty()) {
            for (Item item : items) { %>
          <tr>
            <td><span class="text-white"><%= item.getItem_id() %></span></td>
            <td><%= item.getItem_name() %></td>
            <td class="text-secondary"><%= item.getItem_description() %></td>
            <td class="text-end money"><%= item.getUnit_price() %></td>
            <td class="text-end qty"><%= item.getStock_quantity() %></td>
            <td class="text-center">
              <div class="btn-group" role="group" aria-label="Actions">
                <!-- Keep original query params exactly (design change only) -->
                <a class="btn btn-sm btn-outline-light"
                   href="edit-item.jsp?item_id=<%= item.getItem_id() %>&item_name=<%= item.getItem_name() %>&item_description=<%= item.getItem_description() %>&unit_price=<%= item.getUnit_price() %>&stock_quantity=<%= item.getStock_quantity() %>">
                  <i class="fa-solid fa-pen-to-square me-1"></i>Edit
                </a>
                <a class="btn btn-sm btn-outline-danger"
                   href="ItemServlet?action=delete&id=<%= item.getItem_id() %>"
                   onclick="return confirm('Are you sure you want to delete this item?');">
                  <i class="fa-solid fa-trash-can me-1"></i>Delete
                </a>
              </div>
            </td>
          </tr>
          <% } } else { %>
          <tr>
            <td colspan="6" class="text-center py-4 text-secondary">No items available.</td>
          </tr>
          <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <div class="text-center mt-4">
    <a href="main-menu.jsp" class="btn btn-outline-light">
      <i class="fa-solid fa-arrow-left-long me-1"></i> Back to Home
    </a>
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
      <a href="help.jsp" class="link-faded"><i class="fa-solid fa-circle-question me-1"></i> Help</a>
    </div>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
