#!/bin/bash
# <xbar.title>Home Countdown</xbar.title>
# <xbar.version>v1.1</xbar.version>
# <xbar.author>Eshani</xbar.author>
# <xbar.author.github>eshentials</xbar.author.github>
# <xbar.desc>Displays a fancy countdown to your homecoming date with optional GUI input.</xbar.desc>
# <xbar.dependencies>bash, osascript</xbar.dependencies>
# <xbar.abouturl>https://github.com/your-repo-or-readme</xbar.abouturl>
# <xbar.refreshTime>24h</xbar.refreshTime>

CONFIG_FILE="$HOME/.home_target_date"

# Default fallback date if config not found
DEFAULT_DATE="2025-05-15"

# Read target date from config or fallback
if [[ -f "$CONFIG_FILE" ]]; then
  TARGET_DATE=$(cat "$CONFIG_FILE")
else
  TARGET_DATE="$DEFAULT_DATE"
fi

# Format today's date
TODAY=$(date +%Y-%m-%d)

# Calculate remaining days
TARGET_EPOCH=$(date -jf "%Y-%m-%d" "$TARGET_DATE" +%s 2>/dev/null)
TODAY_EPOCH=$(date -jf "%Y-%m-%d" "$TODAY" +%s)

# Safety check: if date format is invalid
if [[ -z "$TARGET_EPOCH" ]]; then
  echo "❌ Invalid Date"
  echo "---"
  echo "⚙️ Set Home Date | bash='osascript' param1='-e' param2='tell app \"System Events\" to display dialog \"Enter target date (YYYY-MM-DD):\" default answer \"$DEFAULT_DATE\"' param3='-e' param4='set theDate to text returned of result' param5='-e' param6='do shell script \"echo \" & theDate & \" > $CONFIG_FILE\"'"
  exit
fi

DAYS_REMAINING=$(( (TARGET_EPOCH - TODAY_EPOCH) / 86400 ))

# 🎯 Top bar display
if [ "$DAYS_REMAINING" -gt 1 ]; then
  echo "🏡 $DAYS_REMAINING days"
elif [ "$DAYS_REMAINING" -eq 1 ]; then
  echo "🏡 1 day!"
elif [ "$DAYS_REMAINING" -eq 0 ]; then
  echo "🏠 Today!"
else
  echo "✨ You're home!"
fi

# ⬇️ Dropdown section
echo "---"
echo "📅 Target: $TARGET_DATE"
echo "📆 Today:  $TODAY"
echo "⏳ Days Left: $DAYS_REMAINING"
echo "---"
echo "✏️ Change Home Date | bash='osascript' param1='-e' param2='tell app \"System Events\" to display dialog \"Enter target date (YYYY-MM-DD):\" default answer \"$TARGET_DATE\"' param3='-e' param4='set theDate to text returned of result' param5='-e' param6='do shell script \"echo \" & theDate & \" > $CONFIG_FILE\"' refresh=true"
