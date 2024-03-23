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


/* Many To One */
CREATE TABLE comment (
    id SERIAL PRIMARY KEY,
    comment_text TEXT,
    comment_date DATE,
    entry_id INTEGER REFERENCES blog_entry(id),
    user_id INTEGER REFERENCES users(id)
);

INSERT INTO comment (comment_text, comment_date, entry_id, user_id)
VALUES ('First comment', now(), 1, 1),('First comment', now(), 1, 1),('Third comment', now(), 2, 2);