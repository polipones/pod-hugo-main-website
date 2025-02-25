#! /bin/sh

sh ./scripts/fetch_contacts.sh

hugo server --disableFastRender --navigateToChanged --templateMetrics --templateMetricsHints --bind 0.0.0.0
