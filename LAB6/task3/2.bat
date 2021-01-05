sc stop Dnscache
TIMEOUT /t 5
sc queryex type=service state=all | find "SERVICE_NAME" > serviceNew
sc start Dnscashe
Pause