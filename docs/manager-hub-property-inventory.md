# Raven Sharp Hub → Manager Hub Property Inventory

Branch-only inventory. No production connection, merge or deploy is authorised by this file.

The Raven Sharp Hub itself should be represented in Ascension Manager Hub as a managed property with repository, deployment, health, visual-regression and repair status.

Known Raven Sharp repositories currently discovered:

- `nightowlhoothoot83-create/Raven-Sharp-Hub`
- `nightowlhoothoot83-create/Raven-Sharp-POD-Automation`
- `nightowlhoothoot83-create/Raven-Sharp-Content-Creator`
- `nightowlhoothoot83-create/Raven-Sharp-Ad-Manager`
- `nightowlhoothoot83-create/Raven-Sharp-Book-Creator`
- `nightowlhoothoot83-create/Raven-Sharp-Image-Optimiser-Upscaler`
- `nightowlhoothoot83-create/Raven-Sharp-Smart-AI-Cleaner`
- `nightowlhoothoot83-create/Raven-Sharp-Smart-Cleaner-Web`
- `nightowlhoothoot83-create/Raven-Sharp-Store-Ops`
- `nightowlhoothoot83-create/Raven-Sharp-QA-Agent`

Repository existence does not prove the live deployment is bound to the correct repository/branch. Manager Hub should verify and classify each live property as `Connected`, `Missing repo`, `Wrong repo`, or `Unknown`.

The two Smart Cleaner repositories require a relationship/deployment audit so the Hub does not accidentally treat two codebases as one deployment or duplicate monitoring.
