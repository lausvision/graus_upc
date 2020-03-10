import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

loadfile() {
  List<Map<String, dynamic>> result = [
    {
      "nom": "Arquitectura Tècnica i Edificació",
      "branca": "Arquitectura, Urbanisme i Edificació",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Politècnica Superior d'Edificació de Barcelona (EPSEB)",
      "nota": "5",
      "objectius":
          "El grau en Arquitectura Tècnica i Edificació et proporcionarà una formació de perfil europeu i caràcter generalista, sobre les bases teòriques, tècniques i tecnològiques pròpies del sector de l’edificació. Adquiriràs les competències necessàries per poder resoldre qualsevol qüestió relacionada amb el cicle de l’edificació: construcció, manteniment, rehabilitació, desconstrucció i urbanització.Un cop acabat el grau podràs exercir en algunes de les professions amb una projecció més gran en l’àmbit europeu, com ara: arquitecte/a tècnic/a; director/a d’execució d’obra; auditor/a o consultor/a en eficiència energètica; coordinador/a de seguretat i salut, i tècnic/a en software 3D BIM (building information modeling). A més, podràs especialitzar-te fent un itinerari d’assignatures optatives orientades a aprofundir en diferents coneixements específics per obtenir un diploma d’ampliació de competències (DAC), uns diplomes que poden ser homologats per l’Agència de Certificació Professional (ACP), entitat encarregada d’emetre un segell distintiu de la qualitat, la capacitat i la competència dels professionals del sector de l’edificació i l’arquitectura.",
      "ambit":
          "Ordenació i direcció de l'execució d'obres d'edificació, de rehabilitació i de restauració, control de la qualitat dels materials de les obres i de l’aplicació de la normativa tècnica de l’edificació, disseny d'interiors, tècnic/a en impacte ambiental i auditoria per a certificacions d'eficiència energètica, estudis de sostenibilitat en els edificis i gestió de l'ús, la conservació i el manteniment dels edificis, direcció d'empreses constructores i immobiliàries, activitats relacionades amb la funció de Project Manager, càlcul d'estructures, instal·lacions avançades, direcció de producció en empreses de productes i innovacions tecnològiques de l'edificació, consultories tècniques i gestió immobiliària i urbanística, organització i gestió de l'economia, amb la realització de valoracions, taxacions i estudis de viabilitat econòmica, coordinació de la seguretat i salut laboral, incloent-hi la redacció d'estudis i plans de seguretat, la formació de treballadors, desenvolupament de projectes arquitectònics 3D, administració pública, docència i recerca.",
      "link":
          "https://www.upc.edu/ca/graus/arquitectura-tecnica-i-edificacio-barcelona-epseb",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Arquitectura",
      "branca": "Arquitectura, Urbanisme i Edificació",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Arquitectura de Barcelona (ETSAB)",
      "nota": "6.614",
      "objectius":
          "Amb el grau en Estudis d'Arquitectura et formaràs per ser un professional tècnicament competent i científicament solvent que s’integri en l'activitat productiva de l'arquitectura, que pugui crear projectes arquitectònics que  compleixin les exigències estètiques i tècniques alhora; amb coneixements de la història i les teories de l'arquitectura, l’urbanisme i la planificació, els mètodes de recerca i la preparació de projectes deconstrucció, i també dels problemes de concepció estructural, construcció i enginyeria vinculats amb la projectació d'edificis. Entendràs les relacions entre les persones, els edificis i el seu entorn, i la professió d'arquitecte i la seva funció a la societat, per tal de tenir en compte els factors socials en el projecte.",
      "ambit":
          "Disseny d'edificació, disseny d'espai públic, càlcul d'estructures en l'edificació, planejament urbanístic i territorial, disseny d’interiors, mobiliari i objectes, disseny d’efímers, exposicions i escenografia, disseny gràfic, estudis d’impacte ambiental, gestió immobiliària, docència i recerca.",
      "link":
          "https://www.upc.edu/ca/graus/estudis-darquitectura-barcelona-etsab",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Arquitectura",
      "branca": "Arquitectura, Urbanisme i Edificació",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Arquitectura del Vallès (ETSAV)",
      "nota": "9.494",
      "objectius":
          "Amb el grau en Estudis d'Arquitectura et formaràs per ser un professional tècnicament competent i científicament solvent que s’integri en l'activitat productiva de l'arquitectura, que pugui crear projectes arquitectònics que  compleixin les exigències estètiques i tècniques alhora; amb coneixements de la història i les teories de l'arquitectura, l’urbanisme i la planificació, els mètodes de recerca i la preparació de projectes deconstrucció, i també dels problemes de concepció estructural, construcció i enginyeria vinculats amb la projectació d'edificis. Entendràs les relacions entre les persones, els edificis i el seu entorn, i la professió d'arquitecte i la seva funció a la societat, per tal de tenir en compte els factors socials en el projecte.",
      "ambit":
          "Disseny d'edificació, disseny d'espai públic, càlcul d'estructures en l'edificació, planejament urbanístic i territorial, disseny d’interiors, mobiliari i objectes, disseny d’efímers, exposicions i escenografia, disseny gràfic, estudis d’impacte ambiental, gestió immobiliària, docència i recerca.",
      "link":
          "https://www.upc.edu/ca/graus/estudis-darquitectura-sant-cugat-del-valles-etsav",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Paisatgisme",
      "branca": "Arquitectura, Urbanisme i Edificació",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Arquitectura de Barcelona (ETSAB), Escola Superior d'Agricultura de Barcelona (ESAB)",
      "nota": "5",
      "objectius":
          "Amb el grau en Paisatgisme adquiriràs els coneixements científics i tecnològics necessaris per treballar com a paisatgista. Seràs capaç de planificar i dissenyar projectes paisatgístics i d’espais verds i gestionar-ne i controlar-ne la construcció, el manteniment i la rehabilitació. Treballaràs en la redacció de projectes i estudis de paisatgisme i impacte ambiental, la planificació i disseny d’infraestructures, i la implantació i gestió de parcs i jardins, tot participant en equips multidisciplinaris.",
      "ambit":
          "Projectes i estudis d'espai públic urbà, integració d'infraestructures i equipaments en el paisatge, restauració/rehabilitació d'ecosistemes i patrimoni natural, planificació i gestió del paisatge.",
      "link":
          "https://www.upc.edu/ca/graus/paisatgisme-castelldefels-barcelona-esab-etsab",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Ciència i Enginyeria de Dades",
      "branca": "Ciències Aplicades",
      "modalitat": "Presencial",
      "localitzacio":
          "Facultat de Matemàtiques i Estadística (FME), Escola Tècnica Superior d'Enginyeria de Telecomunicació de Barcelona (ETSETB), Facultat d'Informàtica de Barcelona (FIB)",
      "nota": "12.364",
      "objectius":
          "El grau en Ciència i Enginyeria de Dades respon a la necessitat de formar graduats amb una visió multidisciplinària de l’enginyeria i capaços de fer front als reptes que planteja un entorn tecnològic en evolució i que es basa, en bona part, en sistemes computacionals que generen i analitzen quantitats massives de dades. El grau vol formar així professionals experts en anàlisi i enginyeria de dades estructurades i no estructurades (text, àudio, vídeo, proves mèdiques, indicadors financers, etc.), amb una base matemàtica i habilitats pròpies de l’enginyeria que els permetin modelitzar i resoldre problemes complexos. És un àmbit de treball emergent amb aplicacions tan diverses com ara l’analítica financera, l’estudi de fenòmens físics, el comerç electrònic, les ciutats intel·ligents, la informàtica biomèdica, la genòmica o les xarxes socials, entre d'altres. El pla d'estudis proporciona formació en tres pilars bàsics: matemàtiques i estadística, per poder modelitzar sistemes i tractar la informació de manera rigorosa; computació, per utilitzar els dispositius de càlcul de manera generalitzada i eficient en el tractament de la informació i l'aprenentatge autònom, i processament de senyals, per tractar la complexa informació representada en imatges, àudio i vídeo o generada per qualsevol font de dades codificades digitalment. L'esperit emprenedor i la capacitat d'aprenentatge autònom seran fomentats durant els estudis a partir de matèries específiques i de la participació en projectes multidisciplinaris.",
      "ambit":
          "El tractament de dades i la presa autònoma de decisions són components primordials en l’activitat quotidiana de moltes empreses i institucions. Àmbits tan diversos com la biotecnologia, la genòmica, el comerç electrònic, l’automoció, les finances, la realitat virtual, la medicina, l’esport, l’energia, el transport, la domòtica, etc., estan immersos  en  quantitats colossals d’informació que requereixen un tractament matemàtic, estadístic i computacional. Aquests àmbits cobreixen una gran part del teixit industrial i les institucions públiques d'arreu del món on la presència de les Tecnologies de la Informació i la Comunicació (TIC) és indispensable per gestionar, competir i innovar. Els titulats en Ciència i Enginyeria de Dades seran enginyers que gaudiran d'una formació multidisciplinària indispensable per atendre les necessitats de les empreses, centres de recerca i institucions públiques en els àmbits abans esmentats. Ocuparan llocs de treball altament qualificats on calgui tenir capacitat de raonament científic, habilitats d'enginyeria i esperit d’innovació.",
      "link":
          "https://www.upc.edu/ca/graus/ciencia-i-enginyeria-de-dades-barcelona-fib-etsetb-fme",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Ciències i Tecnologies del Mar",
      "branca": "Ciències Aplicades",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria de Camins, Canals i Ports de Barcelona (ETSECCPB), Escola Politècnica Superior d'Enginyeria de Vilanova i la Geltrú (EPSEVG), Escola Superior d'Agricultura de Barcelona (ESAB)",
      "nota": "6.117",
      "objectius":
          "El grau en Ciències i Tecnologies del Mar està orientat cap a la capacitació científica i tècnica de professionals per dur a terme feines de recerca i assessorament en els àmbits mediambiental i climàtic, i sobre els impactes de les actuacions econòmiques i socials en el medi marí i costaner (aprofitament ètic, responsable i sostenible dels recursos marins, caracterització de costes, canvi climàtic i el seu impacte sobre el medi marí i la zona costanera, etc.). També s’orienta cap a la formació per a altres científics i tècnics i, en general, per a la societat sobre totes les activitats relacionades amb les ciències i tecnologies marines (bàsiques i aplicades), el seu desenvolupament i la seva divulgació.",
      "ambit":
          "Gestió integrada de la zona costanera, gestió maritimocostanera a l’Administració pública, consultories en el camp del mar i la costa, ports, desenvolupament d'aparells, sensors i infraestructures per mesurar i monitorar el mar, planificació i optimització de les activitats socioeconòmiques relacionades amb el mar i la costa, empreses de serveis marítims i adequació d’aquestes a les normatives sobre medi ambient, energies renovables marines, aqüicultura, plataformes offshore de petroli i gas, pesca i altres recursos marins, obtenció d'aigua potable del mar, docència i recerca.",
      "link":
          "https://www.upc.edu/ca/graus/ciencies-i-tecnologies-del-mar-barcelona-vilanova-i-la-geltru-castelldefels-etseccpb-epsevg-esab",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Economia-Estadística (doble titulació)",
      "branca": "Ciències Aplicades",
      "modalitat": "Presencial",
      "localitzacio": "Facultat de Matemàtiques i Estadística (FME)",
      "nota": "11.072",
      "objectius":
          "Amb aquests estudis, coordinats per la Universitat de Barcelona (UB) i amb la participació de la UPC, cursaràs una doble formació en estadística i economia que et permetrà obtenir, en finalitzar els estudis, tots dos títols de grau. Així, a la formació científica proporcionada pel grau en Economia —que et permetrà comprendre els aspectes fonamentals de l'economia (tant teòrics com aplicats) i aplicar les tècniques d'anàlisi d’aquesta disciplina—, s’hi afegiran les capacitats pròpies per a la recollida i anàlisi de la informació dels professionals de l’estadística. La formació adquirida en aquest doble grau et permetrà adaptar-te ràpidament als canvis que es produeixen en el món econòmic i social, identificar els problemes i oferir solucions basades en mètodes avançats d’anàlisi de la informació per a la presa òptima de decisions. Aquests estudis s’imparteixen conjuntament amb la Universitat de Barcelona (UB), i això enriqueix la formació, gràcies a la unió de l’expertesa del professorat de totes dues universitats en els àmbits de l’enginyeria i la tecnologia, l’economia, les ciències socials i les ciències de la salut.",
      "ambit":
          "Empreses del sector privat i administracions públiques, departaments analítics: anàlisi de costos, anàlisi de mercats exteriors, investigació de mercats, anàlisi financera i de riscos i àrees d’institucions que requereixen formació en estadística i coneixements econòmics: instituts oficials d’estadística, demografia i seguretat social, mercat de treball, departaments de salut pública i serveis sanitaris, entre d’altres.",
      "link":
          "https://www.upc.edu/ca/graus/economia-estadistica-doble-titulacio-interuniversitaria-ub-upc-barcelona-fme",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Física",
      "branca": "Ciències Aplicades",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria de Telecomunicació de Barcelona (ETSETB)",
      "nota": "12.770",
      "objectius":
          "El grau en Enginyeria Física, primer d’aquestes característiques a tot l’Estat espanyol, i acreditat amb el segell d’Excel·lència per l’Agència per a la Qualitat del Sistema Universitari (AQU) de Catalunya, s’adreça a estudiants amb molt bones aptituds en física i matemàtiques que vulguin aplicar els principis de les ciències bàsiques a problemes tecnològics en un entorn multidisciplinari, i que acceptin el repte d’inventar la tecnologia del futur i treballar en la recerca que transformarà el món. Aquest grau és el pont entre la física i l'enginyeria a escala nanoscòpica. Aprendràs física en un entorn politècnic i rebràs una visió àmplia de les àrees que seran claus en la tecnologia del futur, amb un equip docent involucrat en projectes de recerca innovadora. Adquiriràs els coneixements fonamentals de la física aplicats a diverses branques de l’enginyeria, que et permetran entendre les bases científiques i les seves aplicacions en tecnologies emergents: fotònica, nanotecnologia, microelectrònica i nanoelectrònica, tecnologies quàntiques, materials avançats i biotecnologia. A més de donar accés a màsters de l'àmbit de l'enginyeria física, aquesta formació et permetrà cursar qualsevol màster d’arreu del món relacionat amb la física i les noves tecnologies, així com en màsters d'algunes altres enginyeries, entre les quals hi ha els que donen atribucions professionals en enginyeria de telecomunicació i en enginyeria industrial. Aquest estudis t’obriran les portes al món professional, ja sigui a la indústria, empreses i serveis tecnològics, centres de recerca i desenvolupament, universitats i administracions públiques, en què podràs ocupar càrrecs de menys a més responsabilitat en funció de l'experiència i les aptituds i interessos personals, amb la possibilitat d'arribar a ser un empresari emprenedor.",
      "ambit":
          "Indústria d’alta tecnologia, indústria electrònica i de nanotecnologia, empreses de telecomunicacions, empreses de biotecnologia, biomedicina i farmacèutiques, empreses de disseny de sistemes i serveis basats en noves tecnologies, assessoria i consultoria, centres tecnològics, centres d’investigació i desenvolupament, centres i laboratoris de recerca, universitat, recerca i docència.",
      "link": "https://www.upc.edu/ca/graus/enginyeria-fisica-barcelona-etsetb",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Estadística",
      "branca": "Ciències Aplicades",
      "modalitat": "Presencial",
      "localitzacio": "Facultat de Matemàtiques i Estadística (FME)",
      "nota": "9.512",
      "objectius":
          "Amb el grau en Estadística (acreditat amb excel·lència per l'AQU Catalunya), coordinat per la Universitat de Barcelona (UB) i amb la participació de la UPC, cursaràs matèries vinculades a l’estadística la probabilitat, la investigació operativa, la informàtica o l’economia, que et permetran dissenyar mètodes per recollir dades i transformar-les en informació útil per a la presa de decisions en empreses, organitzacions i institucions, dirigir processos de control i millora de la qualitat, i elaborar estudis d’opinió pública, informes estadístics, estudis epidemiològics i assajos clínics en l’àmbit de la sanitat. Aquests estudis s’imparteixen conjuntament amb la Universitat de Barcelona (UB) i això enriqueix la formació, gràcies a la unió de l’expertesa del professorat de totes dues universitats en els àmbits de l’enginyeria i la tecnologia, l’economia, les ciències socials i les ciències de la salut.",
      "ambit":
          "Salut i ciències naturals, administracions públiques, indústria, serveis, docència i recerca.",
      "link":
          "https://www.upc.edu/ca/graus/estadistica-interuniversitari-ub-upc-barcelona-fme",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Matemàtiques",
      "branca": "Ciències Aplicades",
      "modalitat": "Presencial",
      "localitzacio": "Facultat de Matemàtiques i Estadística (FME)",
      "nota": "12.854",
      "objectius":
          "Amb el grau en Matemàtiques, acreditat amb excel·lència per l'AQU Catalunya, rebràs una formació completa i exigent en totes les matèries bàsiques de les matemàtiques i les seves aplicacions. Si el teu objectiu és la recerca, podràs integrar-te amb èxit en grups capdavanters per investigar en matemàtiques, en enginyeria i tecnologia, en ciències de la natura i la salut o en ciències socials. Podràs desenvolupar la teva activitat en el món de l’empresa o la indústria, o en els sectors de banca i finances, consultoria, salut i serveis, on els matemàtics són cada cop més apreciats per la seva formació i per la seva capacitat d’aprenentatge. Si la teva opció és la docència, després de cursar el màster de formació de professorat, podràs dedicar-te a l’ensenyament de les matemàtiques en centres de secundària.",
      "ambit":
          "Consultoria estratègica, consultoria tecnològica, gestió de projectes i estudis, anàlisi de dades, programació i enginyeria del software, estudis de mercat, planificació i personal directiu, criptografia i seguretat, recerca en matemàtiques, centres de recerca i laboratoris, anàlisi i control de riscos, gestió de carteres i fons, responsables d’inversions, disseny i valoració de productes financers, criptografia i seguretat, professorat de secundària en centres públics o privats, editorials i empreses del sector de l’ensenyament.",
      "link": "https://www.upc.edu/ca/graus/matematiques-barcelona-fme",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Biomèdica",
      "branca": "Ciències i Tecnologies de la Salut",
      "modalitat": "Presencial",
      "localitzacio": "Escola d'Enginyeria de Barcelona Est (EEBE)",
      "nota": "11.354",
      "objectius":
          "Aquest grau en Enginyeria Biomèdica et dóna formació per dirigir i gestionar projectes d’enginyeria relacionats amb el disseny d’equips de monitoratge, diagnòstic i teràpia, i de sistemes d’informació i comunicació aplicats a la sanitat, la telemedicina, el monitoratge remot i el control de qualitat d’equips. Prepara els futurs professionals d’una manera multidisciplinària en els àmbits de l’electromedicina, la captació de senyals biològics com el cardiovascular, la neurocirurgia i el tractament del dolor, els implants per a cirurgia ortopèdica i traumatologia, la medicina de l’esport, els productes sanitaris d’un sol ús, la gestió i l’assessorament tècnic d’equips i sistemes biomèdics, i els processos d’avaluació i certificació de tecnologia mèdica. S’adquireixen les competències necessàries en tècniques d’anàlisi i interpretació de senyals i imatges biomèdiques, biomecànica i biomaterials, sensors, millora de la qualitat assistencial i optimització d’equips i processos. És un grau que té una alta acceptació, ja que forma graduats i graduades amb un nou perfil professional que té una alta inserció laboral en un període de temps breu.",
      "ambit":
          "Direcció i gestió de projectes de concepció, disseny, fabricació, avaluació i certificació de productes i serveis sanitaris en l’àmbit biomèdic, disseny d’equips de monitoratge, diagnòstic i teràpia aplicats a la sanitat i a la telemedicina, direcció i gestió de projectes de millora de la qualitat assistencial i de processos, avaluació i certificació de tecnologia mèdica, empreses de tecnologia biomèdica, departaments d’enginyeria clínica de l’àmbit sanitari, docència i recerca.",
      "link":
          "https://www.upc.edu/ca/graus/enginyeria-biomedica-barcelona-eebe",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Òptica i Optometria",
      "branca": "Ciències i Tecnologies de la Salut",
      "modalitat": "Presencial",
      "localitzacio": "Facultat d'Òptica i Optometria de Terrassa (FOOT)",
      "nota": "5",
      "objectius":
          "Amb el grau en Òptica i Optometria, únic al sistema universitari català, adquiriràs els coneixements necessaris per a la diagnosi, prevenció i tractament dels problemes de salut visual de la població i cursaràs matèries vinculades als àmbits sanitari i tècnic. D’una banda, rebràs una sòlida formació en òptica per comprendre la formació d’imatges mitjançant les lents, els fonaments bàsics dels instruments òptics i les causes dels defectes visuals i, de l’altra, en optometria, que et permetrà aprofundir en l’estudi i el tractament dels problemes visuals no mèdics.",
      "ambit":
          "Detecció, diagnòstic, prevenció i tractament de problemes de salut visual, adaptació d’ulleres i lents de contacte, rehabilitació visual i assessorament en higiene visual i ergonomia, mesura i proves de diagnosi clínica per a intervencions quirúrgiques, establiments tecnicosanitaris d’òptica, centres de salut, d’assistència primària i hospitals, centres i consultes d’oftalmologia i indústria òptica.",
      "link": "https://www.upc.edu/ca/graus/optica-i-optometria-terrassa-foot",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Disseny i Desevolupament de Videojocs (docència en anglès)",
      "branca": "Disseny i tecnologia multimèdia",
      "modalitat": "Presencial",
      "localitzacio": "Centre de la Imatge i la Tecnologia Multimèdia (CITM)",
      "nota": "7.647",
      "objectius":
          "Amb el grau en Disseny i Desenvolupament de Videojocs et formaràs com a professional capacitat per conceptualitzar, dissenyar i programar videojocs i continguts adreçats al món digital interactiu, aptes per difondre's en diferents plataformes i dispositius mòbils. El pla d'estudis s'ha dissenyat perquè adquireixis les competències multidisciplinàries que intervenen en la creació de videojocs i materials interactius, amb una sòlida base científica en les tecnologies implicades, la programació amb múltiples plataformes, el disseny artístic i gràfic, la modelització i l'animació en 2D i 3D. En acabar el grau, hauràs desenvolupat diferents projectes de videojoc de forma individual i en grup, adquiriràs un ampli coneixement de la indústria i coneixeràs les claus de l’emprenedoria, així com els sistemes de finançament i monetització propis del sector, a partir de la participació activa de les diferents empreses que hi participen.",
      "ambit":
          "Expert/a en desenvolupament de videojocs, expert/a en programació d'aplicacions gràfiques interactives en temps real, programador/a d’apps, dissenyador/a de videojocs, productor/a de videojocs, artista tècnic/a, dissenyador/a 3D, animador/a 2D i 3D per a videojocs i continguts digitals i analista de dades de videojocs.",
      "link":
          "https://www.upc.edu/ca/graus/disseny-i-desevolupament-de-videojocs-docencia-en-angles-barcelona-citm",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Disseny i Desenvolupament de Videojocs",
      "branca": "Disseny i tecnologia multimèdia",
      "modalitat": "Presencial",
      "localitzacio": "Centre de la Imatge i la Tecnologia Multimèdia (CITM)",
      "nota": "5.018",
      "objectius":
          "Amb el grau en Disseny i Desenvolupament de Videojocs et formaràs com a professional capacitat per conceptualitzar, dissenyar i programar videojocs i continguts adreçats al món digital interactiu, aptes per difondre's en diferents plataformes i dispositius mòbils. El pla d'estudis s'ha dissenyat perquè adquireixis les competències multidisciplinàries que intervenen en la creació de videojocs i materials interactius, amb una sòlida base científica en les tecnologies implicades, la programació amb múltiples plataformes, el disseny artístic i gràfic, el modelat i l'animació en 2D i 3D. En acabar el grau, hauràs desenvolupat diferents projectes de videojoc de forma individual i en grup, adquiriràs un ampli coneixement de la indústria i coneixeràs les claus de l’emprenedoria, així com els sistemes de finançament i monetització propis del sector, a partir de la participació activa de les diferents empreses que hi participen.",
      "ambit":
          "Expert/a en desenvolupament de videojocs, expert/a en programació d'aplicacions gràfiques interactives en temps real, programador/a d’apps, dissenyador/a de videojocs, productor/a de videojocs, artista tècnic/a, dissenyador/a 3D, animador/a 2D i 3D per a videojocs i continguts digitals i analista de dades de videojocs.",
      "link":
          "https://www.upc.edu/ca/graus/disseny-i-desenvolupament-de-videojocs-terrassa-citm",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Disseny,Animació i Art Digital",
      "branca": "Disseny i tecnologia multimèdia",
      "modalitat": "Presencial",
      "localitzacio": "Centre de la Imatge i la Tecnologia Multimèdia (CITM)",
      "nota": "9.422",
      "objectius":
          "Amb el grau en Disseny, Animació i Art Digital desenvoluparàs el teu vessant artístic i creatiu, aplicant les noves tecnologies de la imatge, l’art i l’animació als suports més actuals del context. Realitzaràs projectes de disseny digital, animació i modelatge d’escenaris, personatges, objectes interactius i interfícies gràfiques, travessant el camp de l’art, la comunicació, la publicitat i altres disciplines. Treballaràs amb diferents formats, llenguatges i continguts visuals, com ara la fotografia, la il·luminació, la cinematografia, les aplicacions interactives o el videojoc, de manera que adquiriràs les bases tècniques necessàries per al tractament creatiu digital de cada format. Alhora, t’aproparàs a la indústria del disseny digital, l’animació i la ludificació, i aplicaràs també els coneixements necessaris de gestió, emprenedoria i màrqueting; tot això participant tant en projectes individuals com en equips multidisciplinaris basats entorn del mercat professional del disseny i l’art digital.",
      "ambit":
          "Artista animador 2D i 3D, dissenyador i gestor de continguts audiovisuals per a màrqueting i comunicació, productor d’efectes visuals, director i tècnic d’art, fotografia i il·luminació digital, dissenyador gràfic, desenvolupador de personatges, especialista en CGI i processament d’imatge, especialista en digitalització gràfica, creatiu publicitari i especialista en ludificació digital.",
      "link":
          "https://www.upc.edu/ca/graus/disseny-animacio-i-art-digital-terrassa-citm",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Multimèdia",
      "branca": "Disseny i tecnologia multimèdia",
      "modalitat": "Presencial",
      "localitzacio": "Centre de la Imatge i la Tecnologia Multimèdia (CITM)",
      "nota": "5",
      "objectius":
          "El grau en Multimèdia et capacitarà per dissenyar continguts audiovisuals i desenvolupar aplicacions multimèdia, combinant creativitat i últimes tecnologies. Amb aquesta finalitat, la transversalitat dels estudis esdevé un camí que recorre els àmbits de la creació artística, l’entreteniment o la comunicació, en el marc de la indústria dels continguts digitals i interactius. El pla d’estudis s’ha dissenyat amb l’objectiu d’assolir les competències relacionades amb el disseny, les tecnologies, les eines i les metodologies de la producció multimèdia. D’una banda, t’especialitzaràs en la creació de continguts digitals 2D i 3D, vídeo i postproducció, usabilitat i interfícies gràfiques. De l’altra, implementaràs solucions web, aplicacions mòbils i entorns virtuals interactius. Aquests continguts els posaràs en pràctica tant en treballs individuals com en equips multidisciplinaris i tindràs l’oportunitat de conèixer l’ampli ventall de possibilitats que ofereix el sector empresarial del món multimèdia.",
      "ambit":
          "Desenvolupament de webs i apps, producció audiovisual i postproducció, programació d’aplicacions multimèdia, programació d'entorns virtuals interactius, disseny de videojocs, disseny UI/UX, disseny 3D, animació 2D i 3D per a videojocs i continguts digitals, disseny i gestió de continguts audiovisuals per a màrqueting i comunicació de projectes, edició i producció de vídeo en cinema i TV.",
      "link": "https://www.upc.edu/ca/graus/multimedia-terrassa-citm",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom":
          "Enginyeria de Sistemes Aeroespacials i Enginyeria de Sistemes de Telecomunicació o Enginyeria Telemàtica (Doble Titulació)",
      "branca": "Enginyeria Aeroespacial",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Telecomunicació i Aeroespacial de Castelldefels (EETAC)",
      "nota": "10.996",
      "objectius":
          "Doble titulació, amb accés des de la preinscripció universitària sense prova addicional, que ofereix una formació multidisciplinària en els àmbits de l’enginyeria de sistemes aeroespacials i l’enginyeria de telecomunicació. Única a tot a l’Estat espanyol, l’Escola d’Enginyeria de Telecomunicació i Aeroespacial de Castelldefels (EETAC) imparteix aquesta doble titulació amb l’objectiu de donar resposta a les actuals demandes dels sectors de les telecomunicacions i l’enginyeria aeroespacial per formar professionals altament capacitats. L'estudiant obtindrà dues titulacions oficials de grau en cinc cursos acadèmics (incloent-hi el treball de fi de grau) i podrà escollir qualsevol de les dues mencions del grau en Enginyeria de Sistemes Aeroespacials i una de les titulacions de l'àmbit de l'enginyeria de telecomunicació.",
      "ambit":
          "Enginyer/a tècnic/a aeronàutic/a, enginyer/a tècnic/a de telecomunicació, enginyer/a aeronàutic/a i enginyer/a de telecomunicació",
      "link":
          "https://www.upc.edu/ca/graus/doble-titulacio-de-enginyeria-de-sistemes-aeroespacials-i-enginyeria-de-sistemes-de-telecomunicacio-o-enginyeria-telematica-castelldefels-eetac",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Sistemes Aeroespacials",
      "branca": "Enginyeria Aeroespacial",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Telecomunicació i Aeroespacial de Castelldefels (EETAC)",
      "nota": "9.744",
      "objectius":
          "El grau en Enginyeria de Sistemes Aeroespacials t’ofereix una formació multidisciplinària en enginyeria de sistemes aeroespacials. Obtindràs un ampli coneixement en els àmbits de la ciència i les tecnologies aeroespacials, especialment quant a infraestructures aeroportuàries i d’aeronavegació i sistemes de transport aeri i de gestió del trànsit aeri. Et formaràs per esdevenir un professional capaç de desenvolupar projectes aeroespacials i de consultoria i integrar-t'hi.",
      "ambit":
          "Companyies aèries i empreses que operen en la gestió de la navegació aèria i del sector aeroportuari, organismes nacionals i internacionals de l’aviació civil, petites i mitjanes empreses aeronàutiques, recerca i desenvolupament de tècniques o solucions innovadores per al sector aeroespacial. Organitzacions i agències aeroespacials, coordinació de projectes (anàlisi de viabilitat, pla director, avantprojecte, projecte constructiu) o estudis per a la construcció, explotació, operació i manteniment d'aeronaus i infraestructures aeronàutiques, gestió aeroportuària (direcció d’aeroports, aeròdroms, heliports, gestió d’operacions, serveis de terra –handling–, seguretat operacional, etc.) i la seva interacció amb l’entorn, verificació i certificació que tingui com a objecte les infraestructures aeroportuàries i d’aeronavegació i qualsevol sistema de gestió de l’espai, el trànsit i el transport aeri, direcció tècnica, peritatge, redacció d’informes, dictàmens i assessorament tècnic en àrees relatives a l’enginyeria tècnica aeronàutica, consultoria tècnica i econòmica, gestió d’empreses aeronàutiques, docència i recerca.",
      "link":
          "https://www.upc.edu/ca/graus/enginyeria-de-sistemes-aeroespacials-castelldefels-eetac",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria en Tecnologies Aeroespacials",
      "branca": "Enginyeria Aeroespacial",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d’Enginyeries Industrial, Aeroespacial i Audiovisual de Terrassa (ESEIAAT)",
      "nota": "12.194",
      "objectius":
          "El grau en Enginyeria en Tecnologies Aeroespacials ofereix una formació sòlida i multidisciplinària en els diferents aspectes de l'enginyeria aeroespacial. Amb aquest grau assoliràs una gran versatilitat per adaptar-te a noves situacions i assimilar els futurs avenços tecnològics de la indústria aeroespacial. Podràs desenvolupar la teva carrera professional en tots els àmbits vinculats a les aeronaus i els vehicles espacials, tant pel que fa al disseny, projecte, fabricació, operació i manteniment, com a les infraestructures necessàries. També podràs treballar en projectes de planificació i construcció d'aeroports, en la gestió d'empreses aeronàutiques, en projectes mediambientals i d'energies renovables, o en activitats de recerca aeronàutica i espacial.",
      "ambit":
          "Disseny, fabricació, manteniment i operació de vehicles aeroespacials i d’obres d’enginyeria aeronàutica, projectació, construcció i gestió de infraestructures aeroportuàries, control i supervisió d’instal·lacions de terra, terminals d’aeroports, senyalització i estructures que serveixen de base per a la correcta navegació aèria, gestió d’empreses aeronàutiques, direcció de projectes mediambientals i de seguretat en l’àmbit de la seva expertesa, docència i recerca.",
      "link":
          "https://www.upc.edu/ca/graus/enginyeria-en-tecnologies-aeroespacials-terrassa-eseiaat",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria en Vehicles Aeroespacials",
      "branca": "Enginyeria Aeroespacial",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d’Enginyeries Industrial, Aeroespacial i Audiovisual de Terrassa (ESEIAAT)",
      "nota": "11.338",
      "objectius":
          "El grau en Enginyeria en Vehicles Aeroespacials ofereix una formació sòlida i multidisciplinària en els diferents aspectes de l'aeronàutica, però fent èmfasi en els aspectes específicament relacionats amb les aeronaus i els vehicles espacials, tant pel que fa al disseny, projecte, fabricació, operació i manteniment, com a les infraestructures necessàries per operar-hi. Amb aquest grau assoliràs una gran versatilitat per adaptar-te a noves situacions i assimilar els futurs avenços tecnològics de la indústria aeroespacial.",
      "ambit":
          "Disseny, projectació, fabricació i manteniment d’aeronaus i vehicles aeroespacials i d’obres d'enginyeria aeronàutica, projectació, construcció i gestió d’infraestructures aeroportuàries, control i supervisió d’instal·lacions de terra, terminals d'aeroports, pistes d'aterratge i de vol, senyalització i estructures per a la correcta navegació aèria, verificació i certificació que tingui com a objecte els vehicles aeroespacials, els sistemes de propulsió aeroespacial, els materials aeroespacials, les infraestructures aeroportuàries i d'aeronavegació i qualsevol sistema de gestió de l'espai, el trànsit i el transport aeri, direcció tècnica, peritatge, redacció d'informes, dictàmens i assessorament tècnic en àrees relatives a l'enginyeria tècnica aeronàutica.",
      "link":
          "https://www.upc.edu/ca/graus/enginyeria-en-vehicles-aeroespacials-terrassa-eseiaat",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    }
  ];
  return result;
}

