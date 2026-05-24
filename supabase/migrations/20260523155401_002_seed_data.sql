/*
  # Bloom & Grow - Seed Data

  1. Insert initial data for:
    - Plants (13 varieties across categories)
    - Products (12 items across categories)
    - Guides (11 guides across skill levels)
    - Blog posts (6 articles)

  2. Categories
    - Plants: flowers, vegetables, herbs, trees, succulents
    - Products: seeds, tools, soil, pots, accessories
    - Guides: beginner, intermediate, advanced, seasonal
*/

-- Insert Plants
INSERT INTO plants (name, description, category, care_water, care_light, plant_type, image_url, featured) VALUES
('Lavender', 'Fragrant purple blooms perfect for borders and attracting pollinators.', 'flowers', 'Low', 'Full sun', 'Perennial', 'https://images.pexels.com/photos/1083822/pexels-photo-1083822.jpeg?auto=compress&cs=tinysrgb&w=600', true),
('Sunflowers', 'Cheerful giants that brighten any garden and attract beneficial insects.', 'flowers', 'Moderate', 'Full sun', 'Annual', 'https://images.pexels.com/photos/5392932/pexels-photo-5392932.jpeg?auto=compress&cs=tinysrgb&w=600', true),
('Roses', 'Classic and elegant, roses bring timeless beauty and fragrance.', 'flowers', 'Moderate', 'Full sun', 'Perennial', 'https://images.pexels.com/photos/4224250/pexels-photo-4224250.jpeg?auto=compress&cs=tinysrgb&w=600', false),
('Tulips', 'Spring favorites in a rainbow of colors, perfect for beds and borders.', 'flowers', 'Moderate', 'Part sun', 'Bulb', 'https://images.pexels.com/photos-1002703/pexels-photo-1002703.jpeg?auto=compress&cs=tinysrgb&w=600', false),
('Tomatoes', 'Summer garden staples with countless varieties for every taste.', 'vegetables', 'High', 'Full sun', 'Annual', 'https://images.pexels.com/photos-542862/pexels-photo-542862.jpeg?auto=compress&cs=tinysrgb&w=600', true),
('Peppers', 'From sweet bell to fiery habanero, peppers love the summer heat.', 'vegetables', 'Moderate', 'Full sun', 'Annual', 'https://images.pexels.com/photos-5824388/pexels-photo-5824388.jpeg?auto=compress&cs=tinysrgb&w=600', false),
('Lettuce', 'Quick-growing greens perfect for spring and fall harvests.', 'vegetables', 'Moderate', 'Part shade', 'Annual', 'https://images.pexels.com/photos-5824389/pexels-photo-5824389.jpeg?auto=compress&cs=tinysrgb&w=600', false),
('Basil', 'Aromatic herb essential for Italian cooking and companion planting.', 'herbs', 'Moderate', 'Full sun', 'Annual', 'https://images.pexels.com/photos-6356305/pexels-photo-6356305.jpeg?auto=compress&cs=tinysrgb&w=600', true),
('Mint', 'Vigorous grower perfect for teas, cocktails, and repelling pests.', 'herbs', 'High', 'Part sun', 'Perennial', 'https://images.pexels.com/photos-6356312/pexels-photo-6356312.jpeg?auto=compress&cs=tinysrgb&w=600', false),
('Rosemary', 'Hardy, drought-tolerant herb with woody stems and pine scent.', 'herbs', 'Low', 'Full sun', 'Perennial', 'https://images.pexels.com/photos-6356310/pexels-photo-6356310.jpeg?auto=compress&cs=tinysrgb&w=600', false),
('Japanese Maple', 'Elegant ornamental tree with stunning foliage colors through the seasons.', 'trees', 'Moderate', 'Part shade', 'Deciduous', 'https://images.pexels.com/photos-16189148/pexels-photo-16189148.jpeg?auto=compress&cs=tinysrgb&w=600', false),
('Snake Plant', 'Nearly indestructible air purifier, perfect for beginners.', 'succulents', 'Low', 'Any light', 'Indoor', 'https://images.pexels.com/photos/2123482/pexels-photo-2123482.jpeg?auto=compress&cs=tinysrgb&w=600', true),
('Jade Plant', 'Long-lived succulent symbolizing good luck and prosperity.', 'succulents', 'Low', 'Bright light', 'Indoor', 'https://images.pexels.com/photos/676956/pexels-photo-676956.jpeg?auto=compress&cs=tinysrgb&w=600', false),
('Aloe Vera', 'Medicinal succulent with healing gel, easy to grow.', 'succulents', 'Low', 'Bright light', 'Indoor', 'https://images.pexels.com/photos/1083823/pexels-photo-1083823.jpeg?auto=compress&cs=tinysrgb&w=600', false);

