#!/usr/bin/env python3
import requests
import os
import sys

# if (len(sys.argv) == 0):
#     print("./add_gogs_repo.py")
#     exit(1)

# name = sys.argv[1]
name = 'app'
# print(f"Name: {name}")

# os.system(f"mkdir \"{name}\"")
os.chdir(f"./{name}")

gogsUser = "zurich"  # <-- replace with your username
gogsHost = "http://localhost:3000"  # <-- replace with your Gogs server
url = f"{gogsHost}/api/v1/admin/users/{gogsUser}/repos"
authToken = os.environ.get('GOGS_TOKEN')

createResponse = requests.post(
    url,
    data={
        'name': 'zurich_webapp',
        'description': 'Zurich WebApp Gogs repository.',
        'private': False
    },
    headers={"Authorization": f"token {authToken}"}
)
createJson = createResponse.json()

gitUrl = createJson['clone_url']
# Sanitize if necessary:
# gitUrl = gitUrl.replace(':3000/', '/').replace('http://', 'https://')

gitUrl = gitUrl.replace('http://', 'http://zurich:zurich@')

print(f"Response: {createJson}")
print(f"Git URL: {gitUrl}")

print("Initializing git repository...")
os.system("git init")
print("Adding files...")
os.system("git add *")
print("Committing...")
os.system("git commit -m \"Initial commit\"")
print("Adding gogs as remote...")
os.system("git remote add gogs " + gitUrl)
print("Pushing...")
os.system("git push -u gogs master")
