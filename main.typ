#import "acronyms.typ": acronyms 
#import "acronym-lib.typ": init-acronyms, print-acronyms, acr, acrpl, acrs, acrspl, acrl, acrlpl, acrf, acrfpl

#import "variables.typ": variables
#import "variables-lib.typ": init-variables, print-variables, var, varpl, vars, varspl, varl, varlpl, varf,varfpl

// Set global cite style
#set cite(style: "ieee")

// Set global font type and size
#set text(font: "Arial", size: 12pt)

// Set line spacing to 1.5
#set par(leading: 1.5em)

// Define global text sizes
#let title-size = 1.5em
#let subtitle-size = 1.25em
#let body-size = 1em
#let section-spacing = 2em
#let spacing = 1em
#let small-spacing = 0.5em

// Define logo heights
#let left-logo-height = 1.5cm
#let right-logo-height = 1.5cm

// Define logo paths
#let logo-left = "pictures/DHBW_MA_Logo.jpg"
#let logo-right = "pictures/SAP_R_grad_scrn.jpg"
#let title = "Wie kam es vom internationalen Saving glut zur Strukturierung von amerikanischen Hypotheken auf dem Sub-Prime Markt"
#let nameAuthor = "Benjamin Will"

// Define header and footer content
#let header-content = {}

#let generate-footer-content(numbering) = locate(loc => {
  let all_headings = query(heading.where(level: 1).or(heading.where(level: 2)).or(heading.where(level: 3)), loc)
  let current_page = loc.page()
  
  let relevant_headings = ()
  for i in range(all_headings.len()) {
    let h = all_headings.at(i)
    let heading_page = h.location().page()
    let next_heading_page = if i + 1 < all_headings.len() { 
      all_headings.at(i + 1).location().page() 
    } else { 
      current_page + 1
    }
    
    if heading_page == current_page or (heading_page < current_page and next_heading_page > current_page) {
      relevant_headings.push(h)
    }
  }
  line(length: 100%)
  stack(
    dir: ltr,
    spacing: 1em,
    align(left, {
      if relevant_headings.len() > 0 {
        relevant_headings.map(h => h.body).join(" • ")
      } else {
        ""
      }
    }),
    align(right, text(size: 12pt, weight: "regular", counter(page).display(numbering)))
  )
})

//-----------------------------------------------------------------------------------
// Title Page
//-----------------------------------------------------------------------------------

// Place the logos
#stack(dir: ltr, spacing: 2fr,
  
  align(horizon, image(logo-left, height: 6em)),
)

// Title
#v(spacing*3)
#set par(leading: 0.5em)
#align(center, text(weight: "semibold", size: title-size, title))
#set par(leading: 1.5em)

#v(spacing)

// Confidentiality marker (SPERRVERMERK)
#align(center, text(weight: "semibold", size: title-size, "Geld und Währungspolitik"))

#v(small-spacing)

// Type of Thesis
#align(center, text(weight: "semibold", size: subtitle-size, "Assignment"))

#v(small-spacing)

// Course of Studies
#align(center, text(size: body-size, "aus dem Studiengang Wirtschaftsinformatik Sales & Consulting"))

#v(small-spacing)

// University
#align(center, text(size: body-size, "an der Dualen Hochschule Baden-Württemberg Mannheim"))

#v(spacing)

// Author
#align(center, text(size: body-size, "von"))
#v(small-spacing)
#align(center, text(weight: "medium", size: subtitle-size, nameAuthor))


#v(spacing * 2)

// Author Information
#grid(
  columns: (auto, auto),
  row-gutter: 12pt,
  column-gutter: 2.5em,

  // Date
  text(weight: "semibold", size: body-size, "Bearbeitungszeitraum:"),
  text(size: body-size, "16.12.2024 - Datum"),

  

  // University Course Leader
  text(weight: "semibold", size: body-size, "Dozent:"),
  text(size: body-size, "Dr. Ingo Sauer "),

  text(weight: "semibold", size: body-size, "Modul:"),
  text(size: body-size, "W3WI_505 VWL"),

  // Student ID and Course
  text(weight: "semibold", size: body-size, "Matrikelnummer, Kurs:"),
  text(size: body-size, "5146364, WWI 23 SCB"),

  // Spacer
  text(size: body-size, ""),
  text(size: body-size, ""),

  

  // Spacer
  text(size: body-size, ""),
  text(size: body-size, ""),


  // Spacer
  text(size: body-size, ""),
  text(size: body-size, ""),


)

