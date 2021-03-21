---
# Will be displayed at top of the page as main heading
title: {{ replace .Name "-" " " | title }} # TODO
# Has to be in format <parent-site/current-site>, e.g. services/network (notice missing slash at the beginning)
url: {{ .Name | urlize }} # TODO
# https://en.wikipedia.org/wiki/Clean_URL#Slug
slug: {{ .Name | urlize }} # TODO
# Defines sorting of pages in parent list
weight: # TODO

draft: true # Remove when ready to publish page
---
{{<linktraslations>}} <!-- TODO: remove before publishing draft -->

<!-- Write page contents here -->
<!-- Use Markdown syntax: https://www.markdownguide.org/basic-syntax -->
