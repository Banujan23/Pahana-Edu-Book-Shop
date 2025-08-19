<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.net.URLEncoder, com.icbt.model.Customer" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    int count = (customers != null) ? customers.size() : 0;
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8" />
    <title>Customer List | Pahana Edu</title>
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
        .badge-count{ background:linear-gradient(135deg,var(--crimson),var(--crimson-700)); }

        /* Buttons */
        .btn-crimson{ --bs-btn-bg:var(--crimson); --bs-btn-border-color:var(--crimson); --bs-btn-hover-bg:var(--crimson-700); --bs-btn-hover-border-color:var(--crimson-700); color:#fff; box-shadow:0 10px 24px rgba(229,9,42,.28); }
        .btn-ghost{ color:var(--crimson); border-color:var(--crimson); }
        .btn-ghost:hover{ background:var(--crimson); color:#fff; }
        .btn:focus{ box-shadow:var(--halo); }

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
                <span class="brand-mark"><i class="fa-solid fa-users"></i></span>
                <div class="d-flex flex-column lh-sm">
                    <span class="fw-semibold text-white">Pahana Edu Billing</span>
                    <small class="text-secondary">Bookshop System</small>
                </div>
            </a>
            <div class="ms-auto d-flex gap-2">
                <a class="btn btn-crimson" href="add-new-customer.jsp">
                    <i class="fa-solid fa-user-plus me-2"></i> Add New Customer
                </a>
            </div>
        </div>
    </nav>
</header>

<!-- Main -->
<main class="container py-5 flex-grow-1">
    <header class="d-flex flex-wrap justify-content-between align-items-center mb-3 gap-2">
        <div>
            <h1 class="h4 fw-bold mb-1 text-white">Customer List</h1>
            <div class="text-secondary">View, edit, or remove customers</div>
        </div>
        <span class="badge badge-count align-self-start">Total: <%= count %></span>
    </header>

    <!-- Filters -->
    <div class="shell mb-3">
        <div class="p-3 p-md-4">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="input-group">
                        <span class="input-group-text bg-transparent text-white"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <input id="tableSearch" type="text" class="form-control" placeholder="Search by name, account number, address, or telephone...">
                    </div>
                </div>
                <div class="col-12 col-md-6 text-md-end">
                    <a href="main-menu.jsp" class="btn btn-ghost">
                        <i class="fa-solid fa-arrow-left-long me-1"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Table / Empty state -->
    <div class="shell">
        <div class="p-0">
            <% if (customers != null && !customers.isEmpty()) { %>
            <div class="table-responsive">
                <table class="table align-middle mb-0" id="customersTable">
                    <thead>
                    <tr>
                        <th style="white-space:nowrap;">Account Number</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Telephone</th>
                        <th class="text-center" style="width: 220px;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Customer c : customers) {
                        String qName = URLEncoder.encode(c.getName() == null ? "" : c.getName(), "UTF-8");
                        String qAddr = URLEncoder.encode(c.getAddress() == null ? "" : c.getAddress(), "UTF-8");
                        String qTel  = URLEncoder.encode(c.getTelephone() == null ? "" : c.getTelephone(), "UTF-8");
                    %>
                    <tr>
                        <td><span class="text-white"><%= c.getAccountNumber() %></span></td>
                        <td><%= c.getName() %></td>
                        <td class="text-secondary"><%= c.getAddress() %></td>
                        <td><%= c.getTelephone() %></td>
                        <td class="text-center">
                            <div class="btn-group" role="group" aria-label="Actions">
                                <a class="btn btn-sm btn-outline-light"
                                   href="edit-customer.jsp?accountNumber=<%= c.getAccountNumber() %>&name=<%= qName %>&address=<%= qAddr %>&telephone=<%= qTel %>">
                                    <i class="fa-solid fa-pen-to-square me-1"></i>Edit
                                </a>
                                <a class="btn btn-sm btn-outline-danger"
                                   href="CustomerServlet?mode=delete&accountNumber=<%= c.getAccountNumber() %>"
                                   onclick="return confirm('Are you sure you want to delete this customer?');">
                                    <i class="fa-solid fa-trash-can me-1"></i>Delete
                                </a>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <% } else { %>
            <div class="p-4 p-md-5 text-center">
                <i class="fa-solid fa-people-group fa-2xl d-block mb-3"></i>
                <h2 class="h5 fw-semibold mb-1 text-white">No customers found</h2>
                <p class="text-secondary mb-3">Add your first customer to see them listed here.</p>
                <a class="btn btn-crimson" href="add-new-customer.jsp">
                    <i class="fa-solid fa-user-plus me-2"></i> Add New Customer
                </a>
            </div>
            <% } %>
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
            <a href="help.jsp" class="link-faded"><i class="fa-solid fa-circle-question me-1"></i> Help</a>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Lightweight client-side search -->
<script>
    const searchInput = document.getElementById('tableSearch');
    const table = document.getElementById('customersTable');
    if (searchInput && table) {
        const rows = () => table.querySelectorAll('tbody tr');
        searchInput.addEventListener('input', () => {
            const q = searchInput.value.trim().toLowerCase();
            rows().forEach(tr => {
                const text = tr.innerText.toLowerCase();
                tr.style.display = text.includes(q) ? '' : 'none';
            });
        });
    }
</script>
</body>
</html>
