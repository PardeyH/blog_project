import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

// postgreSQL DB
const db = new pg.Client({
    user: "postgres",
    host: "localhost",
    database: "blog",
    password: "atomicFluencers!",
    port: 5432,
  });
  db.connect();

// Middleware
app.use(express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));

let currentUserId = 1;

async function getBlogEntries(){
    const result = await db.query(
        "SELECT * FROM blog_entry ORDER BY id DESC");
    return result.rows;
};

app.get("/", async (req, res) => {
    const blogEntries = await getBlogEntries();
    res.render("index.ejs", {
        blog: blogEntries
    });
});

app.post("/add", async (req, res) => {
    const title = req.body["title"];
    const blogText = req.body["blogText"];
    const date = new Date().toISOString();

    try {
        await db.query(
            "INSERT INTO blog_entry (title, blog_entry, entry_date, user_id) VALUES ($1, $2, $3, $4)",
            [title, blogText, date, currentUserId]
        );
        res.redirect("/");
    } catch (err) {
        console.log(err);
    }
});

app.post("/delete", async (req, res) => {
    const deleteEntryId = req.body.postId;
    try {
        await db.query("DELETE FROM blog_entry WHERE id = $1", [deleteEntryId]);
        res.redirect("/");
    } catch (err) {
        console.log(err);
    }
});

app.post("/edit", async (req, res) => {
    const editEntryId = req.body.postId;
    const blogEntries = await getBlogEntries();
    res.render("editPost.ejs", {
        blog: blogEntries,
        postId: editEntryId
    });
});

app.post("/editBlogEntry", async (req, res) => {
    const postId = req.body.postId;
    const updatedTitle = req.body.title;
    const updatedBlogText = req.body.blogText;
    
    try {
        await db.query(
            "UPDATE blog_entry SET title = ($1), blog_entry = ($2)  WHERE id = $3",
            [updatedTitle, updatedBlogText, postId]
        );
        res.redirect("/");
    } catch (err) {
        console.log(err);
    }


});

app.post("/comment", (req, res) => {
    const blogComment = req.body.comment;

    res.redirect("/");
});

app.listen(port, () => {
    console.log(`Listening on port ${port}`)
});