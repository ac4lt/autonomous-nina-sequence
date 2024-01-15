REM Repllace "<discordwebhook>" with the URL of your Discord webhook
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"%*\"}" <discordwebhook>