// Page break
#pagebreak()
//-----------------------------------------------------------------------------------
// Eidesstattliche Erklärung
//-----------------------------------------------------------------------------------
#set page(
  paper: "a4",
   margin: (
    left: 2cm,
    right: 4cm,
    top: 2.5cm,
    bottom: 2cm
  ),
  header: header-content,
  footer: generate-footer-content("I"),
  numbering: "I",
)
#counter(page).update(1)

#init-acronyms(acronyms)
#init-variables(variables)
#set heading(numbering: "I.",outlined: false)
#show heading.where(level: 1): it => {
  set text(size: 18pt, weight: "bold")
  v(1.5em)
  it
  v(1em)
}
#show heading.where(level: 2): it => {
  set text(size: 16pt, weight: "bold")
  v(1em)
  it
  v(0.5em)
}
#show heading.where(level: 3): it => {
  set text(size: 14pt, weight: "bold")
  v(1em)
  it
  v(0.5em)
}
#set par(justify: true, leading: 1.5em)
#set text(hyphenate: true, lang: "de")

= Eidesstattliche Erklärung
#align(left, text("Ich versichere hiermit, dass ich mein Assignment mit dem Thema: „Wie kam es vom internationalen Saving glut zur Strukturierung von amerikanischen Hypotheken auf dem Sub-Prime Markt“ selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe."))

// Space for the signature
#v(5em)

// Table for "Ort, Datum" and "Unterschrift"
#grid(
  columns: (auto, auto),
  row-gutter: 1em,
  column-gutter: 12em, 
  // Left Column
  text(weight: "semibold", "____________________________"),
  // Right Column
  text(weight: "semibold", "________________________"),
  // Left Column
  text(weight: "semibold", "Ort, Datum"),
  // Right Column
  text(weight: "semibold", "Unterschrift")
)


//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
// Gleichbehandlung
//-----------------------------------------------------------------------------------

= Gleichbehandlung der Geschlechter
In dieser Praxisarbeit wird aus Gründen der besseren Lesbarkeit das generische Maskulinum verwendet. Weibliche und anderweitige Geschlechteridentitäten werden dabei ausdrücklich mitgemeint, soweit es für die Aussage erforderlich ist.

//-----------------------------------------------------------------------------------
// Disclaimer
//-----------------------------------------------------------------------------------

//= Disclaimer
// Disclaimer Content
//Ein Teil der Literatur, die für die Anfertigung dieser Arbeit genutzt wird, ist nur über die E-Book-Plattform o'Reilly abrufbar. Bei diesen Ressourcen existieren keine Seitennummern, es wird bei Verweisen stattdessen die Kapitelnummer angegeben.
//#v(1.5em)
//Um den Lesefluss zu verbessern, werden Abbildungen, Codebeispiele und Tabellen, die den Lesefluss stören, im Anhang platziert, auf den im Text zusätzlich verwiesen wird.

//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
// Inhaltsverzeichnis, Abbildungsverzeichnis, Tabellenverzeichnis
//-----------------------------------------------------------------------------------
#pagebreak()

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}

#show outline.entry.where(body: [Literaturverzeichnis] ): it => {
    v(12pt, weak: true)
    strong(it)
    numbering("i")
}

// Inhaltsverzeichnis (Table of Contents)
  #outline(
    title: "Inhaltsverzeichnis",
    depth: 3,
    indent: 1em,
    )
#pagebreak()

// Abbildungsverzeichnis (List of Figures)
  #outline(
    title: "Abbildungsverzeichnis",
    target: figure.where(kind: image)
  )



#pagebreak()
// Abkürzungsverzeichnis (List of Abbreviations)
#print-acronyms(5em)




//-----------------------------------------------------------------------------------
// Inhalt der Arbeit
//-----------------------------------------------------------------------------------
#set heading(numbering: "1.")
#set page(
  paper: "a4",
  margin: (
    left: 2cm,
    right: 4cm,
    top: 2.5cm,
    bottom: 2cm
  ),
  header: header-content,
  numbering: "1",
  footer: generate-footer-content("1"),
)
#pagebreak()
#counter(page).update(1)
#counter(heading).update(0)
#set heading(numbering: "1.",outlined: true)
#set math.equation(numbering: "(1)")

