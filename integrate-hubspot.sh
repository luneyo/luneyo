#!/bin/bash

# This script integrates HubSpot Forms into the Luneyo website

# 1. Add HubSpot form styles link in the head section (after luneyo-css.css)
sed -i '' '/<link href="luneyo-css.css" rel="stylesheet">/a\
    <link href="hubspot-form-styles.css" rel="stylesheet">
' index.html

# 2. Replace the FormSubmit form with HubSpot form embed
# Find the start of the contact-form div and replace until the end of that div
sed -i '' '/<div class="contact-form glass">/,/<\/div>$/c\
            <div class="contact-form glass">\
                <!-- HubSpot Form -->\
                <div class="hs-form-frame" data-region="eu1" data-form-id="729cee4f-a064-4e13-9755-b5d04b61213f" data-portal-id="147229097"></div>\
            </div>
' index.html

# 3. Remove the old FormSubmit JavaScript and add HubSpot Forms script
# Remove the old form handling script
sed -i '' '/<script>/,/<\/script>/d' index.html

# 4. Add HubSpot Forms embed script before the existing HubSpot tracking code
sed -i '' '/<!-- Start of HubSpot Embed Code -->/i\
    <!-- HubSpot Forms Embed Script -->\
    <script src="https://js-eu1.hsforms.net/forms/embed/v2.js" defer></script>\

' index.html

echo "HubSpot Forms integration complete!"
