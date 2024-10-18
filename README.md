# No Discord No Game

![Banner](https://r2.fivemanage.com/pub/0ngxsaa10qq9.png)

## Descrizione

Questo script Lua per FiveM richiede che i giocatori siano all'interno di un determinato canale vocale Discord per accedere e rimanere sul server FiveM. Questo garantisce un maggiore controllo e un'ulteriore autenticazione per i giocatori del tuo server.

## Caratteristiche

- Richiede che i giocatori siano in un canale vocale Discord specificato per accedere al server.
- Verifica periodica che i giocatori rimangano nel canale vocale specificato, espellendo quelli che non rispettano la regola.
- Utilizza l'API di Discord per ottenere informazioni in tempo reale sullo stato vocale dei giocatori.

## Requisiti

- **ESX Framework**: Utilizzato per ottenere l'oggetto condiviso.
- **Discord Bot**: Un bot Discord configurato con il token e i permessi corretti per gestire il server.
- **Permessi Bot**: Il bot Discord deve avere gli intenti attivati per `GUILD_VOICE_STATES` per accedere agli stati vocali dei membri.

## Installazione

1. **Clona o scarica** questo repository nella tua directory delle risorse di FiveM.
2. Apri il file `server.lua` e configura le seguenti variabili in `Config`:
   - `GuildID`: Inserisci l'ID del tuo server Discord.
   - `BotToken`: Inserisci il token del tuo bot Discord.
   - `VoiceChannelID`: Inserisci l'ID del canale vocale in cui i giocatori devono essere.
3. Assicurati che il bot Discord sia attivo e connesso al tuo server.
4. Aggiungi la risorsa al tuo file `server.cfg`:


## Configurazione Bot Discord

- Crea un bot tramite il [Portale degli sviluppatori Discord](https://discord.com/developers/applications).
- Attiva gli intenti `GUILD_VOICE_STATES` per permettere al bot di leggere gli stati vocali.
- Invita il bot al tuo server Discord con i permessi necessari per leggere gli stati vocali.

## Come Funziona

- Quando un giocatore tenta di connettersi al server, lo script verifica se il suo account Discord è connesso al canale vocale specificato.
- Se il giocatore non è nel canale vocale richiesto, l'accesso viene negato con un messaggio di errore.
- Periodicamente, ogni 3 minuti, lo script verifica che tutti i giocatori connessi siano ancora nel canale vocale. In caso contrario, il giocatore viene espulso dal server.

## Note

- **Stabilità**: Assicurati che il bot sia sempre online per garantire la funzionalità dello script.
- **Debug**: Puoi aggiungere dei log per verificare i dati di risposta e le richieste HTTP in modo da identificare eventuali problemi.

## Contribuzione

Sentiti libero di contribuire a questo progetto aprendo una `Pull Request` o segnalando `Issues`. Qualsiasi suggerimento o miglioramento è benvenuto!

## Licenza

Questo progetto è distribuito sotto la licenza MIT. Sentiti libero di utilizzarlo, modificarlo e distribuirlo secondo i termini della licenza.

## Contatti

- **GitHub**: [emkeyhell](https://github.com/emkeyhell)
- **Email**: [emkeyhell@gmail.com](mailto:emkeyhell@gmail.com)
- **Discord**: [Unisciti al server](https://discord.gg/jjsQU2bFBP)
- **Twitch**: [emkeyhell](https://www.twitch.tv/emkeyhell)
- **Instagram**: [emkeyhell](https://www.instagram.com/emkeyhell)
- **Sito Web**: [emkeyhell.bss.design](https://emkeyhell.bss.design)
- **Itch.io**: [emkeyhell](https://emkeyhell.itch.io/)