= Einleitung
Die Entstehung der Finanzkrise 2008 war das Ergebnis einer Reihe komplexer wirtschaftlicher und finanzieller Entwicklungen, die sich über Jahre hinweg aufgebaut hatten. Eine zentrale Rolle dabei spielte das Phänomen des internationalen "Saving Glut".
= Saving Glut  zur Strukturierung der Hypotheken 
== Internationale Sparüberschüsse (Saving Gluts)
Der Begriff „Internationale Sparüberschüsse“ (engl. „Saving Glut“) wurde von Ben Bernanke, dem ehemaligen Vorsitzenden der amerikanischen Notenbank (Federal Reserve System), vertreten, um ein weltweites Überangebot an Ersparnissen zu erklären, das Auswirkungen auf Zinssätze und die globalen Finanzmärkte hatte #cite(<speech_bernanke>). 
#v(1.5em)
Nach Bernanke kam es in den 2000er Jahren zu einem signifikanten Sparüberschuss in Ländern wie China, Japan, Deutschland und ölproduzierenden Staaten, die hohe Leistungsbilanzüberschüsse verzeichneten (@saving_glut). Im Gegensatz dazu wies die USA ein hohes Leistungsbilanzdefizit auf. Dieser Unterschied zwischen den Ländern, die mehr sparten als sie investierten, und den Ländern, die sich verschuldeten, führte zu einem Kapitalabfluss aus den „überschüssigen“ Ländern in Industrieländer wie die USA (@saving_glut).

#figure(caption:
[Einsparungen unterteilt in drei Weltregionen @asia_savings_glut ]
, image(width: 10cm,
"pictures/Saving-Rates_SavingGlut.png"
))
<saving_glut>
#v(1.5em)
Die Grafik veranschaulicht das Sparverhalten von drei Weltregionen als Anteil ihres regionalen BIP im Zeitraum von 1995 bis 2015. Man erkennt vor allem wie unterschiedliche Sparverhalten in verschiedenen Weltregionen zu Ansammlung von Kapitalüberschüssen und deren Umleitung in die USA beigetragen haben (@saving_glut).
#v(1.5em)

Die Ersparnisse flossen zunächst primär in sichere Finanzanlagen, insbesondere in US-Staatsanleihen, Wertpapiere und in den Hypothekenmarkt. Das Überangebot an Kapital in den USA führte zu sinkenden langfristigen Zinssätzen, was die Kreditkosten für Unternehmen und Haushalte senkte und nach Bernanke somit kurzfristig den Konsum und Investitionen anheizte, langfristig jedoch zu einer Verschärfung der finanziellen Instabilität beitrug #cite(<speech_bernanke>). Besonders der Immobilienmarkt profitierte von den niedrigen Zinssätzen, da der Zugang zu Hypotheken und Konsumkrediten erleichtert wurde. Dies begünstigte nicht nur Kreditnehmer mit hoher Bonität, sondern auch solche im Subprime-Bereich, die sonst Schwierigkeiten beim Erhalt von Krediten hatten.


 

== Sub-Prime Markt

== Lockerung der Kreditvergabestandards (Subprime-Kredite)

 Unter Subprime-Krediten versteht man nach A. Rapp, zitiert durch Schmidt und Deeken, Darlehen auf dem US-amerikanischen Hypothekenmarkt, welche an Schuldner unterhalt ("sub") der erstklassigen ("prime") Bonität vergeben werden #cite(<schmidt_deeken_2022>, supplement: "S.41"). Subprime-Kredite zeichnen sich hierbei durch eine geringe Kreditwürdigkeit und somit durch eine erhöhte Ausfallwahrscheinlichkeit der Schuldner und eine hohe Verzinsung aus #cite(<schmidt_deeken_2022>, supplement: "S.41").
 #v(1.5em)
