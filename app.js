const express = require('express');
const axios = require('axios');
const fs = require('fs-extra');
const path = require('path');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

const GITHUB_API = 'https://api.github.com';
const GITHUB_TOKEN = process.env.GITHUB_TOKEN; // Make sure to replace this with your actual GitHub token

// Middleware to set headers for GitHub API requests
const githubHeaders = {
    headers: {
        'Authorization': `token ${GITHUB_TOKEN}`,
        'Accept': 'application/vnd.github.v3+json'
    }
};

// Endpoint to create a new page on GitHub
app.post('/create-page', async (req, res) => {
    const { owner, repo, path, content, message } = req.body;

    try {
        const response = await axios.put(`${GITHUB_API}/repos/${owner}/${repo}/contents/${path}`, {
            message: message,
            content: Buffer.from(content).toString('base64')
        }, githubHeaders);

        res.json({ success: true, data: response.data });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// Endpoint to display videos
app.get('/videos', (req, res) => {
    const videoDirectory = path.join(__dirname, 'public', 'videos');

    fs.readdir(videoDirectory, (err, files) => {
        if (err) {
            return res.status(500).send('Error reading video directory');
        }

        const videos = files.filter(file => file.endsWith('.mp4'));
        res.render('videos', { videos });
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
