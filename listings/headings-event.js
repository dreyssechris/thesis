headings.forEach(heading => {
    heading.addEventListener("click", function () {
        // Status, ob die Überschrift aufgeklappt wurde
        const isExpanded = heading.getAttribute("aria-expanded") === "true";
        // Der Titel wird extrahiert, da dieser im Panel angezeigt werden soll
        const headingText = heading.textContent.trim();

        if (!isExpanded) { // Event für das Aufklappen
            _paq.push([
                "trackEvent",
                "interaction - " + document.title,
                "expand",
                headingText,
                new Date().getTime()
            ]);
        } else {          // Event für das Zuklappen    
            _paq.push([
                "trackEvent",
                "interaction",
                "close",
                headingText,
                new Date().getTime()
            ]);
        }
    });
});