-- Insert Products
INSERT INTO products (name, description, category, price, original_price, rating, review_count, image_url, badge) VALUES
('Heirloom Tomato Seeds', 'Premium organic heirloom tomato seeds, 50+ seeds per pack.', 'seeds', 8.99, 12.99, 4.8, 48, 'https://images.pexels.com/photos-6207544/pexels-photo-6207544.jpeg?auto=compress&cs=tinysrgb&w=600', 'SALE'),
('Sunflower Seeds Mix', 'Mixed variety pack with 5 different sunflower types.', 'seeds', 6.99, NULL, 4.9, 67, 'https://images.pexels.com/photos-6207543/pexels-photo-6207543.jpeg?auto=compress&cs=tinysrgb&w=600', NULL),
('Herb Garden Starter Kit', 'Complete kit with 12 herb varieties, pots, and soil.', 'seeds', 24.99, NULL, 4.4, 34, 'https://images.pexels.com/photos-6207545/pexels-photo-6207545.jpeg?auto=compress&cs=tinysrgb&w=600', NULL),
('Premium Garden Tool Set', '6-piece stainless steel tool set with ergonomic handles.', 'tools', 42.99, NULL, 4.9, 128, 'https://images.pexels.com/photos-4503271/pexels-photo-4503271.jpeg?auto=compress&cs=tinysrgb&w=600', 'BESTSELLER'),
('Professional Pruning Shears', 'Sharp bypass pruner with shock absorption system.', 'tools', 28.99, NULL, 4.8, 89, 'https://images.pexels.com/photos-4503272/pexels-photo-4503272.jpeg?auto=compress&cs=tinysrgb&w=600', NULL),
('Copper Watering Can', '2-liter decorative copper watering can with long spout.', 'tools', 34.99, NULL, 4.6, 56, 'https://images.pexels.com/photos-4503273/pexels-photo-4503273.jpeg?auto=compress&cs=tinysrgb&w=600', NULL),
('Organic Potting Soil', '25-quart bag of premium organic potting mix.', 'soil', 18.99, NULL, 4.9, 142, 'https://images.pexels.com/photos-4503278/pexels-photo-4503278.jpeg?auto=compress&cs=tinysrgb&w=600', NULL),
('All-Purpose Organic Fertilizer', '5lb bag of balanced 10-10-10 organic fertilizer.', 'soil', 14.99, 19.99, 4.7, 78, 'https://images.pexels.com/photos-4503280/pexels-photo-4503280.jpeg?auto=compress&cs=tinysrgb&w=600', 'SALE'),
('Modern Ceramic Pot Set', 'Set of 3 geometric ceramic pots with drainage.', 'pots', 49.99, NULL, 4.8, 64, 'https://images.pexels.com/photos/1083822/pexels-photo-1083822.jpeg?auto=compress&cs=tinysrgb&w=600', NULL),
('Macrame Hanging Planter', 'Handwoven cotton macrame plant hanger, 36 inches.', 'pots', 22.99, NULL, 4.5, 41, 'https://images.pexels.com/photos/676956/pexels-photo-676956.jpeg?auto=compress&cs=tinysrgb&w=600', NULL),
('Wooden Plant Labels (50 pack)', 'Eco-friendly birch wood plant markers with pencil.', 'accessories', 9.99, NULL, 4.9, 93, 'https://images.pexels.com/photos-4503285/pexels-photo-4503285.jpeg?auto=compress&cs=tinysrgb&w=600', NULL),
('Bamboo Garden Gloves', 'Pair of breathable bamboo gardening gloves, size M/L.', 'accessories', 12.99, NULL, 4.4, 37, 'https://images.pexels.com/photos-4503290/pexels-photo-4503290.jpeg?auto=compress&cs=tinysrgb&w=600', NULL);

