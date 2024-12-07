
#!/bin/bash

# Set the theme name (you can change this)
THEME_NAME="my-jekyll-theme"

# Create the main theme directory
mkdir -p "$THEME_NAME"

# Create the subdirectories
mkdir -p "$THEME_NAME/_includes"
mkdir -p "$THEME_NAME/_layouts"
mkdir -p "$THEME_NAME/_sass"
mkdir -p "$THEME_NAME/assets/css"

# Create the _config.yml file with basic settings
cat <<EOL > "$THEME_NAME/_config.yml"
name: Resume Theme
description: A simple Jekyll theme for resumes.
author: Your Name
theme: "$THEME_NAME"
EOL

# Create the default layout file (_layouts/default.html)
cat <<EOL > "$THEME_NAME/_layouts/default.html"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ page.title }}</title>
  <link rel="stylesheet" href="{{ '/assets/css/resume.css' | relative_url }}">
</head>
<body>
  <div id="resume-preview">
    <div data-scope="vue-smart-pages" data-part="page">
      {{ content }}
    </div>
  </div>
</body>
</html>
EOL

# Create a sample resume CSS file (assets/css/resume.css)
cat <<EOL > "$THEME_NAME/assets/css/resume.css"
/* Backbone CSS for Resume Template 1 */

/* Basic */
#resume-preview [data-scope="vue-smart-pages"][data-part="page"] {
    background-color: white;
    color: black;
    text-align: justify;
    -moz-hyphens: auto;
    -ms-hyphens: auto;
    -webkit-hyphens: auto;
    hyphens: auto;
}

#resume-preview p,
#resume-preview li,
#resume-preview dl {
    margin: 0;
}

/* Headings */
#resume-preview h1,
#resume-preview h2,
#resume-preview h3 {
    font-weight: bold;
}

#resume-preview h1 {
    font-size: 2.13em;
}

#resume-preview h2,
#resume-preview h3 {
    margin-bottom: 5px;
    font-size: 1.2em;
}

#resume-preview h2 {
    border-bottom-style: solid;
    border-bottom-width: 1px;
}

/* Lists */
#resume-preview ul,
#resume-preview ol {
    padding-left: 1.5em;
    margin: 0.2em 0;
}

#resume-preview ul {
    list-style-type: circle;
}

#resume-preview ol {
    list-style-type: decimal;
}

/* Definition Lists */
#resume-preview dl {
    display: flex;
}

#resume-preview dl dt,
#resume-preview dl dd:not(:last-child) {
    flex: 1;
}

/* Text */
#resume-preview :not(span.katex-display) > span.katex {
    font-size: 1em !important;
}

/* SVG & Images */
#resume-preview svg.iconify {
    vertical-align: -0.2em;
}

#resume-preview img {
    max-width: 100%;
}

/* Header */
#resume-preview .resume-header {
    text-align: center;
}

#resume-preview .resume-header h1 {
    text-align: center;
    line-height: 1;
    margin-bottom: 8px;
}

#resume-preview .resume-header-item:not(.no-separator)::after {
    content: " | ";
}

/* Citations */
#resume-preview [data-scope="cross-ref"][data-part="definitions"] {
    padding-left: 1.2em;
}

#resume-preview [data-scope="cross-ref"][data-part="definition"] p {
    margin-left: 0.5em;
}

#resume-preview [data-scope="cross-ref"][data-part="definition"]::marker {
    content: attr(data-label);
}

#resume-preview [data-scope="cross-ref"][data-part="reference"] {
    font-size: 100%;
    top: 0;
}

/* Dark & print mode */
.dark #resume-preview [data-scope="vue-smart-pages"][data-part="page"] {
    background-color: hsl(213, 12%, 15%);
    color: hsl(216, 12%, 84%);
}

@media print {
    .dark #resume-preview [data-scope="vue-smart-pages"][data-part="page"] {
        background-color: white;
        color: black;
    }
}
EOL

# Create the index.md file
cat <<EOL > "$THEME_NAME/index.md"
---
layout: default
title: "Resume"
---

<div class="resume-header">
  <h1>John Doe</h1>
  <div class="resume-header-item">Web Developer</div>
  <div class="resume-header-item">New York, NY</div>
</div>

<h2>Experience</h2>
<ul>
  <li>Senior Web Developer at Tech Corp (2020 - Present)</li>
  <li>Frontend Developer at Web Solutions (2017 - 2020)</li>
</ul>

<h2>Education</h2>
<ul>
  <li>Bachelor's in Computer Science, University of XYZ (2016)</li>
</ul>
EOL

# Output success message
echo "Jekyll theme '$THEME_NAME' has been created successfully!"
