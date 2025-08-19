<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.*, com.icbt.model.Bill, com.icbt.model.BillItem, com.icbt.model.Customer, com.icbt.model.Item" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
    List<BillItem> billItems = (List<BillItem>) request.getAttribute("billItems");
    Customer customer = (Customer) request.getAttribute("customer");
    List<Item> items = (List<Item>) request.getAttribute("items");

    Map<Integer, Item> itemById = new HashMap<>();
    if (items != null) for (Item it : items) itemById.put(it.getItem_id(), it);

    DecimalFormat money = new DecimalFormat("#,##0.00");
    String billDateStr = (bill != null && bill.getBillDate() != null)
            ? new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(bill.getBillDate())
            : "";
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8" />
    <title>Bill Summary | Pahana Edu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome (icons, no Bootstrap Icons) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        :root{
            --ink:#0b0b0d;
            --ink-900:#08080a;
            --ash:#aeb4bd;
            --stroke:rgba(255,255,255,.12);
            --panel:rgba(255,255,255,.06);
            --crimson:#e5092a;
            --crimson-700:#c20824;
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
            background: linear-gradient(180deg, var(--ink-900), rgba(11,11,13,.92));
            border-bottom:1px solid var(--stroke);
            backdrop-filter: blur(6px);
        }
        .brand-mark{
            display:inline-flex;width:2.5rem;height:2.5rem;border-radius:.85rem;
            align-items:center;justify-content:center;color:#fff;
            background: linear-gradient(135deg, var(--crimson), var(--crimson-700));
            box-shadow: 0 10px 26px rgba(229,9,42,.35);
        }
        .nav-link{ color: var(--ash); }
        .nav-link:hover{ color:#fff; }

        /* Card (bill) */
        .bill-shell{
            background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.04));
            border:1px solid var(--stroke);
            border-radius:1.25rem;
            box-shadow: 0 18px 40px rgba(0,0,0,.45);
        }
        .section-title{
            border-left:4px solid var(--crimson);
            padding-left:.75rem;
            font-weight:700;
        }

        /* Table */
        .table thead th{
            border-bottom:1px solid var(--stroke)!important;
            background: rgba(255,255,255,.04);
        }
        .table tbody td, .table tfoot th{
            border-top:1px solid var(--stroke)!important;
        }
        .badge-live{
            background: linear-gradient(135deg, var(--crimson), var(--crimson-700));
        }

        /* Buttons */
        .btn-crimson{
            --bs-btn-bg: var(--crimson);
            --bs-btn-border-color: var(--crimson);
            --bs-btn-hover-bg: var(--crimson-700);
            --bs-btn-hover-border-color: var(--crimson-700);
            color:#fff; box-shadow:0 10px 24px rgba(229,9,42,.28);
        }
        .btn-ghost{
            color: var(--crimson); border-color: var(--crimson);
        }
        .btn-ghost:hover{ background: var(--crimson); color:#fff; }

        /* Footer */
        footer.app-footer{
            border-top:1px solid var(--stroke);
            background: linear-gradient(180deg, rgba(11,11,13,.92), var(--ink-900));
        }
        .link-faded{ color: var(--ash); text-decoration:none; }
        .link-faded:hover{ color:#fff; }

        /* Print styles */
        @media print{
            .no-print{ display:none !important; }
            body{ background:#fff !important; }
            .bill-shell{ border:0; box-shadow:none; border-radius:0; }
            .app-header, .app-footer{ display:none !important; }
            .table thead th{ -webkit-print-color-adjust:exact; print-color-adjust:exact; }
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header class="app-header no-print">
    <nav class="navbar navbar-expand-lg py-3">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-3" href="main-menu.jsp">
                <span class="brand-mark"><i class="fa-solid fa-file-invoice-dollar"></i></span>
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
                    <li class="nav-item"><a class="nav-link" href="BillServlet"><i class="fa-solid fa-calculator me-1"></i> Billing</a></li>
                    <li class="nav-item"><a class="nav-link" href="ItemServlet"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a></li>
                    <li class="nav-item ms-lg-2">
                        <button class="btn btn-crimson btn-sm" onclick="window.print()"><i class="fa-solid fa-print me-1"></i> Print / Save PDF</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Main -->
<main class="container py-4 flex-grow-1">
    <div class="bill-shell" id="billArea">
        <div class="p-4 p-md-5">
            <!-- Header Row -->
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start gap-3">
                <div>
                    <h1 class="h4 fw-bold mb-1 section-title">Bill Statement</h1>
                    <div class="text-secondary">Pahana Edu · Billing Platform</div>
                </div>
                <div class="text-md-end">
                    <div class="fw-semibold">Bill # <%= (bill != null ? bill.getBillId() : "") %></div>
                    <div class="text-secondary">Date: <%= billDateStr %></div>
                </div>
            </div>

            <hr class="my-4" style="border-color:var(--stroke)">

            <!-- Meta -->
            <div class="row g-3">
                <div class="col-12 col-md-6">
                    <div class="border rounded-3 p-3" style="border-color:var(--stroke)!important;">
                        <div class="fw-semibold mb-1"><i class="fa-solid fa-user me-2 text-danger"></i>Billed To</div>
                        <div><%= (customer != null ? customer.getName() : "") %></div>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="border rounded-3 p-3 h-100" style="border-color:var(--stroke)!important;">
                        <div class="fw-semibold mb-1"><i class="fa-solid fa-circle-info me-2 text-danger"></i>Bill Details</div>
                        <div>Reference: <span class="text-secondary"><%= (bill != null ? bill.getBillId() : "") %></span></div>
                        <div>Status: <span class="badge badge-live">Generated</span></div>
                    </div>
                </div>
            </div>

            <!-- Table -->
            <div class="table-responsive mt-4">
                <table class="table align-middle mb-0">
                    <thead>
                    <tr>
                        <th style="min-width:240px;">Item</th>
                        <th class="text-end">Quantity</th>
                        <th class="text-end">Unit Price (LKR)</th>
                        <th class="text-end">Total (LKR)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        double grandTotal = 0.0;
                        if (billItems != null) {
                            for (BillItem bi : billItems) {
                                double lineTotal = bi.getQuantity() * bi.getPrice();
                                grandTotal += lineTotal;
                                String itemName = String.valueOf(bi.getItemId());
                                Item found = itemById.get(bi.getItemId());
                                if (found != null) itemName = found.getItem_name();
                    %>
                    <tr>
                        <td><%= itemName %></td>
                        <td class="text-end"><%= bi.getQuantity() %></td>
                        <td class="text-end"><%= money.format(bi.getPrice()) %></td>
                        <td class="text-end"><%= money.format(lineTotal) %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="3" class="text-end">Grand Total (LKR)</th>
                        <th class="text-end"><%= money.format(grandTotal) %></th>
                    </tr>
                    </tfoot>
                </table>
            </div>

            <!-- Actions -->
            <div class="d-flex flex-wrap gap-2 justify-content-between align-items-center mt-4 no-print">
                <a href="BillServlet" class="btn btn-ghost">
                    <i class="fa-solid fa-arrow-left-long me-1"></i> Back to Billing
                </a>
                <div class="d-flex gap-2">
                    <button class="btn btn-outline-light" onclick="copyBillRef()">
                        <i class="fa-solid fa-copy me-1"></i> Copy Ref
                    </button>
                    <button class="btn btn-crimson" onclick="window.print()">
                        <i class="fa-solid fa-print me-1"></i> Print / Save PDF
                    </button>
                </div>
            </div>
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

<!-- Helpers -->
<script>
    function copyBillRef(){
        const ref = "<%= (bill != null ? bill.getBillId() : "") %>";
        if (!ref) return;
        navigator.clipboard.writeText(ref).then(() => {
            alert("Bill reference copied: " + ref);
        }).catch(() => {});
    }
</script>
</body>
</html>
