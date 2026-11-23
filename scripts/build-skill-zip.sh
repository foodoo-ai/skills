#!/bin/sh
# The skill as claude.ai takes it (Settings → Capabilities → Skills → Upload): a zip of the folder.
set -e
cd "$(dirname "$0")/.."
cp plugins/foodoo/skills/foodoo/SKILL.md skills/foodoo/SKILL.md
mkdir -p dist
rm -f dist/foodoo-skill.zip
(cd skills && zip -qr ../dist/foodoo-skill.zip foodoo)
echo "dist/foodoo-skill.zip"
