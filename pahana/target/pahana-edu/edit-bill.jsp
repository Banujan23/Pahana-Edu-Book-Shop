<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.icbt.model.*" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
    List<BillItem> billItems = (List<BillItem>) request.getAttribute("billItems");
    List<Item> items = (List<Item>) request.getAttribute("items");
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8" />
    <title>Edit Bill | Pahana Edu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 (icons) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        :root{
            --ink:#0b0b0d; --ink-900:#08080a; --ink-700:#141418;
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

        /* Shell */
        .shell{
            background:linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.04));
            border:1px solid var(--stroke); border-radius:1.25rem;
            box-shadow:0 18px 40px rgba(0,0,0,.45);
        }
        .section-title{ border-left:4px solid var(--crimson); padding-left:.75rem; font-weight:700; }

        /* Controls */
        .form-label i{ color:var(--crimson); }
        .form-select, .form-control, .input-group-text{
            background-color: rgba(255,255,255,.06);
            border-color: rgba(255,255,255,.18);
            color:#e9ecef;
        }
        .form-select:focus, .form-control:focus{
            border-color: var(--crimson);
            box-shadow: var(--halo);
        }
        .invalid-feedback{ color:#ffb3bd; }
        .form-text{ color:var(--ash); }

        /* Table */
        .table thead th{ border-bottom:1px solid var(--stroke)!important; background: rgba(255,255,255,.04); }
        .table tbody td, .table tfoot th{ border-top:1px solid var(--stroke)!important; }
        .line-total{ font-variant-numeric: tabular-nums; }

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

        @media print{
            .no-print{ display:none !important; }
            body{ background:#fff !important; }
            .shell{ border:0; border-radius:0; box-shadow:none; }
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
                <span class="brand-mark"><i class="fa-solid fa-pen-to-square"></i></span>
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
<main class="container py-5 flex-grow-1">
    <header class="text-center mb-4">
        <h1 class="h4 fw-bold mb-1 section-title d-inline-block">Edit Bill</h1>
        <p class="text-secondary mb-0">Bill ID: <span class="badge bg-secondary">#<%= bill.getBillId() %></span></p>
    </header>

    <div class="shell">
        <div class="p-4 p-md-5">
            <form action="BillServlet" method="post" id="editBillForm" class="needs-validation" novalidate>
                <input type="hidden" name="formAction" value="update" />
                <input type="hidden" name="billId" value="<%= bill.getBillId() %>" />

                <!-- Customer -->
                <div class="mb-4">
                    <label for="customer_id" class="form-label fw-semibold">
                        <i class="fa-solid fa-user-tag me-2"></i>Account Number
                    </label>
                    <select name="customer_id" id="customer_id" class="form-select" required>
                        <% if (customers != null) {
                            for (Customer c : customers) { %>
                        <option value="<%= c.getAccountNumber() %>"
                                <%= (c.getAccountNumber() == bill.getAccountNumber()) ? "selected" : "" %>>
                            <%= c.getAccountNumber() %> - <%= c.getName() %>
                        </option>
                        <% } } %>
                    </select>
                    <div class="invalid-feedback">Please select an account number.</div>
                </div>

                <!-- Items table header + add button -->
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <h2 class="h6 fw-semibold mb-0">Items</h2>
                    <div class="d-flex gap-2">
                        <button type="button" class="btn btn-sm btn-ghost" onclick="addRow()">
                            <i class="fa-solid fa-plus me-1"></i>Add Item
                        </button>
                        <button type="button" class="btn btn-sm btn-outline-light" onclick="clearAllRows()">
                            <i class="fa-solid fa-broom me-1"></i>Clear
                        </button>
                    </div>
                </div>

                <!-- Items table -->
                <div class="table-responsive">
                    <table class="table align-middle mb-3" id="itemTable">
                        <thead>
                        <tr>
                            <th style="min-width: 240px;">Item</th>
                            <th class="text-end" style="width: 140px;">Quantity</th>
                            <th class="text-end" style="width: 180px;">Unit Price (LKR)</th>
                            <th class="text-end" style="width: 160px;">Line Total</th>
                            <th class="text-center" style="width: 100px;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% if (billItems != null) { for (BillItem bi : billItems) { %>
                        <tr>
                            <td>
                                <select name="itemId[]" class="form-select" onchange="setPrice(this); calcRow(this);" required>
                                    <option value="">Select Item</option>
                                    <% if (items != null) {
                                        for (Item it : items) { %>
                                    <option value="<%= it.getItem_id() %>" data-price="<%= it.getUnit_price() %>"
                                            <%= (it.getItem_id() == bi.getItemId()) ? "selected" : "" %>>
                                        <%= it.getItem_name() %>
                                    </option>
                                    <% } } %>
                                </select>
                                <div class="invalid-feedback">Please choose an item.</div>
                            </td>
                            <td>
                                <input type="number" name="quantity[]" class="form-control text-end"
                                       min="1" value="<%= bi.getQuantity() %>" required oninput="calcRow(this)">
                                <div class="invalid-feedback">Enter a quantity of at least 1.</div>
                            </td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-text">LKR</span>
                                    <input type="number" name="price[]" class="form-control text-end"
                                           step="0.01" min="0" value="<%= bi.getPrice() %>" required oninput="calcRow(this)">
                                </div>
                                <div class="invalid-feedback">Enter a valid price.</div>
                            </td>
                            <td class="text-end fw-semibold">
                                <span class="line-total">0.00</span>
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-sm btn-outline-danger" onclick="removeRow(this)">
                                    <i class="fa-solid fa-trash-can"></i>
                                </button>
                            </td>
                        </tr>
                        <% } } %>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th colspan="3" class="text-end">Grand Total (LKR)</th>
                            <th class="text-end"><span id="grandTotal">0.00</span></th>
                            <th></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>

                <!-- Actions -->
                <div class="d-flex justify-content-between align-items-center">
                    <a href="BillServlet" class="btn btn-ghost"><i class="fa-solid fa-arrow-left-long me-2"></i>Cancel</a>
                    <button type="submit" id="submitBtn" class="btn btn-crimson d-inline-flex align-items-center gap-2">
                        <i class="fa-solid fa-floppy-disk"></i>
                        <span class="btn-text">Update Bill</span>
                        <i class="fa-solid fa-circle-notch fa-spin d-none" id="btnSpinner" aria-hidden="true"></i>
                    </button>
                </div>
            </form>
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
        </div>
    </div>
</footer>

<!-- Row template -->
<template id="item-row-template">
    <tr>
        <td>
            <select name="itemId[]" class="form-select" onchange="setPrice(this); calcRow(this);" required>
                <option value="">Select Item</option>
                <%
                    List<Item> items2 = (List<Item>) request.getAttribute("items");
                    if (items2 != null) { for (Item it2 : items2) { %>
                <option value="<%= it2.getItem_id() %>" data-price="<%= it2.getUnit_price() %>">
                    <%= it2.getItem_name() %>
                </option>
                <% } } %>
            </select>
            <div class="invalid-feedback">Please choose an item.</div>
        </td>
        <td>
            <input type="number" name="quantity[]" class="form-control text-end" min="1" value="1" required oninput="calcRow(this)">
            <div class="invalid-feedback">Enter a quantity of at least 1.</div>
        </td>
        <td>
            <div class="input-group">
                <span class="input-group-text">LKR</span>
                <input type="number" name="price[]" class="form-control text-end" step="0.01" min="0" value="0.00" required oninput="calcRow(this)">
            </div>
            <div class="invalid-feedback">Enter a valid price.</div>
        </td>
        <td class="text-end fw-semibold">
            <span class="line-total">0.00</span>
        </td>
        <td class="text-center">
            <button type="button" class="btn btn-sm btn-outline-danger" onclick="removeRow(this)">
                <i class="fa-solid fa-trash-can"></i>
            </button>
        </td>
    </tr>
</template>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- JS: add/remove rows, price autofill, totals, validation, busy state -->
<script>
    function addRow() {
        const tpl = document.getElementById('item-row-template');
        const tbody = document.querySelector('#itemTable tbody');
        tbody.appendChild(tpl.content.cloneNode(true));
        recalcGrand();
    }

    function clearAllRows(){
        const tbody = document.querySelector('#itemTable tbody');
        tbody.innerHTML = '';
        addRow(); // keep one empty row
        recalcGrand();
    }

    function removeRow(btn) {
        const tbody = document.querySelector('#itemTable tbody');
        const row = btn.closest('tr');
        row?.remove();
        if (tbody.children.length === 0) addRow();
        recalcGrand();
    }

    function setPrice(selectEl) {
        const opt = selectEl.options[selectEl.selectedIndex];
        const priceAttr = opt ? opt.getAttribute('data-price') : null;
        if (priceAttr !== null) {
            const row = selectEl.closest('tr');
            const priceInput = row.querySelector('input[name="price[]"]');
            // Only auto-fill if blank or zero to avoid overwriting manual edits
            if (priceInput && (priceInput.value === "" || parseFloat(priceInput.value) === 0)) {
                priceInput.value = Number(priceAttr).toFixed(2);
                calcRow(priceInput);
            }
        }
    }

    function calcRow(el) {
        const row = el.closest('tr');
        const qty = parseFloat(row.querySelector('input[name="quantity[]"]').value || '0');
        const price = parseFloat(row.querySelector('input[name="price[]"]').value || '0');
        const total = (qty * price) || 0;
        row.querySelector('.line-total').textContent = total.toFixed(2);
        recalcGrand();
    }

    function recalcGrand() {
        const totals = Array.from(document.querySelectorAll('.line-total'))
            .map(span => parseFloat(span.textContent || '0'));
        const grand = totals.reduce((a, b) => a + b, 0);
        document.getElementById('grandTotal').textContent = grand.toFixed(2);
    }

    // Initialize totals for prefilled rows
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('#itemTable tbody tr').forEach(tr => {
            const qty = tr.querySelector('input[name="quantity[]"]');
            const price = tr.querySelector('input[name="price[]"]');
            if (qty || price) calcRow(qty || price);
        });
    });

    // Form validation & busy state
    (() => {
        'use strict';
        const form = document.getElementById('editBillForm');
        const submitBtn = document.getElementById('submitBtn');
        const spinner = document.getElementById('btnSpinner');
        const btnText = submitBtn.querySelector('.btn-text');

        form.addEventListener('submit', (e) => {
            if (!form.checkValidity()) {
                e.preventDefault();
                e.stopPropagation();
            } else {
                submitBtn.disabled = true;
                spinner.classList.remove('d-none');
                btnText.textContent = 'Updating...';
            }
            form.classList.add('was-validated');
        }, false);
    })();
</script>
</body>
</html>
