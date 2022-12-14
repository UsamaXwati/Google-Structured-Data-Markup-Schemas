#!/bin/bash

# Prompt the user for a question
read -p "Enter a question: " question

# Prompt the user for an answer
read -p "Enter an answer: " answer

# Create a JSON-LD object with the question and answer
faq_jsonld="{
  \"@context\": \"http://schema.org\",
  \"@type\": \"FAQPage\",
  \"mainEntity\": [{
    \"@type\": \"Question\",
    \"name\": \"$question\",
    \"acceptedAnswer\": {
      \"@type\": \"Answer\",
      \"text\": \"$answer\"
    }
  }]
}"

# Write the JSON-LD object to a file named "faq.jsonld"
echo $faq_jsonld > faq.txt

echo "FAQ structure created in faq.txt \n You may copy and use it now"
read