-- Questo script richiede che l'utente sia in un determinato canale vocale Discord per accedere e rimanere nel server FiveM.
-- Assicurati di aver configurato correttamente il tuo bot Discord e di ottenere i valori necessari per GuildID, BotToken e VoiceChannelID.

ESX = exports['es_extended']:getSharedObject()

local Config = {
    GuildID = '<INSERISCI IL TUO GUILD ID QUI>', -- L'ID del tuo server Discord
    BotToken = "<INSERISCI IL TUO TOKEN DEL BOT QUI>", -- Il token del tuo bot Discord
    VoiceChannelID = '<INSERISCI IL TUO VOICE CHANNEL ID QUI>' -- L'ID del canale vocale richiesto
}

-- Ottieni ID Discord del giocatore
local function ExtractDiscordId(playerId)
    for _, identifier in ipairs(GetPlayerIdentifiers(playerId)) do
        if identifier:find("discord:") then
            return identifier:sub(9)
        end
    end
    return nil
end

-- Verifica se il player e presente nel canale vocale
local function CheckPlayerVoiceChannel(discordId, onResult)
    if not discordId then return onResult(false) end

    local apiUrl = string.format("https://discord.com/api/v9/guilds/%s/voice-states/%s", Config.GuildID, discordId)
    local headers = {
        ["Authorization"] = "Bot " .. Config.BotToken,
        ["Content-Type"] = "application/json"
    }

    PerformHttpRequest(apiUrl, function(statusCode, response)
        local inVoiceChannel = false
        if statusCode == 200 and response then
            local voiceData = json.decode(response)
            inVoiceChannel = (voiceData.channel_id == Config.VoiceChannelID)
        end
        onResult(inVoiceChannel)
    end, 'GET', "", headers)
end


AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local playerId = source
    deferrals.defer()
    Citizen.Wait(0)
    deferrals.update("Controllo della connessione al canale vocale Discord in corso...")

    local discordId = ExtractDiscordId(playerId)
    CheckPlayerVoiceChannel(discordId, function(isInVoiceChannel)
        if isInVoiceChannel then
            deferrals.done()
        else
            deferrals.done("Accesso negato: devi essere nel canale vocale Discord richiesto.")
        end
    end)
end)

-- Check degli utenti nel canale vocale discord
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(180000) -- Controlla ogni 3 minuti

        for _, playerId in ipairs(GetPlayers()) do
            local discordId = ExtractDiscordId(playerId)
            if discordId then
                CheckPlayerVoiceChannel(discordId, function(isInVoiceChannel)
                    if not isInVoiceChannel then
                        DropPlayer(playerId, "Sei stato espulso: devi essere nel canale vocale Discord richiesto.")
                    end
                end)
            end
        end
    end
end)

-- Guida
-- 1. Inserisci il tuo Guild ID, Bot Token e Voice Channel ID nella configurazione sopra.
-- 2. Assicurati che il bot Discord abbia i permessi necessari per vedere gli stati vocali degli utenti e gestire il server.
-- 3. Configura il bot Discord con gli intenti corretti per GUILD_VOICE_STATES.
-- 4. Questo script verifica sia all'accesso che periodicamente se i giocatori sono nel canale vocale richiesto e, in caso contrario, li rimuove dal server.