Durch die niedrigen Zinsen in den USA kam es zu einer Nachfrage nach Immobilienfinanzierung. Gleichzeitig führten Kreditinstitute neue Variationen der Kreditvergabe ein. 
Finanzinstitute suchten nach Wegen, die hohe Nachfrage nach Investitionsmöglichkeiten zu bedienen, welche durch den Saving Glut entstanden war. Eine Lösung war die Vergabe von Hypotheken an Kreditnehmer mit geringerer Kreditwürdigkeit, da das niedrige Zinsumfeld eine breitere Kreditvergabe förderte.
Banken und Finanzinstitute bündeltern diese Subprime-Hypotheken in Mortgage-Backed Securities ("MBS") und verkauften diese an Investoren weltweit. Die Rating-Agenturen vergaben oft unrealistisch hohe Ratings für diese strukturierten Produkte, was sie für globale Investoren attraktiv machte. Die Investoren erhofften sich von den gebündelten Sub-prime Hypotheken hohe Renditen bei einem durch Finanzinstitute bewertetem Risko der Sub-Prime Hypotheken.


== Strukturierung von Hypothekenprodukten
 Die Bündelung von Hypotheken zu Mortage-Backed Securities (MBS) diente dazu, die Effizienz der Kapitalnutzung zu steigern, Risiken breiter zu streuen und die Kreditvergabe anzukurbeln. Banken konnten somit ihre Hypotheken aus ihrer Bilanz auslagern, um Kapital freizusetzen und zusätzliche Kredite vergeben zu können. Gleichzeitig bot die Verbriefung Investoren die Möglichkeit, in unterschiedliche Risikoklassen zu investieren, was in dem Niedrigzinsumfeld attraktiv war. Durch das Niedrigzinsumfeld waren die Renditen traditioneller sicherer Anlagen wie Staatsanleihen sehr gering, wohingegen Sub-prime Hypotheken und die daraus generierten 
 Mortgage-Backed Securities (MBS) im Vergleich höhere Zinsen boten, da diese mit einem höheren Ausfallrisiko verbunden waren. Deshalb waren für Investoren die MBS attraktiv, da diese sich hohe Renditen erhofften.
  Ein Problem stellten jedoch die mangelnde Bonitätsprofung und die Komplexität der Produkte dar, welche langfristig zur Finanzmarktinstabilität beitrugen.
=== Mortage-Backed Securities 
Mortage-Backed Securities (MBS) sind eine spezielle Art von Wertpapieren, welche durch einen Pool von Hypothekenkrediten besichert ist. Sie ermöglichen es Finanzinstituten, Hypotheken in handelbare Finanzprodukte umwandeln, die von Investoren gekauft werden können. Dabei vergeben Banken oder Kreditgeber Hypotheken beispielweise an Hauskäufer. Diese Kredite stellen die Grundlage für die Schaffung von (MBS) dar.
#v(1.5em)
#figure(caption:
[ Bündelung von Sub-prime Hypotheken; eigene Darstellung  ]
, image(width: 16cm,
"pictures/Hypothekenbündelung_neu.png"
))
<Hypothekenbündelung>
#v(1.5em)

 Mehrere unterschiedliche Hypotheken werden zu einem Pool zusammengefasst, um das Risiko zu diversifizieren (@Hypothekenbündelung). Dabei enthält der Pool Hypotheken mit unterschiedlichen Bonitätniveaus. Der gerade beschriebene Hypothekenpool wird anschließend an eine Zwecksgesellschaft (Special Purpose Vehicle, SPV) verkauft. Diese SPV erstellt auf Basis des Pools handelbare Wertpapiere (MBS). 

Die MBS werden durch Rating-Agenturen in Tranchen unterteilt, die unterschiedliche Risikoprofile aufweisen (@Risikoprofile).

#figure(caption:
[Risikoprofile der Mortage-Backed Securities; eigene Darstellung  ]
, image(width: 14cm,
"pictures/Ebay Anzeigendetails_Formular.png"
))
<Risikoprofile>
#v(1.5em)

Zahlungen aus dem Hypothekenpool fließen zuerst an die Senior Tranche und zuletzt in die Equity Tranche (@Risikoprofile). Die MBS werden an institutionelle und private Investoren verkauft. Diese erhalten regelmäßige Zahlungen basierend auf den Hypothekenzahlungen der Hauskäufer. 