class Graus {
  String nom, branca, modalitat, localitzacio, objectius, ambit, link, foto;
  double nota;

  Graus(this.nom, this.branca, this.modalitat, this.localitzacio,
      this.objectius, this.ambit, this.link, this.foto, this.nota);

  toDocument() {
    return {
      'nom': this.nom,
      'branca': this.branca,
      'modalitat': this.modalitat,
      'localitzacio': this.localitzacio,
      'objectius': this.objectius,
      'ambit': this.ambit,
      'link': this.link,
      'foto': this.foto,
      'nota': this.nota,
    };
  }

  toJson() => toDocument();

  toPrint() {
    print('Nom: ${this.nom}');
    print('Branca: ${this.branca}');
    print('Modalitat: ${this.modalitat}');
    print('Localitzacio: ${this.localitzacio}');
    print('Objectius: ${this.objectius}');
    print('Ambit: ${this.ambit}');
    print('Link: ${this.link}');
    print('Foto: ${this.foto}');
    print('Nota: ${this.nota}');
  }

  factory Graus.fromJson(Map<String, dynamic> json) {
    double nota = double.parse(json['nota']);
    return new Graus(
        json['nom'] as String,
        json['branca'] as String,
        json['modalitat'] as String,
        json['localitzacio'] as String,
        json['objectius'] as String,
        json['ambit'] as String,
        json['link'] as String,
        json['foto'] as String,
        nota);
  }
  static Graus fromSnapshot(DocumentSnapshot snap) {
    return new Graus(
      snap['nom'] as String,
      snap['branca'] as String,
      snap['modalitat'] as String,
      snap['localitzacio'] as String,
      snap['objectius'] as String,
      snap['ambit'] as String,
      snap['link'] as String,
      snap['foto'] as String,
      snap['nota'] as double,
    );
  }
}

loadGraus() {
  List jsonObjects = loadfile();
  List<Graus> result = [];
  for (var json in jsonObjects) {
    result.add(new Graus.fromJson(json));
  }
  return result;
}

class Firebase {
  final colGraus = Firestore.instance.collection('Graus');

  Future<void> afegeixGrau(Graus item) async {
    try {
      await colGraus.add(item.toDocument());
      print('Grau afegit');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> generalGraus(List<Graus> items) async {
    items.forEach((item) => afegeixGrau(item));
  }
}

void main() => runApp(new Datab());

class Datab extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Datab> {
  var db = new Firebase();
  List<Graus> graus = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.blue[500],
                  onPressed: () {
                    List<Graus> graus = loadGraus();
                    //graus.forEach((grau) => grau.toPrint());
                    db.generalGraus(graus);
                  }),
              Text(
                'Dades a firestore',
              )
            ])),
      ),
    );
  }
}
