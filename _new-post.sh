# Create a post with today's date
# Usage: ./_new-post.sh "post-title"

# Get current date in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)
current_time=$(date +%H:%M:%S)

# Sanitize the title for filename (replace spaces with hyphens, lowercase)
sanitized_title=$(echo "$1" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]//g')

# Create the post file with Jekyll front matter
cat > "_posts/${current_date}-${sanitized_title}.md" << EOF
---
layout: post
title:  "$1"
date:   ${current_date} ${current_time} +1000
categories: 
---
EOF