Die Rating Agenturen haben während der Zeit vor der Finanzkrise 2007/2008 Mortage-Backed Securities unrealistisch hoch bewertet. Viele MBS erhielten dabei von Rating-Agenturen hohe Ratings wie AAA (@Risikoprofile) was auf ein äußerst geringes Ausfallrisiko hinweist. In Wirklichkeit bestanden viele dieser MBS aus Sub-prime Krediten, also Kreditnehmern mit schlechter Bonität. Die Rating Agenturen wurden dabei von den Emittenten der MBS bezahlt, was zu einem Interessenskonflikt führte. Die Rating-Agenturen mussten die Risiken realistisch einschätzen, wollten jedoch ebenfalls weitere Aufträge der Emittenten erhalten. Zudem war es selbst für Rating-Agenturen oftmals extrem komplex das Risko der strukturierten Produkte einzuschätzen, da diese nicht nachvollziehen konnten, welche Risiken in den Produkten steckten.
=== Collateralized Debt Obligations 
Unter ("CDO") versteht man nach ... komplexe Finanzinstrumente, die aus einem Pool von Schuldtiteln (z.B. Anleihen, Krediten oder anderen Forderungen) gebildet werden. Diese Schuldtitel werden, wie die ("MBS") ebenfalls in verschiedene Tranchen unterteilt, die nach dem Risiko und der Rendite kategorisiert sind. Genauso wie die ("MBS") wurden die ("CDO")s entwickelt, um das Risiko zu diversifizieren und den Investoren unterschiedliche Reditemöglichkeiten zu bieten.

Im Vergleich zu ("MBS") sind ("CDO")s komplexer und bündeln verschiedene Arten von Schuldtiteln, nicht nur Hypotheken. Dazu zählen beispielsweise Unternehmensanleihen, Hypothekendarlehen ("MBS)", Autokredite oder andere ("CDO")s. Die eigentliche Funktionsweise der Bündelung der beiden Produkte ist jedoch sehr ähnlich. 

== Zusammenhang Saving Gluts und Subprime-Markt
Die Saving Gluts und der Subprime-Markt sind stark voneinander abhängig, da die globalen Sparüberschüsse zu einer erhöhten Nachfrage nach Investitionen führten. Aufgrund der niedrigen Zinssätze und der großen Menge an verfügbaren Ersparnisse suchten Investoren nach höher verzinsten aber dadurch auch riskanteren Anlagen. Diese erhöhte Nachfrage nach Investitionen mit höheren Renditen heitzte ebenfalls den Markt für Subprime-Hypotheken an. Dabei wurden riskante und qualitativ minderwertige Vermögenswerte so umstrukturiert, dass sie auf den Finanzmärkten wie hochwertige und rentable Anlagen erschienen. 



= Zusammenfassung
Der internationale Saving Glut sorgte für einen Zufluss von Kapital in den USA, was zu niedrigeren Zinsen und einer erhöhten Kreditvergabe führte. Dies schuf die Grundlage für die Expansion des Subprime-Markts, da günstige Finanzierungsbedingungen und die Suche nach renditestarken Investitionen die Strukturierung risikoreicher Hypotheken förderten. Dies trug letztlich zur Immobilienblase bei, deren Platzen die globale Finanzkrise von 2008 auslöste

= Fazit
MBS und CDOs waren zentrale Akteure in der Finanzkrise 2007/2008. Durch die Verbriefung von minderwertigen Hypotheken (Subprime-Markt) und deren Verpackung in CDOs wurden Risiken unterschätzt. Die Ausfälle von Hypotheken führten zu erheblichen Verlusten bei Investoren, die in scheinbar sichere Produkte investiert hatten, was letztlich zu einer globalen Finanzkrise führte.
// Fazit Text







//-----------------------------------------------------------------------------------
// Literaturverzeichnis
//-----------------------------------------------------------------------------------
#set page(
  paper: "a4",
  margin: (
    left: 2cm,
    right: 4cm,
    top: 2.5cm,
    bottom: 2cm
  ),
  header: header-content,
  numbering: "i",
  footer: generate-footer-content("i"),
)
#set heading(numbering: none)
#pagebreak()
#counter(page).update(1)
#counter(heading).update(0)
#set heading(numbering: "i.")
= Literaturverzeichnis
#bibliography("sources.bib",title: none)


//-----------------------------------------------------------------------------------
// Anhang
//-----------------------------------------------------------------------------------
#pagebreak()
= Anhang 
// Anhang Text
#heading("Anhang A", outlined: false)
#heading("Anhang B", outlined: false)
#heading("Anhang C", outlined: false)