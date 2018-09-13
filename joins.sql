--Create a query to get all fields from the users table
SELECT * FROM users;

--Create a query to get all fields from the posts table where the user_id is 100
SELECT * FROM posts WHERE user_id = 100;

--Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200
SELECT posts.*, users.first_name, users.last_name FROM posts LEFT OUTER JOIN users ON posts.user_id = users.id WHERE users.id = 200;

--Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'
SELECT posts.*, users.username FROM posts LEFT OUTER JOIN users ON posts.user_id = users.id WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

--Create a query to get usernames from the users table where the user has created a post after January 1, 2015
SELECT username FROM users LEFT JOIN posts ON posts.user_id = users.id WHERE posts.created_at > '2015-01-01';

--Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015
SELECT posts.title, posts.content, users.username FROM posts LEFT JOIN users ON posts.user_id = users.id WHERE users.created_at < '2015-01-01';

--Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields
SELECT comments.*, posts.title FROM comments LEFT JOIN posts ON comments.post_id = posts.id;

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015
SELECT comments.*, posts.title, posts.url, comments.body FROM comments LEFT JOIN posts ON comments.post_id = posts.id WHERE posts.created_at < '2015-01-01';


-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015
SELECT comments.*, posts.title, posts.url, comments.body FROM comments LEFT JOIN posts ON comments.post_id = posts.id WHERE posts.created_at > '2015-01-01';

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'
SELECT comments.*, posts.title, posts.url, comments.body FROM comments LEFT JOIN posts ON comments.post_id = posts.id WHERE comments.body LIKE '%USB%';

-- Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )
SELECT posts.title, users.first_name, users.last_name, comments.body 
	FROM comments 
	LEFT JOIN posts 
		ON comments.post_id = posts.id 
	LEFT JOIN users
		ON comments.user_id = users.id
	WHERE comments.body LIKE '%matrix%';

-- Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )
SELECT users.first_name, users.last_name, comments.body
	FROM comments
	LEFT JOIN users
		ON comments.user_id = users.id
	LEFT JOIN posts
		ON comments.post_id = posts.id
	WHERE comments.body LIKE '%SSL%'
	AND posts.content LIKE '%dolorum%';	


-- Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 218 results )
SELECT users.first_name, users.last_name, posts.title, users.username, comments.body
	FROM comments
	LEFT JOIN users
		ON comments.user_id = users.id
	LEFT JOIN posts
		ON comments.post_id = posts.id
	WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%nemo%' 
	OR comments.body LIKE '%firewall%' AND posts.content LIKE '%nemo%';
	
	
--Count how many comments have been written on posts that have been created after July 14, 2015 ( should have one result, the value of the count should be 27)
SELECT COUNT(*) FROM comments LEFT JOIN posts ON comments.post_id = posts.id WHERE posts.created_at > '2015-07-14';


--Find all users who comment about 'programming' ( should have 336 results)
SELECT users.username FROM comments LEFT JOIN users ON comments.user_id = users.id WHERE comments.body LIKE '%programming%';
