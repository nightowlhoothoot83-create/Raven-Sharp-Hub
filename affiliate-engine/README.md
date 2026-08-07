# Raven Affiliate Engine

A central, approval-first affiliate layer for Raven/Ascension sites.

## Goal

Turn existing brand and product pages into relevant affiliate placements without turning the sites into generic coupon blogs.

Flow:

1. Import affiliate offers from approved programs/networks.
2. Normalize them into one catalog.
3. Match only complementary offers to the current brand/page/product.
4. Return ready-to-render recommendation blocks with a clear affiliate disclosure.
5. Track clicks and network conversion data.
6. Replace expired or weak offers while keeping manual approval available for new merchants/programs.

## Guardrails

- Only `approved = 1` offers are eligible for placement.
- Affiliate URLs remain the network/merchant URLs. Raven does not cloak destinations by default.
- Rendered links use `rel="sponsored nofollow"`.
- A visible affiliate disclosure is included with every generated placement block.
- Do not invent prices, discounts, ratings, stock or commission rates. Feed-supplied values may be shown only when current.
- Merchant/network rules override Raven defaults. Amazon and other restricted programs can use dedicated adapters rather than the generic renderer.
- New programs and merchants can remain approval-gated while routine offer rotation is automated.

## Initial endpoints

- `GET /health`
- `POST /api/catalog/import` admin-only normalized offer import
- `POST /api/recommend` return relevant approved offers for a brand/page/product
- `GET /api/embed?site=...&topic=...&limit=3` render an embeddable recommendation block
- `POST /api/events/click` record a first-party click event before the browser follows the direct affiliate URL

## Matching

The first version uses deterministic relevance scoring across:

- site / brand
- product or page title
- categories
- keywords
- offer title, merchant, categories and keywords

This gives us a safe baseline before adding AI semantic scoring. AI can later rerank the top deterministic candidates, but it should not be allowed to recommend an unapproved offer.

## Planned network adapters

1. Awin product feeds / deep links
2. impact.com product catalog
3. direct merchant CSV/API feeds
4. Amazon Associates adapter with program-specific rendering/rules

## Cloudflare

The worker expects a D1 binding named `AFFILIATE_DB` and an encrypted `ADMIN_TOKEN` secret. Optional `ALLOWED_SITES` is a comma-separated host allowlist.

The module lives under Raven Sharp Hub for now so it can share brand context. It can be split into its own repository later without changing the data model or API surface.
