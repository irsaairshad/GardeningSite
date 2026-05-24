import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_SUPABASE_ANON_KEY;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Helper functions for database operations

// Plants
export async function getPlants(category = 'all') {
  let query = supabase
    .from('plants')
    .select('*')
    .order('created_at', { ascending: false });

  if (category !== 'all') {
    query = query.eq('category', category);
  }

  const { data, error } = await query;
  if (error) throw error;
  return data;
}

export async function getFeaturedPlants() {
  const { data, error } = await supabase
    .from('plants')
    .select('*')
    .eq('featured', true)
    .limit(3);

  if (error) throw error;
  return data;
}

// Products
export async function getProducts(category = 'all') {
  let query = supabase
    .from('products')
    .select('*')
    .order('created_at', { ascending: false });

  if (category !== 'all') {
    query = query.eq('category', category);
  }

  const { data, error } = await query;
  if (error) throw error;
  return data;
}

export async function getProductById(id) {
  const { data, error } = await supabase
    .from('products')
    .select('*')
    .eq('id', id)
    .single();

  if (error) throw error;
  return data;
}

// Guides
export async function getGuides(skillLevel = 'all') {
  let query = supabase
    .from('guides')
    .select('*')
    .order('created_at', { ascending: false });

  if (skillLevel !== 'all') {
    query = query.eq('skill_level', skillLevel);
  }

  const { data, error } = await query;
  if (error) throw error;
  return data;
}

// Blog Posts
export async function getBlogPosts(limit = 10) {
  const { data, error } = await supabase
    .from('blog_posts')
    .select('*')
    .order('published_at', { ascending: false })
    .limit(limit);

  if (error) throw error;
  return data;
}

export async function getFeaturedPosts() {
  const { data, error } = await supabase
    .from('blog_posts')
    .select('*')
    .eq('is_featured', true)
    .order('published_at', { ascending: false });

  if (error) throw error;
  return data;
}

// Newsletter
export async function subscribeNewsletter(email) {
  const { data, error } = await supabase
    .from('newsletter_subscribers')
    .insert([{ email }])
    .select()
    .single();

  if (error) {
    // Check if it's a duplicate email error
    if (error.code === '23505') {
      throw new Error('This email is already subscribed!');
    }
    throw error;
  }
  return data;
}

export async function checkSubscription(email) {
  const { data, error } = await supabase
    .from('newsletter_subscribers')
    .select('*')
    .eq('email', email)
    .maybeSingle();

  if (error) throw error;
  return data;
}

// Contact Messages
export async function submitContactForm({ name, email, subject, message }) {
  const { data, error } = await supabase
    .from('contact_messages')
    .insert([{ name, email, subject, message }])
    .select()
    .single();

  if (error) throw error;
  return data;
}

// Cart
export async function getCartItems(sessionId) {
  const { data, error } = await supabase
    .from('cart_items')
    .select(`
      id,
      quantity,
      product_id,
      products (*)
    `)
    .eq('session_id', sessionId);

  if (error) throw error;
  return data;
}

export async function addToCart(sessionId, productId, quantity = 1) {
  // Check if item already exists
  const { data: existing } = await supabase
    .from('cart_items')
    .select('*')
    .eq('session_id', sessionId)
    .eq('product_id', productId)
    .maybeSingle();

  if (existing) {
    // Update quantity
    const { data, error } = await supabase
      .from('cart_items')
      .update({ quantity: existing.quantity + quantity })
      .eq('id', existing.id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  // Insert new item
  const { data, error } = await supabase
    .from('cart_items')
    .insert([{ session_id: sessionId, product_id: productId, quantity }])
    .select()
    .single();

  if (error) throw error;
  return data;
}

export async function removeFromCart(sessionId, productId) {
  const { error } = await supabase
    .from('cart_items')
    .delete()
    .eq('session_id', sessionId)
    .eq('product_id', productId);

  if (error) throw error;
}

export async function clearCart(sessionId) {
  const { error } = await supabase
    .from('cart_items')
    .delete()
    .eq('session_id', sessionId);

  if (error) throw error;
}

// Get or create session ID
export function getSessionId() {
  let sessionId = localStorage.getItem('bloom_session_id');
  if (!sessionId) {
    sessionId = crypto.randomUUID();
    localStorage.setItem('bloom_session_id', sessionId);
  }
  return sessionId;
}
