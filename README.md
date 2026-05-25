# Bloom & Grow

A modern, animated gardening website built with Vite and Supabase. The site showcases seasonal gardening inspiration, plant guides, a shop, blog content, and a contact flow.

## ✨ Features

- Responsive landing page with animated hero, ticker, and stats
- Plant, guides, shop, blog, and contact pages
- Supabase-powered data access for plants, products, guides, blog posts, and newsletter/contact submissions
- Vite build pipeline for fast local development and production builds

## 🛠️ Tech Stack

- HTML, CSS, and JavaScript
- Vite 5
- Supabase JavaScript client

## 🚀 Getting Started

### 1. Install dependencies

```bash
npm install
```

### 2. Configure environment variables

Create a `.env` file in the project root and add your Supabase credentials:

```bash

```

### 3. Run the development server

```bash
npm run dev
```

Then open the local URL shown in the terminal (default: http://localhost:3000).

### 4. Build for production

```bash
npm run build
```

The production build will be generated in the `dist/` folder.

## 📁 Project Structure

- `index.html` — Home page
- `plants.html` — Plant catalog
- `guides.html` — Gardening guides
- `shop.html` — Store page
- `blog.html` — Blog posts
- `contact.html` — Contact form
- `main.js` — Interactive UI behavior
- `style.css` — Global styles and animations
- `supabaseClient.js` — Supabase helpers and database access
- `vite.config.js` — Vite configuration

## 🔐 Supabase Setup

This project expects a Supabase project with tables for:

- `plants`
- `products`
- `guides`
- `blog_posts`
- `newsletter_subscribers`
- `contact_messages`
- `cart_items`

If you are using a fresh Supabase project, create the required tables and make sure Row Level Security (RLS) allows the operations used by the app.


## 📝 Notes

- `node_modules/` and `dist/` are ignored in Git
- The site uses remote image URLs in the current version, so you may want to swap them for local assets if needed

## 👤 Author

Built by Irsa Irshad.
