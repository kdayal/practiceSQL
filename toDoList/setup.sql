-- Add users
INSERT INTO users (name, email) VALUES
('John Smith', 'john.smith@gmail.com'),
('Lisa Williams', 'lisa.williams@gmail.com'),
('Ruby James', 'ruby.james@outlook.com');

SET @johnsUserId = (SELECT id FROM users WHERE email = 'john.smith@gmail.com');
SET @lisasUserId = (SELECT id FROM users WHERE email = 'lisa.williams@gmail.com');
SET @rubysUserId = (SELECT id FROM users WHERE email = 'ruby.james@outlook.com');

INSERT INTO lists (user_id, name) VALUES
(@johnsUserId, 'Birthday Shopping'),
(@johnsUserId, 'Moving House'),
(@lisasUserId, 'Grocery Shopping'),
(@rubysUserId, 'Wedding Shopping');

-- TODO use variables to reduce the number of duplicate queries
SET @johnsBirthdayShoppingListId = (SELECT id FROM lists WHERE name = 'Birthday Shopping' AND user_id = @johnsUserId);

SET @lisasGrocerryShoppingListId = (SELECT id FROM lists WHERE name = 'Grocery Shopping' AND user_id = @lisasUserId);

SET @rubysWeddingShoppingListId = (SELECT id FROM lists WHERE name = 'Wedding Shopping' AND user_id = @rubysUserId);

INSERT INTO listItems (list_id, name, status, priority) VALUES
(@johnsBirthdayShoppingListId, 'Cake', 'not-started', 'high'),
(@johnsBirthdayShoppingListId, 'Dress', 'done', 'high'),
(@johnsBirthdayShoppingListId, 'Toy', 'not-started', 'low'),
(@johnsBirthdayShoppingListId, 'Ballons', 'not-started', 'high'),
(@johnsBirthdayShoppingListId, 'Order Pizza', 'not-started', 'medium'),
(@johnsBirthdayShoppingListId, 'Snacks', 'done', 'high'),
(@johnsBirthdayShoppingListId, 'Lollies', 'not-started', 'low'),

(@lisasGrocerryShoppingListId, 'Milk', 'not-started', 'high'),
(@lisasGrocerryShoppingListId, 'Egg', 'not-started', 'high'),
(@lisasGrocerryShoppingListId, 'Bread', 'not-started', 'low'),
(@lisasGrocerryShoppingListId, 'Pasta', 'not-started', 'low'),
(@lisasGrocerryShoppingListId, 'Wraps', 'not-started', 'medium'),
(@lisasGrocerryShoppingListId, 'chicken', 'not-started', 'medium'),
(@lisasGrocerryShoppingListId, 'Potato', 'not-started', 'medium'),
(@lisasGrocerryShoppingListId, 'Tomatoes', 'not-started', 'high'),

(@rubysWeddingShoppingListId, 'Shoes', 'not-started', 'high'),
(@rubysWeddingShoppingListId, 'Dress', 'not-started', 'high'),
(@rubysWeddingShoppingListId, 'Purse', 'not-started', 'high'),
(@rubysWeddingShoppingListId, 'Gift', 'not-started', 'high');
