<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int billId = Integer.parseInt(request.getParameter("billId"));
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8" />
    <title>Delete Bill | Pahana Edu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 (icons) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        :root{
            --ink:#0b0b0d; --ink-900:#08080a; --ash:#aeb4bd; --stroke:rgba(255,255,255,.12);
            --panel:rgba(255,255,255,.06); --crimson:#e5092a; --crimson-700:#c20824;
            --halo:0 0 0 .25rem rgba(229,9,42,.35);
        }
        html, body{
            background:
                    radial-gradient(900px 400px at 12% -10%, rgba(229,9,42,.14), transparent),
                    radial-gradient(700px 300px at 110% 0%, rgba(229,9,42,.10), transparent),
                    var(--ink);
        }

        /* Header */
        .app-header{
            background: linear-gradient(180deg, var(--ink-900), rgba(11,11,13,.92));
            border-bottom: 1px solid var(--stroke);
            backdrop-filter: blur(6px);
        }
        .brand-mark{
            display:inline-flex;width:2.5rem;height:2.5rem;border-radius:.85rem;
            align-items:center;justify-content:center;color:#fff;
            background: linear-gradient(135deg, var(--crimson), var(--crimson-700));
            box-shadow: 0 10px 26px rgba(229,9,42,.35);
        }
        .nav-link{ color:var(--ash);} .nav-link:hover{ color:#fff;}

        /* Card */
        .shell{
            background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.04));
            border:1px solid var(--stroke); border-radius:1.25rem;
            box-shadow:0 18px 40px rgba(0,0,0,.45);
        }
        .danger-icon{
            width:3.2rem; height:3.2rem; border-radius:1rem;
            display:inline-flex; align-items:center; justify-content:center;
            background: linear-gradient(135deg, var(--crimson), var(--crimson-700));
            color:#fff; box-shadow:0 12px 28px rgba(229,9,42,.35);
        }
        .badge-dangerish{
            background: linear-gradient(135deg, var(--crimson), var(--crimson-700));
        }

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
                    <li class="nav-item"><a class="nav-link" href="BillServlet"><i class="fa-solid fa-list me-1"></i> Bills</a></li>
                    <li class="nav-item"><a class="nav-link" href="ItemServlet"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a></li>
                    <li class="nav-item"><a class="nav-link" href="show-customer.jsp"><i class="fa-solid fa-users me-1"></i> Customers</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Main -->
<main class="container flex-grow-1 d-flex align-items-center py-5">
    <div class="row justify-content-center w-100">
        <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">
            <div class="shell">
                <div class="p-4 p-md-5 text-center">
                    <div class="mb-3">
                        <span class="danger-icon"><i class="fa-solid fa-triangle-exclamation"></i></span>
                    </div>
                    <h1 class="h4 fw-bold mb-2">Confirm Delete Bill</h1>
                    <p class="text-secondary mb-4">
                        Are you sure you want to permanently delete
                        <span class="fw-semibold">Bill ID</span>
                        <span class="badge badge-dangerish align-middle">#<%= billId %></span>?
                        This action cannot be undone.
                    </p>

                    <form action="BillDeleteServlet" method="post" class="d-grid gap-2">
                        <input type="hidden" name="billId" value="<%= billId %>" />
                        <button type="submit" class="btn btn-crimson d-flex justify-content-center align-items-center gap-2">
                            <i class="fa-solid fa-trash-can"></i>
                            Delete Bill
                        </button>
                        <button type="button" class="btn btn-outline-light d-flex justify-content-center align-items-center gap-2"
                                onclick="cancelDelete()">
                            <i class="fa-solid fa-arrow-left-long"></i>
                            Cancel
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
            <a href="main-menu.jsp" class="link-faded"><i class="fa-solid fa-house me-1"></i> Home</a>
            <a href="BillServlet" class="link-faded"><i class="fa-solid fa-list me-1"></i> Bills</a>
            <a href="ItemServlet" class="link-faded"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a>
            <a href="show-customer.jsp" class="link-faded"><i class="fa-solid fa-users me-1"></i> Customers</a>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function cancelDelete(){
        // Prefer returning to previous page; if none, go to Bills list
        if (document.referrer) {
            window.history.back();
        } else {
            window.location.href = 'BillServlet';
        }
    }
</script>
</body>
</html>
