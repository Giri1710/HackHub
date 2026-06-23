/* HackHub — UI Enhancer
   Runs on every page. Auto-colours status cells, wraps tables,
   adds table wrappers, and colours action text. */

document.addEventListener('DOMContentLoaded', function () {

  /* ── 1. AUTO-COLOUR STATUS TEXT IN TABLE CELLS ─────────── */
  const statusMap = {
    'upcoming':    'status-upcoming',
    'ongoing':     'status-ongoing',
    'completed':   'status-completed',
    'pending':     'status-pending',
    'accepted':    'status-accepted',
    'rejected':    'status-rejected',
    'idea':        'status-idea',
    'in progress': 'status-progress',
    'open':        'status-upcoming',
    'full':        'status-completed',
    'closed':      'status-completed',
    'looking':     'status-pending',
    'active':      'status-ongoing',
  };

  document.querySelectorAll('table td').forEach(function (td) {
    const text = td.textContent.trim().toLowerCase();
    if (statusMap[text]) {
      td.classList.add(statusMap[text]);
    }
  });

  /* ── 2. WRAP BARE TABLES IN A STYLED CONTAINER ──────────── */
  document.querySelectorAll('table').forEach(function (table) {
    if (!table.closest('.table-container')) {
      const wrapper = document.createElement('div');
      wrapper.className = 'table-container';
      table.parentNode.insertBefore(wrapper, table);
      wrapper.appendChild(table);
    }
  });

  /* ── 3. ADD "No data" EMPTY STATE STYLING ───────────────── */
  document.querySelectorAll('h3').forEach(function (h) {
    const text = h.textContent.toLowerCase();
    if (
      text.includes('no ') ||
      text.includes('not found') ||
      text.includes('empty')
    ) {
      h.style.cssText =
        'text-align:center;padding:50px 20px;color:var(--text3);font-size:15px;font-weight:500;';
      h.insertAdjacentHTML('afterbegin', '<span style="display:block;font-size:42px;margin-bottom:12px;opacity:0.3;">📭</span>');
    }
  });

  /* ── 4. ADD FLASH MESSAGE CLOSE BUTTON ──────────────────── */
  document.querySelectorAll('.alert').forEach(function (alert) {
    const close = document.createElement('button');
    close.innerHTML = '✕';
    close.style.cssText =
      'margin-left:auto;background:none;border:none;color:inherit;cursor:pointer;font-size:16px;opacity:0.7;padding:0 4px;';
    close.addEventListener('click', function () {
      alert.style.transition = 'opacity 0.3s';
      alert.style.opacity = '0';
      setTimeout(function () { alert.remove(); }, 300);
    });
    alert.appendChild(close);
  });

  /* ── 5. ACTIVE NAV LINK HIGHLIGHTING ────────────────────── */
  const currentPath = window.location.pathname;
  document.querySelectorAll('.nav-btn').forEach(function (link) {
    if (link.getAttribute('href') && currentPath.includes(link.getAttribute('href'))) {
      link.style.cssText =
        'color:var(--text);background:rgba(67,97,238,0.18);border-radius:8px;';
    }
  });

  /* ── 6. SMOOTH TABLE ROW FADE-IN ────────────────────────── */
  document.querySelectorAll('table tbody tr').forEach(function (tr, i) {
    tr.style.opacity = '0';
    tr.style.transform = 'translateY(8px)';
    tr.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
    setTimeout(function () {
      tr.style.opacity = '1';
      tr.style.transform = 'translateY(0)';
    }, 40 + i * 35);
  });

  /* ── 7. FORM SUBMIT BUTTON LOADING STATE ────────────────── */
  document.querySelectorAll('form').forEach(function (form) {
    form.addEventListener('submit', function () {
      const btn = form.querySelector('button[type="submit"]');
      if (btn) {
        btn.textContent = 'Processing...';
        btn.disabled = true;
        btn.style.opacity = '0.75';
      }
    });
  });

});
