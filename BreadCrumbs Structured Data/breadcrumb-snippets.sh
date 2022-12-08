#!/bin/bash

# Prompt the user for the path
read -p "Enter the path (separated by slashes): " path

# Split the path into an array of items
items=($(echo $path | tr '/' ' '))

# Generate the JSON-LD schema
jsonld=$(cat <<EOF
{
  "@context": "https://schema.org/",
  "@type": "BreadcrumbList",
  "itemListElement": [
EOF
)

# Add each item to the schema
for i in "${!items[@]}"; do
  jsonld+=$(cat <<EOF
    {
      "@type": "ListItem",
      "position": $(($i+1)),
      "item": {
        "@id": "https://example.com/${items[$i]}",
        "name": "${items[$i]}"
      }
    }
EOF
)
  # Add a comma after each item, except the last one
  if [ $i -lt $((${#items[@]}-1)) ]; then
    jsonld+=","
  fi
done

# Close the schema
jsonld+=$(cat <<EOF
  ]
}
EOF
)

# Print the generated schema
echo "$jsonld"