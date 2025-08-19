<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Existing values from query parameters
    String item_id = request.getParameter("item_id");
    String item_name = request.getParameter("item_name");
    String item_description = request.getParameter("item_description");
    String unit_price = request.getParameter("unit_price");
    String stock_quantity = request.getParameter("stock_quantity");
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8" />
    <title>Edit Item | Pahana Edu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 (icons) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        :root{
            --ink:#0b0b0d; --ink-900:#08080a;
            --ash:#aeb4bd; --stroke:rgba(255,255,255,.12);
            --panel:rgba(255,255,255,.06);
            --crimson:#e5092a; --crimson-700:#c20824;
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
        .form-control, .input-group-text{
            background-color: rgba(255,255,255,.06);
            border-color: rgba(255,255,255,.18);
            color:#e9ecef;
        }
        .form-control:focus{
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
                <span class="brand-mark"><i class="fa-solid fa-box-open"></i></span>
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
                    <li class="nav-item"><a class="nav-link" href="ItemServlet"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a></li>
                    <li class="nav-item"><a class="nav-link" href="BillServlet"><i class="fa-solid fa-list me-1"></i> Bills</a></li>
                    <li class="nav-item"><a class="nav-link" href="show-customer.jsp"><i class="fa-solid fa-users me-1"></i> Customers</a></li>
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
                        <h1 class="h4 fw-bold mb-1 section-title d-inline-block">Edit Item</h1>
                        <p class="text-secondary mb-0">Update the item details below</p>
                    </div>

                    <form action="ItemServlet" method="post" id="editItemForm" class="needs-validation" novalidate>
                        <!-- Hidden ID for submission -->
                        <input type="hidden" name="item_id" value="<%= item_id != null ? item_id : "" %>">

                        <!-- Display Item ID (read-only) -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold"><i class="fa-solid fa-hashtag me-2"></i>Item ID</label>
                            <input type="text" class="form-control" value="<%= item_id != null ? item_id : "" %>" disabled>
                        </div>

                        <!-- Item Name -->
                        <div class="mb-3">
                            <label for="item_name" class="form-label fw-semibold"><i class="fa-solid fa-box me-2"></i>Item Name</label>
                            <input type="text" class="form-control" id="item_name" name="item_name"
                                   placeholder="Item Name" value="<%= item_name != null ? item_name : "" %>" required>
                            <div class="invalid-feedback">Please enter the item name.</div>
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label for="item_description" class="form-label fw-semibold"><i class="fa-solid fa-quote-left me-2"></i>Item Description</label>
                            <input type="text" class="form-control" id="item_description" name="item_description"
                                   value="<%= item_description != null ? item_description : "" %>" required>
                            <div class="invalid-feedback">Please enter a short description.</div>
                        </div>

                        <!-- Unit Price -->
                        <div class="mb-3">
                            <label for="unit_price" class="form-label fw-semibold"><i class="fa-solid fa-money-bill-wave me-2"></i>Unit Price</label>
                            <div class="input-group">
                                <span class="input-group-text">LKR</span>
                                <input type="number" class="form-control text-end" id="unit_price" name="unit_price"
                                       step="0.01" min="0" placeholder="0.00"
                                       value="<%= unit_price != null ? unit_price : "" %>" required>
                            </div>
                            <div class="invalid-feedback">Enter a valid price (0 or more).</div>
                        </div>

                        <!-- Stock Quantity -->
                        <div class="mb-4">
                            <label for="stock_quantity" class="form-label fw-semibold"><i class="fa-solid fa-layer-group me-2"></i>Stock Quantity</label>
                            <input type="number" class="form-control text-end" id="stock_quantity" name="stock_quantity"
                                   step="1" min="0" value="<%= stock_quantity != null ? stock_quantity : "" %>" required>
                            <div class="invalid-feedback">Enter a valid stock quantity (0 or more).</div>
                        </div>

                        <!-- Actions -->
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-crimson flex-fill d-flex align-items-center justify-content-center gap-2" id="saveBtn">
                                <i class="fa-solid fa-floppy-disk"></i>
                                <span class="btn-text">Update Item</span>
                                <i class="fa-solid fa-circle-notch fa-spin d-none" aria-hidden="true"></i>
                            </button>
                            <a href="ItemServlet" class="btn btn-ghost flex-fill">
                                <i class="fa-solid fa-arrow-left-long me-1"></i> Back to Item List
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
            <a href="ItemServlet" class="link-faded"><i class="fa-solid fa-boxes-stacked me-1"></i> Items</a>
            <a href="BillServlet" class="link-faded"><i class="fa-solid fa-list me-1"></i> Bills</a>
            <a href="show-customer.jsp" class="link-faded"><i class="fa-solid fa-users me-1"></i> Customers</a>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Client-side validation & busy state -->
<script>
    (() => {
        'use strict';
        const form = document.getElementById('editItemForm');
        const saveBtn = document.getElementById('saveBtn');

        form.addEventListener('submit', (e) => {
            if (!form.checkValidity()) {
                e.preventDefault();
                e.stopPropagation();
                form.classList.add('was-validated');
                return;
            }
            // Busy state on save
            saveBtn.disabled = true;
            const spin = saveBtn.querySelector('.fa-circle-notch');
            const text = saveBtn.querySelector('.btn-text');
            if (spin) spin.classList.remove('d-none');
            if (text) text.textContent = 'Saving...';
        }, false);
    })();
</script>
</body>
</html>
