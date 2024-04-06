# ChatMessageService v2

An easy interface for sending system messages in Roblox chat on the server and client, optionally using RichText.

To install, follow the instructions at the top of each script in src/.

## API

### Server

#### :SpecifiedClient

```lua
ChatMessageService.Server:SpecifiedClient( client: Player, text: string ): nil
```

Send the specified message (`text`) to the specified client only. `text` may be any plain text message or properly-formated RichText string.

#### :SpecifiedClients

```lua
ChatMessageService.Server:SpecifiedClients( clients: table, text: string ): nil
```

Send the specified message (`text`) to all specified clients (`Player` instances of array `clients`) current client only. `text` may be any plain text message or properly-formated RichText string.

#### :AllClients

```lua
ChatMessageService.Server:AllClients( text: string ): nil
```

Send the specified message (`text`) to all available clients. `text` may be any plain text message or properly-formated RichText string.

### Client

#### :CurrentClient

```lua
ChatMessageService.Client:CurrentClient( text: string ): nil
```

Send the specified message (`text`) to the current client only. `text` may be any plain text message or properly-formated RichText string.

---

See the original, no-longer-being-updated CMS [here](https://github.com/ayvacs/ChatMessageService/)