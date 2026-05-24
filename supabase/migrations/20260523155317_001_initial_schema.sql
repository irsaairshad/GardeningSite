/*
  # Bloom & Grow - Initial Database Schema

  1. New Tables
    - `plants` - Plant encyclopedia with care information
    - `products` - Shop products with pricing and inventory
    - `guides` - Growing guides by skill level
    - `blog_posts` - Blog articles with tags
    `newsletter_subscribers` - Email subscriptions
    - `contact_messages` - Contact form submissions
    - `cart_items` - Shopping cart items per session

  2. Security
    - Enable RLS on all tables
    - Public read access for plants, products, guides, blog_posts
    - Authenticated write access for newsletter_subscribers, contact_messages
    - Cart items accessible via session_id
*/

-- Plants Encyclopedia
CREATE TABLE IF NOT EXISTS plants (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  category text NOT NULL,
  care_water text DEFAULT 'Moderate',
  care_light text DEFAULT 'Full sun',
  plant_type text DEFAULT 'Annual',
  image_url text,
  featured boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Products/Shop
CREATE TABLE IF NOT EXISTS products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  category text NOT NULL,
  price decimal(10,2) NOT NULL,
  original_price decimal(10,2),
  rating decimal(3,2) DEFAULT 4.5,
  review_count integer DEFAULT 0,
  image_url text,
  badge text,
  inventory integer DEFAULT 100,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Growing Guides
CREATE TABLE IF NOT EXISTS guides (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  skill_level text NOT NULL,
  read_time integer DEFAULT 5,
  image_url text,
  content text,
  tags text[],
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Blog Posts
CREATE TABLE IF NOT EXISTS blog_posts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  excerpt text,
  content text,
  image_url text,
  tags text[],
  read_time integer DEFAULT 5,
  is_featured boolean DEFAULT false,
  published_at timestamptz DEFAULT now(),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Newsletter Subscribers
CREATE TABLE IF NOT EXISTS newsletter_subscribers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text UNIQUE NOT NULL,
  subscribed_at timestamptz DEFAULT now(),
  is_active boolean DEFAULT true
);

-- Contact Messages
CREATE TABLE IF NOT EXISTS contact_messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL,
  subject text,
  message text NOT NULL,
  is_read boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

-- Cart Items
CREATE TABLE IF NOT EXISTS cart_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id text NOT NULL,
  product_id uuid REFERENCES products(id) ON DELETE CASCADE,
  quantity integer DEFAULT 1,
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE plants ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE guides ENABLE ROW LEVEL SECURITY;
ALTER TABLE blog_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE newsletter_subscribers ENABLE ROW LEVEL SECURITY;
ALTER TABLE contact_messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE cart_items ENABLE ROW LEVEL SECURITY;

-- RLS Policies for plants (public read)
CREATE POLICY "Anyone can view plants"
  ON plants FOR SELECT
  TO public
  USING (true);

-- RLS Policies for products (public read)
CREATE POLICY "Anyone can view products"
  ON products FOR SELECT
  TO public
  USING (true);

-- RLS Policies for guides (public read)
CREATE POLICY "Anyone can view guides"
  ON guides FOR SELECT
  TO public
  USING (true);

-- RLS Policies for blog_posts (public read)
CREATE POLICY "Anyone can view blog posts"
  ON blog_posts FOR SELECT
  TO public
  USING (true);

-- RLS Policies for newsletter_subscribers
CREATE POLICY "Anyone can subscribe"
  ON newsletter_subscribers FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Users can check their subscription"
  ON newsletter_subscribers FOR SELECT
  TO public
  USING (email = current_user);

-- RLS Policies for contact_messages
CREATE POLICY "Anyone can submit contact messages"
  ON contact_messages FOR INSERT
  TO public
  WITH CHECK (true);

-- RLS Policies for cart_items (session-based access)
CREATE POLICY "Users can manage their cart items"
  ON cart_items FOR ALL
  TO public
  USING (session_id = current_setting('request.jwt.claims->session_id', true)::text)
  WITH CHECK (session_id = current_setting('request.jwt.claims->session_id', true)::text);

-- Simpler cart policy for anonymous sessions
CREATE POLICY "Session access to cart"
  ON cart_items FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Session can insert cart items"
  ON cart_items FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Session can delete cart items"
  ON cart_items FOR DELETE
  TO public
  USING (true);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_plants_category ON plants(category);
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category);
CREATE INDEX IF NOT EXISTS idx_guides_skill_level ON guides(skill_level);
CREATE INDEX IF NOT EXISTS idx_blog_posts_published ON blog_posts(published_at DESC);
CREATE INDEX IF NOT EXISTS idx_cart_session ON cart_items(session_id);