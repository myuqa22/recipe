
# Rezept App

Dies ist eine kleine App, die über eine REST API Rezepte anhand von Keywords filtert und in einer Liste anzeigt. Rezepte können ebenfalls auch in der Detailansicht mit Informationen zu den Zutaten betrachtet werden.

Die App wurde in SwiftUI geschrieben und basiert auf dem Architekturmuster MVVM. MVVM löst das Problem von überladenen Controllern in UiKit, aber da bei SwiftUI keine benötigt werden, aber trotzem den Vorteil bringen, dass die View und Logik getrennt werden und besser testbar sind. Interessant wäre noch die Verwendung von TCA.

Für die Verabreitung der Requests habe ich Asnyc/Await verwendet, weil das neue Feature von Apple die Verwaltung von asynchronen Code leserlicher und einfacher wartbar macht.

Die User Interactions werden in dem ViewModel mithilfe von Action Enums registriert, die einer Funktion handleActions(_:) als Parameter übergeben werden. Eine andere Möglichkeit wäre die Verwendung von Combine. 

## Herausforderungen

Die REST API von EDAMAM gibt für die Rezepte keine eindeutige Id in der Response zurück. Ohne eindeutige Zuordnung war es schwer, die Rezepte ohne Bugs anzuzeigen. Aus diesem Grund habe ich jedem Rezept Model eine eindeutige UUID zugeordnet, indem ich den Decoder Initializer modifiziert habe.


## Bisher umgesetzte Features:
- MVVM
- Abindung der Rezept REST API von EDAMAM
- Suchfeld mit integriertem Suchverlauf
- Listenansicht
- Detailansicht
- Pagination (Infinite Scrolling)
- Pull to refresh

## Features in Planung:
- Filtern
- Mehr Tests
- Favorisieren von Rezepten
