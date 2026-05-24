/* ============================================
   BLOOM & GROW - Main JavaScript (Static Version)
   ============================================ */

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
  initNavigation();
  initMobileMenu();
  initFilters();
  initScrollReveal();
  initStatsCounter();
  initNewsletterForm();
  initContactForm();
  initTicker();
});

/* ============================================
   Navigation
   ============================================ */
function initNavigation() {
  const nav = document.querySelector('nav');
  if (!nav) return;

  window.addEventListener('scroll', () => {
    nav.classList.toggle('scrolled', window.scrollY > 50);
  });

  const currentPage = window.location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-links a').forEach(link => {
    const href = link.getAttribute('href');
    link.classList.toggle('active', href === currentPage || (currentPage === '' && href === 'index.html'));
  });
}

/* ============================================
   Mobile Menu
   ============================================ */
function initMobileMenu() {
  const toggle = document.querySelector('.mobile-toggle');
  const navLinks = document.querySelector('.nav-links');
  if (!toggle || !navLinks) return;

  toggle.addEventListener('click', () => {
    navLinks.classList.toggle('active');
    toggle.classList.toggle('active');
  });

  navLinks.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      navLinks.classList.remove('active');
      toggle.classList.remove('active');
    });
  });
}

/* ============================================
   Scroll Reveal Animation
   ============================================ */
function initScrollReveal() {
  const elements = document.querySelectorAll(
    '.card, .plant-card, .guide-card, .product-card, .blog-card, .feature-card, .fade-up'
  );
  if (elements.length === 0) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const siblings = Array.from(entry.target.parentElement?.children || []);
        const idx = siblings.indexOf(entry.target);
        setTimeout(() => entry.target.classList.add('visible'), idx * 80);
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1, rootMargin: '0px 0px -30px 0px' });

  elements.forEach(el => observer.observe(el));
}

/* ============================================
   Filter Tabs (Plants / Guides / Shop)
   ============================================ */
function initFilters() {
  const filterContainers = document.querySelectorAll('.plants-page, .guides-page, .shop-page');

  filterContainers.forEach(container => {
    const filterBtns = container.querySelectorAll('.filter-btn');

    filterBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        const filter = btn.dataset.filter;
        const cards = container.querySelectorAll('[data-category]');

        cards.forEach(card => {
          const categories = card.dataset.category.split(',').map(c => c.trim());
          const match = filter === 'all' || categories.includes(filter);

          if (match) {
            card.style.display = '';
            setTimeout(() => card.classList.add('visible'), 50);
          } else {
            card.classList.remove('visible');
            setTimeout(() => { card.style.display = 'none'; }, 300);
          }
        });
      });
    });
  });
}

/* ============================================
   Ticker
   ============================================ */
function initTicker() {
  // CSS animation handles it — nothing needed unless you want JS control
}

/* ============================================
   Stats Counter Animation
   ============================================ */
function initStatsCounter() {
  const statNumbers = document.querySelectorAll('.stat-number');
  if (!statNumbers.length) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = parseInt(el.dataset.value) || 0;
        animateCounter(el, target);
        observer.unobserve(el);
      }
    });
  }, { threshold: 0.5 });

  statNumbers.forEach(s => observer.observe(s));
}

function animateCounter(element, target) {
  let current = 0;
  const step = target / 50;
  const interval = setInterval(() => {
    current += step;
    if (current >= target) {
      element.textContent = target.toLocaleString();
      clearInterval(interval);
    } else {
      element.textContent = Math.floor(current).toLocaleString();
    }
  }, 30);
}

/* ============================================
   Newsletter Form
   ============================================ */
function initNewsletterForm() {
  document.querySelectorAll('.newsletter-form').forEach(form => {
    form.addEventListener('submit', e => {
      e.preventDefault();
      const container = form.closest('.newsletter-container') || form.parentElement;
      container.innerHTML = `
        <div class="success-message" style="text-align:center;">
          <span style="font-size:3rem;">🌱</span>
          <h3 style="margin:1rem 0 0.5rem;">Thank You!</h3>
          <p>Your seed has been planted. Watch your inbox for gardening inspiration!</p>
        </div>`;
    });
  });
}

/* ============================================
   Contact Form
   ============================================ */
function initContactForm() {
  const form = document.querySelector('.contact-form form');
  if (!form) return;

  form.addEventListener('submit', e => {
    e.preventDefault();
    const name = form.querySelector('#name')?.value;
    const email = form.querySelector('#email')?.value;
    const message = form.querySelector('#message')?.value;

    if (!name || !email || !message) {
      showNotification('Please fill in all required fields', 'error');
      return;
    }

    const container = form.closest('.contact-form');
    container.innerHTML = `
      <div class="success-message" style="text-align:center;padding:3rem 1rem;">
        <span style="font-size:3rem;">🌿</span>
        <h3 style="margin:1rem 0 0.5rem;">Message Sent!</h3>
        <p>We'll get back to you within 24 hours. Happy gardening!</p>
      </div>`;
  });
}

/* ============================================
   Notification
   ============================================ */
function showNotification(message, type = 'success') {
  const n = document.createElement('div');
  n.style.cssText = `
    position:fixed;bottom:100px;right:2rem;padding:1rem 1.5rem;
    background:${type === 'error' ? '#e53e3e' : '#2d6a4f'};color:white;
    border-radius:10px;box-shadow:0 10px 30px rgba(0,0,0,0.2);z-index:10000;
    animation:slideIn 0.3s ease-out;`;
  n.textContent = message;
  document.body.appendChild(n);
  setTimeout(() => { n.style.opacity = '0'; n.style.transition = 'opacity 0.3s'; setTimeout(() => n.remove(), 300); }, 3000);
}

// Animation keyframes
const style = document.createElement('style');
style.textContent = `
  @keyframes slideIn { from{transform:translateX(100%);opacity:0} to{transform:translateX(0);opacity:1} }
`;
document.head.appendChild(style);
