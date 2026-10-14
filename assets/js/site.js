/* ntust-thesis site behaviour: language switch, tabs, copy buttons. */
(function () {
  'use strict';

  var root = document.documentElement;
  var STORAGE_KEY = 'ntust-thesis-lang';

  /* ---------- Language switch ---------- */

  function applyLang(lang, save) {
    root.setAttribute('data-ui-lang', lang);
    root.setAttribute('lang', lang === 'zh' ? 'zh-Hant' : 'en');
    document.querySelectorAll('[data-set-lang]').forEach(function (btn) {
      btn.setAttribute('aria-pressed', String(btn.getAttribute('data-set-lang') === lang));
    });
    if (save) {
      try { localStorage.setItem(STORAGE_KEY, lang); } catch (e) { /* storage unavailable */ }
    }
  }

  document.querySelectorAll('[data-set-lang]').forEach(function (btn) {
    btn.addEventListener('click', function () {
      applyLang(btn.getAttribute('data-set-lang'), true);
    });
  });
  applyLang(root.getAttribute('data-ui-lang') || 'en', false);

  /* ---------- Tabs ---------- */

  document.querySelectorAll('[data-tabs]').forEach(function (group) {
    var tabs = Array.prototype.slice.call(group.querySelectorAll('[role="tab"]'));

    function select(tab, focus) {
      tabs.forEach(function (t) {
        var selected = t === tab;
        t.setAttribute('aria-selected', String(selected));
        t.tabIndex = selected ? 0 : -1;
        var panel = document.getElementById(t.getAttribute('aria-controls'));
        if (panel) panel.hidden = !selected;
      });
      if (focus) tab.focus();
    }

    tabs.forEach(function (tab, i) {
      tab.addEventListener('click', function () { select(tab, false); });
      tab.addEventListener('keydown', function (e) {
        var next = null;
        if (e.key === 'ArrowRight') next = tabs[(i + 1) % tabs.length];
        if (e.key === 'ArrowLeft') next = tabs[(i - 1 + tabs.length) % tabs.length];
        if (e.key === 'Home') next = tabs[0];
        if (e.key === 'End') next = tabs[tabs.length - 1];
        if (next) { e.preventDefault(); select(next, true); }
      });
    });

    var initial = tabs.filter(function (t) { return t.getAttribute('aria-selected') === 'true'; })[0] || tabs[0];
    /* Show the Chinese edition first to visitors reading the site in Chinese. */
    if (group.querySelector('#tab-ed-zh') && root.getAttribute('data-ui-lang') === 'zh') {
      initial = group.querySelector('#tab-ed-zh');
    }
    if (initial) select(initial, false);
  });

  /* ---------- Copy buttons on code blocks ---------- */

  if (navigator.clipboard) {
    document.querySelectorAll('pre > code').forEach(function (code) {
      var pre = code.parentElement;
      if (pre.closest('.tree')) return;
      var btn = document.createElement('button');
      btn.type = 'button';
      btn.className = 'copy-btn';
      btn.textContent = 'Copy';
      btn.setAttribute('aria-label', 'Copy code');
      btn.addEventListener('click', function () {
        navigator.clipboard.writeText(code.innerText.replace(/\n$/, '')).then(function () {
          btn.textContent = 'Copied';
          btn.classList.add('copied');
          setTimeout(function () { btn.textContent = 'Copy'; btn.classList.remove('copied'); }, 1600);
        });
      });
      pre.appendChild(btn);
    });
  }
})();
