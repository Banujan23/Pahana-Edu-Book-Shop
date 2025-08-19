<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8" />
  <title>Help & User Guide | Pahana Edu</title>
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
      scroll-behavior:smooth;
      background:
              radial-gradient(900px 400px at 12% -10%, rgba(229,9,42,.14), transparent),
              radial-gradient(700px 300px at 110% 0%, rgba(229,9,42,.10), transparent),
              var(--ink);
    }
    /* Header */
    .app-header{ background:linear-gradient(180deg,var(--ink-900),rgba(11,11,13,.92)); border-bottom:1px solid var(--stroke); backdrop-filter: blur(6px); }
    .brand-mark{
      display:inline-flex;width:2.6rem;height:2.6rem;border-radius:.9rem;align-items:center;justify-content:center;color:#fff;
      background:linear-gradient(135deg,var(--crimson),var(--crimson-700)); box-shadow:0 10px 26px rgba(229,9,42,.35);
    }
    .nav-link{ color:var(--ash);} .nav-link:hover{ color:#fff; }

    /* Hero */
    .hero{
      background:
              radial-gradient(700px 250px at 0% 0%, rgba(229,9,42,.15), transparent),
              linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.02));
      border:1px solid var(--stroke);
      border-radius:1.25rem;
      box-shadow:0 18px 40px rgba(0,0,0,.45);
    }
    .pill{
      border:1px solid var(--stroke);
      background:rgba(255,255,255,.06);
      color:#fff;
      padding:.35rem .6rem; border-radius:999px;
    }

    /* Layout */
    .shell{ background:linear-gradient(180deg,var(--panel),var(--panel-2)); border:1px solid var(--stroke); border-radius:1.25rem; box-shadow:0 18px 40px rgba(0,0,0,.45); }
    .toc{
      position:sticky; top:1.25rem;
      padding:1rem; border:1px solid var(--stroke); border-radius:.9rem;
      background:rgba(255,255,255,.04);
    }
    .toc a{ color:var(--ash); text-decoration:none; display:flex; gap:.5rem; align-items:center; padding:.4rem .5rem; border-radius:.5rem; }
    .toc a.active, .toc a:hover{ color:#fff; background:rgba(229,9,42,.15); }

    .section-title{ border-left:4px solid var(--crimson); padding-left:.75rem; }

    /* Lists / tables */
    .list-check li::marker{ color:var(--crimson); }
    .kbd{ font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, "Liberation Mono", monospace; background:rgba(255,255,255,.08); border:1px solid var(--stroke); border-bottom-color:rgba(255,255,255,.2); border-radius:.4rem; padding:.15rem .35rem; }

    /* Buttons */
    .btn-crimson{
      --bs-btn-bg:var(--crimson); --bs-btn-border-color:var(--crimson);
      --bs-btn-hover-bg:var(--crimson-700); --bs-btn-hover-border-color:var(--crimson-700);
      color:#fff; box-shadow:0 10px 24px rgba(229,9,42,.28);
    }
    .btn-ghost{ color:var(--crimson); border-color:var(--crimson); }
    .btn-ghost:hover{ background:var(--crimson); color:#fff; }

    /* FAQ */
    .faq .accordion-button{
      background:rgba(255,255,255,.04);
      color:#fff; border-bottom:1px solid var(--stroke);
    }
    .faq .accordion-button:not(.collapsed){ color:#fff; background:rgba(229,9,42,.14); box-shadow:none; }
    .faq .accordion-item{ border:1px solid var(--stroke); background:transparent; }
    .faq .accordion-body{ color:#dfe2e6; }

    /* Footer */
    footer.app-footer{ border-top:1px solid var(--stroke); background:linear-gradient(180deg, rgba(11,11,13,.92), var(--ink-900)); }
    .link-faded{ color:var(--ash); text-decoration:none; } .link-faded:hover{ color:#fff; }

    /* Focus */
    .btn:focus, .form-control:focus{ box-shadow:var(--halo); border-color:var(--crimson); }
    .form-control{ background-color:rgba(255,255,255,.06); border-color:rgba(255,255,255,.18); color:#e9ecef; }
    .input-group-text{ background:rgba(255,255,255,.06); border-color:rgba(255,255,255,.18); color:#fff; }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header class="app-header">
  <nav class="navbar navbar-expand-lg py-3">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center gap-3" href="main-menu.jsp">
        <span class="brand-mark"><i class="fa-solid fa-circle-question"></i></span>
        <div class="d-flex flex-column lh-sm">
          <span class="fw-semibold text-white">Pahana Edu Billing</span>
          <small class="text-secondary">Help & User Guide</small>
        </div>
      </a>
      <div class="ms-auto d-flex gap-2">
        <a href="main-menu.jsp" class="btn btn-ghost"><i class="fa-solid fa-arrow-left-long me-2"></i> Back to Home</a>
      </div>
    </div>
  </nav>
</header>

<!-- Hero -->
<section class="container py-4">
  <div class="hero p-4 p-md-5">
    <div class="d-flex flex-column flex-lg-row align-items-lg-center gap-4">
      <div class="flex-grow-1">
        <div class="d-flex align-items-center gap-2 mb-2">
          <span class="pill"><i class="fa-solid fa-bolt-lightning me-1"></i> Quick help</span>
          <span class="pill"><i class="fa-solid fa-book-open me-1"></i> Step-by-step</span>
        </div>
        <h1 class="display-6 text-white mb-2">Your fast lane to billing mastery</h1>
        <p class="text-secondary mb-0">
          Learn core workflows in minutes—create bills, manage stock, and keep customers up to date.
        </p>
      </div>
      <div class="text-center">
        <a href="#quick-start" class="btn btn-crimson px-4 py-2"><i class="fa-solid fa-flag-checkered me-2"></i>Start here</a>
      </div>
    </div>
  </div>
</section>

<!-- Body -->
<main class="container py-4 flex-grow-1">
  <div class="row g-4">
    <!-- Sidebar -->
    <aside class="col-12 col-lg-3">
      <nav class="toc">
        <div class="fw-semibold text-white mb-2"><i class="fa-solid fa-map me-2"></i>Guide Map</div>
        <a class="active" href="#quick-start"><i class="fa-solid fa-flag-checkered"></i> Quick Start</a>
        <a href="#daily-tasks"><i class="fa-solid fa-calendar-check"></i> Daily Tasks</a>
        <a href="#shortcuts"><i class="fa-solid fa-keyboard"></i> Keyboard Shortcuts</a>
        <a href="#troubleshooting"><i class="fa-solid fa-screwdriver-wrench"></i> Troubleshooting</a>
        <a href="#faq"><i class="fa-solid fa-circle-question"></i> FAQs</a>
        <a href="#policies"><i class="fa-solid fa-shield-halved"></i> Policies</a>
        <a href="#contact"><i class="fa-solid fa-headset"></i> Contact</a>
      </nav>
    </aside>

    <!-- Content -->
    <section class="col-12 col-lg-9 d-flex flex-column gap-4">

      <!-- Quick Start -->
      <div id="quick-start" class="shell p-4 p-md-5">
        <h2 class="h4 section-title text-white">Quick Start</h2>
        <ol class="mt-3 list-group list-group-numbered">
          <li class="list-group-item bg-transparent text-white border-0">
            <span class="fw-semibold"><i class="fa-solid fa-right-to-bracket me-2 text-danger"></i>Sign in</span>
            — go to <span class="text-secondary">/login</span> and enter your credentials.
          </li>
          <li class="list-group-item bg-transparent text-white border-0">
            <span class="fw-semibold"><i class="fa-solid fa-user-plus me-2 text-danger"></i>Add a customer</span>
            — use <em>Add New Customer</em> to create their profile.
          </li>
          <li class="list-group-item bg-transparent text-white border-0">
            <span class="fw-semibold"><i class="fa-solid fa-boxes-stacked me-2 text-danger"></i>Add items</span>
            — create items with price and stock.
          </li>
          <li class="list-group-item bg-transparent text-white border-0">
            <span class="fw-semibold"><i class="fa-solid fa-file-invoice-dollar me-2 text-danger"></i>Create a bill</span>
            — select a customer, add items, verify totals, then submit.
          </li>
          <li class="list-group-item bg-transparent text-white border-0">
            <span class="fw-semibold"><i class="fa-solid fa-print me-2 text-danger"></i>Print / export</span>
            — open the bill and use <em>Print / Save as PDF</em>.
          </li>
        </ol>
        <div class="mt-3">
          <a class="btn btn-crimson me-2" href="BillServlet"><i class="fa-solid fa-plus me-2"></i>Create First Bill</a>
          <a class="btn btn-outline-light" href="ItemServlet"><i class="fa-solid fa-box-open me-2"></i>Manage Items</a>
        </div>
      </div>

      <!-- Daily Tasks -->
      <div id="daily-tasks" class="shell p-4 p-md-5">
        <h2 class="h4 section-title text-white">Daily Tasks</h2>
        <div class="row g-3 mt-1">
          <div class="col-md-6">
            <div class="p-3 border rounded" style="border-color:var(--stroke)!important;background:rgba(255,255,255,.03);">
              <div class="fw-semibold text-white mb-1"><i class="fa-solid fa-box me-2 text-danger"></i>Stock updates</div>
              <ul class="mb-0 list-check">
                <li>Review low-stock items and reorder.</li>
                <li>Adjust quantities after deliveries.</li>
                <li>Correct prices for promotions.</li>
              </ul>
            </div>
          </div>
          <div class="col-md-6">
            <div class="p-3 border rounded" style="border-color:var(--stroke)!important;background:rgba(255,255,255,.03);">
              <div class="fw-semibold text-white mb-1"><i class="fa-solid fa-user-pen me-2 text-danger"></i>Customer care</div>
              <ul class="mb-0 list-check">
                <li>Confirm customer details when billing.</li>
                <li>Update addresses and phone numbers.</li>
                <li>Archive outdated profiles if needed.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!-- Keyboard Shortcuts -->
      <div id="shortcuts" class="shell p-4 p-md-5">
        <h2 class="h4 section-title text-white">Keyboard Shortcuts</h2>
        <div class="table-responsive mt-2">
          <table class="table align-middle mb-0">
            <thead>
            <tr><th>Action</th><th>Shortcut</th></tr>
            </thead>
            <tbody>
            <tr><td>Search within tables</td><td><span class="kbd">/</span></td></tr>
            <tr><td>Add item row on billing</td><td><span class="kbd">Alt</span> + <span class="kbd">+</span></td></tr>
            <tr><td>Submit current form</td><td><span class="kbd">Ctrl</span> + <span class="kbd">Enter</span></td></tr>
            <tr><td>Print current bill</td><td><span class="kbd">Ctrl</span> + <span class="kbd">P</span></td></tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Troubleshooting -->
      <div id="troubleshooting" class="shell p-4 p-md-5">
        <h2 class="h4 section-title text-white">Troubleshooting</h2>
        <div class="row g-3 mt-1">
          <div class="col-md-6">
            <div class="p-3 border rounded" style="border-color:var(--stroke)!important;">
              <div class="fw-semibold text-white mb-1"><i class="fa-solid fa-triangle-exclamation me-2 text-danger"></i>Form won’t submit</div>
              <ul class="mb-0 list-check">
                <li>Check fields marked in red.</li>
                <li>Ensure price and quantities are valid numbers.</li>
                <li>Reload the page if buttons stay disabled.</li>
              </ul>
            </div>
          </div>
          <div class="col-md-6">
            <div class="p-3 border rounded" style="border-color:var(--stroke)!important;">
              <div class="fw-semibold text-white mb-1"><i class="fa-solid fa-print me-2 text-danger"></i>PDF looks wrong</div>
              <ul class="mb-0 list-check">
                <li>Use A4 and 100% scale in the print dialog.</li>
                <li>Disable browser headers/footers if overlapping.</li>
                <li>Try system PDF printer if built-in fails.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!-- FAQ -->
      <div id="faq" class="shell p-4 p-md-5">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-2">
          <h2 class="h4 section-title text-white mb-0">FAQs</h2>
          <div class="input-group" style="width: 280px;">
            <span class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></span>
            <input type="text" id="faqSearch" class="form-control" placeholder="Search FAQs...">
          </div>
        </div>
        <div class="accordion faq mt-3" id="faqAcc">
          <div class="accordion-item">
            <h2 class="accordion-header" id="f1">
              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#c1" aria-expanded="true" aria-controls="c1">
                How do I change item prices in bulk?
              </button>
            </h2>
            <div id="c1" class="accordion-collapse collapse show" aria-labelledby="f1" data-bs-parent="#faqAcc">
              <div class="accordion-body">
                Export the items list, adjust prices, then update them through the Items page individually.
                For frequent changes, consider using consistent percentage adjustments.
              </div>
            </div>
          </div>

          <div class="accordion-item">
            <h2 class="accordion-header" id="f2">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#c2" aria-expanded="false" aria-controls="c2">
                Can I undo a bill after saving?
              </button>
            </h2>
            <div id="c2" class="accordion-collapse collapse" aria-labelledby="f2" data-bs-parent="#faqAcc">
              <div class="accordion-body">
                Saved bills can be edited or deleted by authorized users from the Bills page. If a bill was printed,
                reprint the corrected version and mark the old one as void in your records.
              </div>
            </div>
          </div>

          <div class="accordion-item">
            <h2 class="accordion-header" id="f3">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#c3" aria-expanded="false" aria-controls="c3">
                Why can’t I find a customer when billing?
              </button>
            </h2>
            <div id="c3" class="accordion-collapse collapse" aria-labelledby="f3" data-bs-parent="#faqAcc">
              <div class="accordion-body">
                Ensure the customer exists and is spelled correctly. Use <em>Display Account</em> to confirm details,
                then return to create the bill.
              </div>
            </div>
          </div>

          <div class="accordion-item">
            <h2 class="accordion-header" id="f4">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#c4" aria-expanded="false" aria-controls="c4">
                How do I add a discount to a bill?
              </button>
            </h2>
            <div id="c4" class="accordion-collapse collapse" aria-labelledby="f4" data-bs-parent="#faqAcc">
              <div class="accordion-body">
                Add a dedicated “Discount” line item with a negative price, or adjust item prices before submission.
                Keep a note on the bill for audit clarity.
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Policies -->
      <div id="policies" class="shell p-4 p-md-5">
        <h2 class="h4 section-title text-white">Data & Privacy Policies</h2>
        <ul class="mt-2 list-check">
          <li>Customer data is used solely for billing and record keeping.</li>
          <li>Access is role-based; ask your admin to change permissions.</li>
          <li>Exported files should be stored on secure drives with limited access.</li>
        </ul>
      </div>

      <!-- Contact -->
      <div id="contact" class="shell p-4 p-md-5">
        <h2 class="h4 section-title text-white">Need a hand?</h2>
        <p class="text-secondary mb-3">Reach out and we’ll get you back on track.</p>
        <div class="row g-3">
          <div class="col-md-6">
            <div class="p-3 border rounded h-100" style="border-color:var(--stroke)!important;">
              <div class="fw-semibold text-white mb-1"><i class="fa-solid fa-envelope me-2 text-danger"></i>Email</div>
              <div class="text-secondary">support@pahana-edu.example</div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="p-3 border rounded h-100" style="border-color:var(--stroke)!important;">
              <div class="fw-semibold text-white mb-1"><i class="fa-solid fa-phone me-2 text-danger"></i>Phone</div>
              <div class="text-secondary">+94 11 234 5678 (Mon–Fri, 9:00–17:00)</div>
            </div>
          </div>
        </div>
        <div class="mt-3 d-flex gap-2">
          <a href="display-account.jsp" class="btn btn-outline-light"><i class="fa-solid fa-user-magnifying-glass me-2"></i>Find Customer</a>
          <a href="BillServlet" class="btn btn-crimson"><i class="fa-solid fa-file-invoice-dollar me-2"></i>Go to Billing</a>
        </div>
      </div>

    </section>
  </div>

  <p class="text-center text-secondary small mt-4 mb-0">
    &copy; 2025 Pahana Edu Bookshop System · Help Center
  </p>
</main>

<!-- Footer -->
<footer class="app-footer mt-auto py-4">
  <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between gap-3">
    <div class="text-secondary small">
      <span class="text-white">Pahana Edu</span> · Clarity first, always
    </div>
    <div class="d-flex gap-3 small">
      <a href="main-menu.jsp" class="link-faded"><i class="fa-solid fa-house me-1"></i> Home</a>
      <a href="#policies" class="link-faded"><i class="fa-solid fa-shield-halved me-1"></i> Policies</a>
    </div>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- JS: TOC highlight & FAQ search -->
<script>
  // Sidebar active link based on scroll
  const tocLinks = document.querySelectorAll('.toc a');
  const sections = [...tocLinks].map(a => document.querySelector(a.getAttribute('href')));
  const onScroll = () => {
    const pos = window.scrollY + 120;
    let current = sections[0];
    sections.forEach(sec => { if (sec.offsetTop <= pos) current = sec; });
    tocLinks.forEach(a => a.classList.toggle('active', a.getAttribute('href') === '#' + current.id));
  };
  document.addEventListener('scroll', onScroll, { passive: true });
  onScroll();

  // FAQ search
  const faqSearch = document.getElementById('faqSearch');
  const faqItems = document.querySelectorAll('#faq .accordion-item');
  faqSearch?.addEventListener('input', () => {
    const q = faqSearch.value.toLowerCase();
    faqItems.forEach(item => {
      const text = item.innerText.toLowerCase();
      item.style.display = text.includes(q) ? '' : 'none';
    });
  });

  // Keyboard shortcuts: "/" focuses FAQ search
  document.addEventListener('keydown', (e) => {
    if (e.key === '/' && !['INPUT','TEXTAREA'].includes(document.activeElement.tagName)) {
      e.preventDefault(); faqSearch?.focus();
    }
  });
</script>
</body>
</html>
