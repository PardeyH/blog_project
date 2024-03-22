CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(45),
    user_password VARCHAR(45)
);

/* Many To One */
CREATE TABLE blog_entry (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250),
    blog_entry TEXT,
    entry_date DATE,
    user_id INTEGER REFERENCES users(id)
);

/* Data */
INSERT INTO users (user_name, user_password)
VALUES ('PardeyH', 'password'),('Bee', '12345');
INSERT INTO blog_entry (title, blog_entry, entry_date, user_id)
VALUES ('Lorem title', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', now(), 1),
('Lorem title2', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', now() ,2);


/* Join */
SELECT * 
FROM users
JOIN blog_entry
ON users.id = user_id


/* Many To One */
CREATE TABLE comment (
    id SERIAL PRIMARY KEY,
    comment_text TEXT,
    entry_id REFERENCES entry(id),
    user_id REFERENCES user(id)
);