-- Insert Guides
INSERT INTO guides (title, description, skill_level, read_time, image_url, tags) VALUES
('Starting Seeds Indoors', 'Learn the basics of seed starting, from choosing seeds to transplanting seedlings outdoors.', 'beginner', 8, 'https://images.pexels.com/photos-4503273/pexels-photo-4503273.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['seeds', 'indoor', 'basics']),
('Container Gardening 101', 'Everything you need to know about growing plants in pots, perfect for small spaces.', 'beginner', 6, 'https://images.pexels.com/photos-4503261/pexels-photo-4503261.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['containers', 'beginner', 'small-space']),
('Understanding Soil Types', 'A beginner''s guide to soil composition, testing, and improving your garden soil.', 'beginner', 10, 'https://images.pexels.com/photos-4503278/pexels-photo-4503278.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['soil', 'basics', 'preparation']),
('Mastering Compost', 'Turn kitchen scraps into garden gold with our comprehensive composting guide.', 'intermediate', 12, 'https://images.pexels.com/photos-4503280/pexels-photo-4503280.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['composting', 'organic', 'sustainability']),
('Pruning Techniques', 'Learn when and how to prune different plants for healthier growth and better yields.', 'intermediate', 15, 'https://images.pexels.com/photos-4503275/pexels-photo-4503275.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['pruning', 'maintenance', 'techniques']),
('Organic Pest Control', 'Protect your plants naturally with companion planting and beneficial insects.', 'intermediate', 9, 'https://images.pexels.com/photos-4503285/pexels-photo-4503285.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['pests', 'organic', 'natural']),
('Tree Grafting Methods', 'Advanced techniques for grafting fruit trees and creating unique varieties.', 'advanced', 20, 'https://images.pexels.com/photos-4503290/pexels-photo-4503290.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['grafting', 'trees', 'advanced']),
('Hydroponic Systems', 'Set up and maintain soil-less growing systems for year-round harvests.', 'advanced', 25, 'https://images.pexels.com/photos-4503295/pexels-photo-4503295.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['hydroponics', 'indoor', 'advanced']),
('Spring Garden Planning', 'Get your garden ready for the new growing season with our spring checklist.', 'seasonal', 7, 'https://images.pexels.com/photos-4503300/pexels-photo-4503300.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['spring', 'planning', 'seasonal']),
('Fall Harvest & Prep', 'Maximize your harvest and prepare your garden for winter dormancy.', 'seasonal', 11, 'https://images.pexels.com/photos-4503305/pexels-photo-4503305.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['fall', 'harvest', 'seasonal']),
('Winter Garden Care', 'Protect your plants and plan for next year during the quiet winter months.', 'seasonal', 8, 'https://images.pexels.com/photos-4503310/pexels-photo-4503310.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['winter', 'protection', 'seasonal']);

-- Insert Blog Posts
INSERT INTO blog_posts (title, excerpt, content, image_url, tags, read_time, is_featured, published_at) VALUES
('The Complete Spring Garden Planning Guide', 'Everything you need to know about preparing your garden for a productive growing season. From soil preparation to crop selection, we cover it all.', 'Full article content here...', 'https://images.pexels.com/photos-4503350/pexels-photo-4503350.jpeg?auto=compress&cs=tinysrgb&w=800', ARRAY['spring', 'planning', 'guide'], 12, true, '2024-05-20 10:00:00+00'),
('10 Container Gardening Mistakes to Avoid', 'Learn from common pitfalls and grow a thriving container garden on your balcony, patio, or windowsill with these expert tips.', 'Full article content here...', 'https://images.pexels.com/photos-4503355/pexels-photo-4503355.jpeg?auto=compress&cs=tinysrgb&w=800', ARRAY['containers', 'mistakes', 'tips'], 8, true, '2024-05-15 10:00:00+00'),
('Hot vs Cold Composting: Which is Right for You?', 'Compare different composting methods and find the best approach for your garden and lifestyle.', 'Full article content here...', 'https://images.pexels.com/photos-4503360/pexels-photo-4503360.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['composting', 'methods', 'organic'], 10, false, '2024-05-12 10:00:00+00'),
('Why Native Plants Are the Secret to a Low-Maintenance Garden', 'Discover the benefits of incorporating native species into your landscape.', 'Full article content here...', 'https://images.pexels.com/photos-4503365/pexels-photo-4503365.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['native', 'low-maintenance', 'ecology'], 7, false, '2024-05-08 10:00:00+00'),
('Troubleshooting Common Houseplant Problems', 'Yellow leaves? Drooping stems? Learn to diagnose and fix common indoor plant issues.', 'Full article content here...', 'https://images.pexels.com/photos-4503370/pexels-photo-4503370.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['houseplants', 'troubleshooting', 'indoor'], 9, false, '2024-05-05 10:00:00+00'),
('Grow Your Own Salad: A Beginner''s Guide', 'Start a productive salad garden with these easy-to-grow greens and simple tips.', 'Full article content here...', 'https://images.pexels.com/photos-4503375/pexels-photo-4503375.jpeg?auto=compress&cs=tinysrgb&w=600', ARRAY['vegetables', 'salad', 'beginner'], 6, false, '2024-05-01 10:00:00+00');