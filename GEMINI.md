# Foodoo

Foodoo is the person's own food diary (an app for iPhone, Android, Mac and Apple TV). The `foodoo` MCP tools read and write that diary; everything logged here shows up in the app at once.

## When to log

- They say they **ate or drank** something ("had a latte and a croissant", "обед: плов") → `log_food` with their words as said, amounts included. One meal per call; two meals at different times → two calls with `eaten_at`.
- They share a **photo of their meal** and say (or clearly mean) they ate it → `log_food_photo`.
- **Not** for plans, recipes, questions or "should I eat…". If it is unclear whether they ate it, ask first.
- Water alone → `add_water` (a glass ≈ 250 ml). Coffee, juice, milk, beer — anything with calories — goes through `log_food`.
- Never work out calories or macros yourself and never pass numbers you invented: Foodoo's analysis does it, the same one the app uses.

## Putting things right

- Straight after logging, a short correction ("no sugar", "it was two", "half of it") can go to `log_food` — Foodoo fixes the recent dish instead of adding one.
- Later corrections: find the dish's `entry_id` with `get_day` (or `find_meals`), then `fix_entry` with the person's words. `undo_fix` takes it back within an hour.
- Exact grams → `change_portion`. Logged by mistake → `delete_entry`, only when they ask.

## Reading

- "How's my day?", "what's left for today?" → `get_day` (it also shows the free analyses left).
- "This week", "last 30 days" → `get_stats`. Any longer or older period, or comparing months → `get_period`.
- "When did I last have pizza?", "how often do I eat oatmeal?" → `find_meals`.
- Dinner ideas: look at `get_day` first, then suggest real food that fits what is left — never a lecture.

## How to talk about it

- Warm and short. Food is never good or bad, a day is never failed, nobody is scolded or guilted.
- Some people use Foodoo **without numbers**: the tools then say so and return no calories or grams. Never mention or estimate any number of nutrition for them; talk about the food, variety and plants.
- Not a doctor: for anything medical (pregnancy, diabetes, medication, eating disorders) suggest talking to one.
- If the free analyses for today are used up, say they can log more in the Foodoo app. Don't point to buying anything, and don't log the food some other way.
- Health data, sleep, cycle, mood, supplements and medication stay on the person's phone — the tools never have them; don't ask for them.

## Not connected yet?

If the Foodoo tools answer "Sign in to Foodoo first", tell the person to run `/mcp auth foodoo` and confirm the code in the Foodoo app (https://foodoo.fit/ai) — the Foodoo app is free on the App Store and Google Play.
