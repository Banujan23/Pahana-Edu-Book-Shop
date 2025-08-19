<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.*, com.icbt.model.Bill" %>
<%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
    int count = (bills != null) ? bills.size() : 0;
    DecimalFormat money = new DecimalFormat("#,##0.00");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8" />
    <title>All Bills | Pahana Edu</title>
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
            border-bottom:1px solid var(--stroke); backdrop-filter:blur(6px);
        }
        .brand-mark{
            display:inline-flex;width:2.5rem;height:2.5rem;border-radius:.85rem;
            align-items:center;justify-content:center;color:#fff;
            background:linear-gradient(135deg,var(--crimson),var(--crimson-700));
            box-shadow:0 10px 26px rgba(229,9,42,.35);
        }
        .nav-link{ color:var(--ash);} .nav-link:hover{ color:#fff;}

        /* Shell */
        .list-shell{
            background:linear-gradient(180deg,rgba(255,255,255,.06),rgba(255,255,255,.04));
            border:1px solid var(--stroke); border-radius:1.25rem;
            box-shadow:0 18px 40px rgba(0,0,0,.45);
        }
        .section-title{ border-left:4px solid var(--crimson); padding-left:.75rem; font-weight:700; }

        /* Controls */
        .input-group-text, .form-control{
            background-color:rgba(255,255,255,.06);
            border-color:rgba(255,255,255,.18);
            color:#e9ecef;
        }
        .form-control:focus{ border-color:var(--crimson); box-shadow:var(--halo); }

        /* Table */
        .table thead th{ border-bottom:1px solid var(--stroke)!important; background:rgba(255,255,255,.04); }
        .table tbody td, .table tfoot th{ border-top:1px solid var(--stroke)!important; }
        .badge-count{ background:linear-gradient(135deg,var(--crimson),var(--crimson-700)); }

        /* Buttons */
        .btn-crimson{
            --bs-btn-bg:var(--crimson); --bs-btn-border-color:var(--crimson);
            --bs-btn-hover-bg:var(--crimson-700); --bs-btn-hover-border-color:var(--crimson-700);
            color:#fff; box-shadow:0 10px 24px rgba(229,9,42,.28);
        }
        .btn-ghost{ color:var(--crimson); border-color:var(--crimson); }
        .btn-ghost:hover{ background:var(--crimson); color:#fff; }

        /* Footer */
        footer.app-footer{ border-top:1px solid var(--stroke); background:linear-gradient(180deg,rgba(11,11,13,.92),var(--ink-900)); }
        .link-faded{ color:var(--ash); text-decoration:none;} .link-faded:hover{ color:#fff;}

        @media print{
            .no-print{ display:none !important; }
            body{ background:#fff !important; }
            .list-shell{ border:0; box-shadow:none; border-radius:0; }
            .app-header, .app-footer{ display:none !important; }
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header class="app-header no-print">
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
                    <li class="nav-item"><a class="nav-link" href="main-menu.jsp"><i class="fa-solid fa-house me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="ItemServlet"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a></li>
                    <li class="nav-item ms-lg-2">
                        <a class="btn btn-crimson btn-sm" href="BillServlet?action=new"><i class="fa-solid fa-plus me-1"></i> New Bill</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Main -->
<main class="container py-4 flex-grow-1">
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3 gap-2">
        <div>
            <h1 class="h4 fw-bold mb-1 section-title">Bill List</h1>
            <div class="text-secondary">Manage all generated bills</div>
        </div>
        <span class="badge badge-count align-self-start">Total: <%= count %></span>
    </div>

    <!-- Filters / Actions -->
    <div class="list-shell mb-3 no-print">
        <div class="p-3 p-md-4">
            <div class="row g-2 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <input id="tableSearch" type="text" class="form-control" placeholder="Search by Bill ID, Account Number...">
                    </div>
                </div>
                <div class="col-12 col-md-6 d-flex justify-content-md-end gap-2">
                    <button class="btn btn-outline-light" id="exportCsvBtn">
                        <i class="fa-solid fa-file-arrow-down me-1"></i> Export CSV
                    </button>
                    <a class="btn btn-crimson" href="BillServlet?action=new">
                        <i class="fa-solid fa-plus me-1"></i> Create New Bill
                    </a>
                    <a href="main-menu.jsp" class="btn btn-ghost">
                        <i class="fa-solid fa-arrow-left-long me-1"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Table / Empty state -->
    <div class="list-shell">
        <div class="p-0">
            <% if (bills != null && !bills.isEmpty()) { %>
            <div class="table-responsive">
                <table class="table align-middle mb-0" id="billsTable">
                    <thead>
                    <tr>
                        <th>Bill ID</th>
                        <th>Account Number</th>
                        <th class="text-end">Total Amount (LKR)</th>
                        <th>Bill Date</th>
                        <th class="text-center" style="width: 260px;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Bill bill : bills) {
                        String dateStr = (bill.getBillDate() != null) ? sdf.format(bill.getBillDate()) : "-";
                    %>
                    <tr>
                        <td><%= bill.getBillId() %></td>
                        <td><%= bill.getAccountNumber() %></td>
                        <td class="text-end"><%= money.format(bill.getTotalAmount()) %></td>
                        <td><%= dateStr %></td>
                        <td class="text-center">
                            <div class="btn-group" role="group" aria-label="Actions">
                                <a class="btn btn-sm btn-outline-light"
                                   href="BillServlet?action=view&id=<%= bill.getBillId() %>">
                                    <i class="fa-solid fa-eye me-1"></i>View
                                </a>
                                <a class="btn btn-sm btn-outline-warning"
                                   href="BillServlet?action=edit&id=<%= bill.getBillId() %>&accountNumber=<%= bill.getAccountNumber() %>&totalAmount=<%= bill.getTotalAmount() %>&billDate=<%= bill.getBillDate() %>">
                                    <i class="fa-solid fa-pen-to-square me-1"></i>Edit
                                </a>
                                <a class="btn btn-sm btn-outline-danger"
                                   href="BillServlet?action=delete&id=<%= bill.getBillId() %>"
                                   onclick="return confirm('Are you sure you want to delete this bill?');">
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
                <i class="fa-solid fa-receipt fs-1 d-block mb-2"></i>
                <h2 class="h5 fw-semibold mb-1">No bills available</h2>
                <p class="text-secondary mb-3">Create your first bill to see it listed here.</p>
                <a class="btn btn-crimson" href="BillServlet?action=new">
                    <i class="fa-solid fa-plus me-1"></i> Create New Bill
                </a>
            </div>
            <% } %>
        </div>
    </div>

    <p class="text-center text-secondary small mt-4 mb-0 no-print">
        &copy; 2025 Pahana Edu Bookshop System
    </p>
</main>

<!-- Footer -->
<footer class="app-footer mt-auto py-4 no-print">
    <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between gap-3">
        <div class="text-secondary small">
            <span class="text-white">Pahana Edu</span> · Fast, reliable billing for your bookstore
        </div>
        <div class="d-flex gap-3 small">
            <a href="main-menu.jsp" class="link-faded"><i class="fa-solid fa-house me-1"></i> Home</a>
            <a href="show-customer.jsp" class="link-faded"><i class="fa-solid fa-users me-1"></i> Customers</a>
            <a href="ItemServlet" class="link-faded"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a>
            <a href="#" class="link-faded"><i class="fa-solid fa-shield-halved me-1"></i> Privacy</a>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


<script>
    (function(){
        const searchInput = document.getElementById('tableSearch');
        const table = document.getElementById('billsTable');

        if (searchInput && table) {
            const rows = function(){ return table.querySelectorAll('tbody tr'); };
            searchInput.addEventListener('input', function () {
                const q = searchInput.value.trim().toLowerCase();
                rows().forEach(function(tr){
                    const text = tr.innerText.toLowerCase();
                    tr.style.display = text.includes(q) ? '' : 'none';
                });
            });
        }

        const exportBtn = document.getElementById('exportCsvBtn');
        if (exportBtn && table) {
            exportBtn.addEventListener('click', function () {
                var trList = Array.from(table.querySelectorAll('tr'));
                var csv = trList.map(function(tr){
                    var cells = Array.from(tr.querySelectorAll('th,td')).slice(0,4); // exclude actions col
                    return cells.map(function(td){
                        var txt = (td.textContent || '');
                        return '"' + txt.replace(/"/g, '""') + '"';
                    }).join(',');
                }).join('\n');

                var blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
                var url = URL.createObjectURL(blob);
                var a = document.createElement('a');
                a.href = url; a.download = 'bills.csv';
                document.body.appendChild(a); a.click();
                document.body.removeChild(a); URL.revokeObjectURL(url);
            });
        }
    })();
</script>
</body>
</html>
