// Prüft, ob die Einwilligung im localStorage gespeichert wurde
var consentGiven = localStorage.getItem("trackingConsent") === "given";
  
var toggleButton = document.getElementById("toggleConsent"); 

// Der Button wird so gesetzt, dass dieser dem aktuellen Einwilligungsstatus entspricht
if(consentGiven) {
  toggleButton.textContent = "Tracking deaktivieren"
} else {
  toggleButton.textContent = "Tracking erlauben"
}

// Event Listener für den Button zum Ändern des Einwilligungsstatus
toggleButton.addEventListener("click", function() {
  if(consentGiven) {
    // Widerruft die Einwilligung, passt den Button-Text an und speichert den neuen Status
    _paq.push(['forgetConsentGiven']); 
    alert("Tracking-Consent erfolgreich widerrufen.")
    localStorage.setItem("trackingConsent", "revoked");
    toggleButton.textContent = "Tracking erlauben";
    consentGiven = false; 
  } else {
    // Erteilt die Einwilligung, passt den Button-Text an und speichert den neuen Status
    _paq.push(['rememberConsentGiven']); 
    alert("Tracking-Consent erfolgreich erteilt."); 
    localStorage.setItem("trackingConsent", "given")
    toggleButton.textContent = "Tracking deaktivieren"
    consentGiven = true; 
  } 
})
