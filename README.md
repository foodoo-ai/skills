# Foodoo for AI assistants

Your [Foodoo](https://foodoo.fit) food diary in Claude, ChatGPT, Gemini, Cursor, VS Code and any other MCP client: log meals from your own words or a photo, see your day as a card, look back over weeks and months, put a dish right by words, add water. Everything you log there shows up in the Foodoo app at once.

**MCP server:** `https://mcp.foodoo.fit` (Streamable HTTP, OAuth 2.1 — you confirm a code in the Foodoo app or on foodoo.fit).

## Install

| Where | How |
|---|---|
| Claude (web, desktop, mobile) | Settings → Connectors → Add custom connector → `https://mcp.foodoo.fit`. For the skill: `./scripts/build-skill-zip.sh`, then Settings → Capabilities → Skills → Upload `dist/foodoo-skill.zip` |
| ChatGPT | Apps → Foodoo → Connect. Until it is listed: Developer mode → create an app with `https://mcp.foodoo.fit` |
| Claude Code | `/plugin marketplace add foodoo-ai/skills`, then `/plugin install foodoo@foodoo`; sign in with `/mcp` |
| Gemini (app and web) | Settings → Connected apps → Custom → Cloud MCP server → `https://mcp.foodoo.fit`, then confirm the code |
| Gemini CLI | `gemini extensions install https://github.com/foodoo-ai/skills`, then `/mcp auth foodoo` |
| Codex | add `[mcp_servers.foodoo]` with `url = "https://mcp.foodoo.fit"` to `~/.codex/config.toml`, then `codex mcp login foodoo` |
| Cursor, VS Code, others | a remote MCP server with the URL above: `{"mcpServers": {"foodoo": {"url": "https://mcp.foodoo.fit"}}}` |

## Tools

| Tool | What it does |
|---|---|
| `log_food` | Logs a meal from the person's words (any language); a quick correction right after fixes the last dish |
| `log_food_photo` | Logs the food in a photo |
| `get_day` | A day of the diary: dishes, totals against targets, water (drawn as a card) |
| `get_stats` | The last N days, day by day (a card with columns) |
| `get_period` | A summary of any period, however long |
| `find_meals` | A dish by name across the whole diary |
| `fix_entry` / `undo_fix` | Corrects a dish by words / takes the correction back |
| `change_portion` | Sets a dish's weight |
| `delete_entry` | Removes a dish |
| `add_water` / `remove_water` | Water |

Prompts: `today`, `week`, `log`. Cards follow both MCP Apps (`ui://foodoo/card-v3.html`) and the ChatGPT Apps SDK.

## What's here

- `.claude-plugin/marketplace.json`, `plugins/foodoo/` — the Claude Code plugin (MCP server, the `foodoo` skill, `/foodoo:today`, `/foodoo:week`, `/foodoo:log`)
- `gemini-extension.json`, `GEMINI.md`, `commands/foodoo/*.toml` — the Gemini CLI extension (`/foodoo:today`…)
- `skills/foodoo/` — the skill for claude.ai (zip it with `scripts/build-skill-zip.sh`)

The server lives in foodoo-server (`src/mcp`, `src/routes/mcp.ts`, OAuth in `src/routes/link.ts`).

## Privacy

The assistant reads the food diary, water, targets and statistics only when you ask it something; it never gets health data from Apple Health, Health Connect or a watch, sleep, cycle, mood, supplements, medication, chats or your email. Disconnect any time in the Foodoo app: Profile → Devices and apps. [Privacy policy](https://foodoo.fit/privacy) · [Terms](https://foodoo.fit/terms) · [Support](https://foodoo.fit/contact)

Foodoo's estimates are for everyday eating, not medical advice.
