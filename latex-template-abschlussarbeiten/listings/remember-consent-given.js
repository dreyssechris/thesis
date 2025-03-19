// Klick-Event für den "OK"-Button im Cookie-Banner
document.getElementById('cookieOk').addEventListener('click', function() {
    // Tracking-Zustimmung an Matomo übermitteln
    _paq.push(['rememberConsentGiven']); 

    // Einwilligungsstatus im Local Storage speichern
    localStorage.setItem("trackingConsent", "given");
});