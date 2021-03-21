---
title: {{ replace .Name "-" " " | title }} # TODO
url: {{ .Name | urlize }} # TODO
slug: {{ .Name | urlize }} # TODO
draft: true
---
{{<linktraslations>}}
