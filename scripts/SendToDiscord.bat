call DiscordWebhook.bat
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"%*\"}" %DiscordWebHook%