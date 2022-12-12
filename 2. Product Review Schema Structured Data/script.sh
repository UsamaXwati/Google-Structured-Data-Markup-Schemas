#!/bin/bash

# Prompt the user for the product name and review
read -p "Enter the product name: " product_name
read -p "Enter the review: " review

# Create the JSON-LD schema
jsonld=$(cat <<EOF
{
  "@context": "https://schema.org/",
  "@type": "Product",
  "name": "$product_name",
  "review": {
    "@type": "Review",
    "reviewBody": "$review"
  }
}
EOF
)

# Print the generated schema
echo "$jsonld" > schema.txt

echo "$jsonld"
echo "OUTPUT\n"
