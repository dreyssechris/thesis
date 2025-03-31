audio.addEventListener("play", function () {
    _paq.push([
        "trackEvent",
        "video",             // Event-Typ, welcher am Balken angezeigt wird
        "play",              // Aktion, für den Start
        videoTitle,          // Titel des Events
        new Date().getTime() // Zeitstempel für den Beginn
    ]);
});

audio.addEventListener("pause", function () {
    _paq.push([
        "trackEvent",
        "video",             // Event-Typ, welcher am Balken angezeigt wird
        "pause",             // Aktion, für das Stoppen
        videoTitle,          // Titel des Events
        new Date().getTime() // Zeitstempel für das Ende
    ]);
});