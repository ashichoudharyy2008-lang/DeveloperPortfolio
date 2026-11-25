# API Integration Report

**Name:** Ashi Choudhary  
**Roll Number:** 2601730018

## 1. GitHub API

- API: https://api.github.com/users/ashichoudhary2008-lang
- Tool: curl
- Data format: JSON
- Parser: jq

### Extracted Information
- Name: Ashi Choudhary
- Public Repositories: 3
- Followers: 0
- Account Created: 2026-06-15

## 2. JSONPlaceholder API

- API: https://jsonplaceholder.typicode.com/posts
- Tool: curl
- Data format: JSON
- Total Posts Retrieved: 100

## 3. Files Created

- github_profile.json
- sample_posts.json
- api_summary.md

## Conclusion

Successfully retrieved data from two public REST APIs
using curl and processed JSON responses using jq.

## 4. REST API Explanation

A REST API (Representational State Transfer API) allows
different applications to communicate and exchange data
over the internet using HTTP requests. It commonly uses
JSON format to send and receive structured information.

## 5. HTTP Status Codes

- 200 OK: The request was successful and the server
  returned the requested data.
- 404 Not Found: The requested resource could not be
  found on the server.

## 6. jq Filter Explanation

The following jq filter was used:

`{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}`

- name:.name extracts the GitHub user's name.
- repos:.public_repos extracts the number of public repositories.
- followers:.followers extracts the follower count.
- joined:.created_at extracts the account creation date.

The jq tool processes JSON data and extracts specific
fields in a readable format.
