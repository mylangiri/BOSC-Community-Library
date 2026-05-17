# Searching the BOSC Resource Database

## jq Queries
'''bash
# List all resource titles
jq '.resources[].title' resources/databases/resources.json

# Filter by language
jq '.resources[] | select(.language == "fr")'
resources/databases/resources.json
# Filter by difficulty
jq '.resources[] | select(.difficulty == "beginner") | .title'
resources/databases/resources.json

# Filter by Category
jq '.resources[] | select(.category == "Mathematics")'
resources/databases/resources.json

# Count resources by Category
jq '.resources | group_by(.category) | map({category: .[0].category,
count: length})' resources/databases/resources.json
'''
