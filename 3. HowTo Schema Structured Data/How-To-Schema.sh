#!/bin/bash

# create a new JSON file for the schema
touch schema.json

# add the basic structure of the schema to the JSON file
echo '{
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "",
  "description": "",
  "steps": [
    {
      "@type": "HowToStep",
      "text": ""
    }
  ]
}' > schema.json

# prompt the user to enter values for the schema properties
read -p "Enter the name of the how-to article: " name
read -p "Enter a description for the article: " description
read -p "Enter the first step for the how-to: " step

# update the schema with the user-provided values
sed -i -e 's/"name": ""/"name": "'"$name"'"/' schema.json
sed -i -e 's/"description": ""/"description": "'"$description"'"/' schema.json
sed -i -e 's/"text": ""/"text": "'"$step"'"/' schema.json

# print the completed schema to the terminal
cat schema.json

