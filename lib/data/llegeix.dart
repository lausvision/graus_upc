import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

loadfile() {
  List<Map<String, dynamic>> result = [
    {
      "nom": "Administració i Direcció d'Empreses",
      "branca": "Ciències socials i jurídiques",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre Universitari EAE,C. de Tarragona 110 planta soterranea 08015 - Barcelona",
      "loc": "EAE, Barcelona",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Formar professionals capaços de desenvolupar tasques de direcció, gestió, assessorament, planificació i avaluació de les organitzacions privades o públiques, tant productives com de serveis, i també capaços de desenvolupar capacitats emprenedores i iniciatives empresarials amb una visió holística de les empreses i les organitzacions.",
      "ambit":
          "Sector públic nacional, regional i local, organismes internacionals, docència i investigació, sector financer, empresa privada i exercici lliure de la professió.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/1011-Administracio-i-Direccio-dEmpreses-Centre-Universitari-EAE",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Administració i Direcció d'Empreses",
      "branca": "Ciències socials i jurídiques",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre Universitari Euncet, Ctra. BV 1221 de Terrassa a Talamanca, km 3 08225 - Terrassa",
      "loc": "EUNCET, Terrassa",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Formar professionals capaços de desenvolupar tasques de direcció, gestió, assessorament, planificació i avaluació de les organitzacions privades o públiques, tant productives com de serveis, i també capaços de desenvolupar capacitats emprenedores i iniciatives empresarials amb una visió holística de les empreses i les organitzacions.",
      "ambit":
          "Sector públic nacional, regional i local, organismes internacionals, docència i investigació, sector financer, empresa privada i exercici lliure de la professió.",
      "link": "http://www.euncet.es/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Administració i Direcció d'Empreses",
      "branca": "Ciències socials i jurídiques",
      "modalitat": "Semipresencial",
      "localitzacio":
          "Centre Universitari Euncet, Ctra. BV 1221 de Terrassa a Talamanca, km 3 08225 - Terrassa",
      "loc": "EUNCET, Terrassa",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Formar professionals capaços de desenvolupar tasques de direcció, gestió, assessorament, planificació i avaluació de les organitzacions privades o públiques, tant productives com de serveis, i també capaços de desenvolupar capacitats emprenedores i iniciatives empresarials amb una visió holística de les empreses i les organitzacions.",
      "ambit":
          "Sector públic nacional, regional i local, organismes internacionals, docència i investigació, sector financer, empresa privada i exercici lliure de la professió.",
      "link": "http://www.euncet.es/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Arquitectura Tècnica i Edificació",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Politècnica Superior d'Edificació de Barcelona, Edifici P, Av. del Doctor Marañón, 44-50 08028 - Barcelona",
      "loc": "EPSEB, Barcelona",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Proporcionar una formació adequada de perfil europeu i de caràcter generalista sobre les bases teoricotècniques i les tecnologies pròpies del sector de l'edificació, juntament amb la capacitat de millora contínua i de transmissió del coneixement i formar l'estudiantat amb les competències necessàries per exercir la professió d'arquitecte/a tècnic/a.",
      "ambit":
          "Ordenació i direcció de l'execució d'obres d'edificació, control de la qualitat dels materials de les obres, control de la normativa tècnica de les obres, organització i gestió de l'economia i la seguretat de les obres, treballs en empreses constructores i immobiliàries, consultories tècniques immobiliàries, empreses de taxacions i prestacions i exercici lliure de la professió.",
      "link": "http://www.epseb.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Arquitectura",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Arquitectura del Vallès, C. de Pere Serra, 1-15 08173 - Sant Cugat del Vallès",
      "loc": "ETSAV, Sant Cugat del Vallès",
      "nota": 9.494,
      "notes": [9.494, 8.14, 8.9, 8.32, 8.95],
      "objectius":
          "Formar professionals preparats per a la seva inserció en el mercat laboral capaços de portar a terme projectes independents i exhaustius aplicats al disseny.",
      "ambit":
          "Arquitectura, edificació, intervenció urbana, urbanisme, infraestructures urbanes, disseny i docència.",
      "link": "http://www.etsav.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Arquitectura",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Arquitectura de Barcelona, Campus Sud Edifici A, Av. Diagonal, 649 08028 - Barcelona",
      "loc": "ETSAB, Barcelona",
      "nota": 6.61,
      "notes": [6.61, 5.29, 5.01, 5.0, 5.98],
      "objectius":
          "Formar professionals preparats per a la seva inserció en el mercat laboral capaços de portar a terme projectes independents i exhaustius aplicats al disseny.",
      "ambit":
          "Arquitectura, edificació, intervenció urbana, urbanisme, infraestructures urbanes, disseny i docència.",
      "link": "http://www.etsab.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Ciència i Enginyeria de Dades",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria de Telecomunicació de Barcelona, Campus Nord Edifici B3, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "ETSETB, Barcelona",
      "nota": 12.364,
      "notes": [12.364, 12.02, 10.69, null, null],
      "objectius":
          "Preparar professionals amb una formació sòlida en els fonaments de l'enginyeria i, especialment, en matemàtiques, informàtica i processament del senyal, i proporcionar-los, alhora, flexibilitat i iniciativa davant dels nous reptes tecnològics.",
      "ambit":
          "Àmbits tan diversos com la biotecnologia, la genòmica, el comerç electrònic, l'automoció, les finances, la realitat virtual, la medicina, l'esport, l'energia, el transport, la domòtica, etc., estan immersos en quantitats colossals d'informació que requereixen un tractament matemàtic, estadístic i computacional.",
      "link": "http://www.etsetb.upc.es/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Ciències Culinàries i Gastronòmiques",
      "branca": "Ciències socials i jurídiques",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Agricultura de Barcelona, Campus Baix Llobregat Edifici D4, C. Esteve Terradas, 8 08860 - Castelldefels",
      "loc": "ESAB, Barcelona",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.63],
      "objectius":
          "Formar professionals amb els coneixements en ciències culinàries i gastronòmiques que permetin comprendre i visionar el fenomen culinari i gastronòmic des d'una perspectiva científica, tecnològica, social, cultural i de gestió empresarial, dotant-los de les competències necessàries per innovar, dissenyar, produir i gestionar serveis culinaris i gastronòmics en els àmbits de l'alta cuina, la restauració comercial i col·lectiva, la indústria alimentària i l'hoteleria, així com desenvolupar projectes d'investigació i desenvolupament en el camp de les ciències gastronòmiques.",
      "ambit":
          "Restauració col·lectiva o social, restauració comercial, hoteleria, serveis de restauració oferts pel sector de l'hoteleria, indústria alimentària, productes i activitats turístiques associats a la gastronomia com a recurs turístic, consultoria, formació, recerca i innovació en centres públics i privats de R+D+I.",
      "link": "http://www.esab.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Ciències i Tecnologies Aplicades a l'Esport i al Fitnes",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre Universitari Euncet, Can Dragó, C. de Rosselló i Porcel, 7-11 08016 - Barcelona",
      "loc": "EUNCET, Barcelona",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Adquirir competències professionals vinculades a les activitats relacionades amb l'esport i el condicionament físic amb una visió preponderant dels mercats internacionals i la internacionalització dels productes, els serveis i les organitzacions.",
      "ambit":
          "Expert/a en tecnologia aplicada a l'esport i al fitnes, responsable d'unitats de disseny, comercialització i distribució de productes vinculats a l'esport i al fitnes, responsable de la planificació, el desenvolupament i la comercialització de serveis esportius i de fitnes, gestor/a i consultor/a d'empreses d'organització d'esdeveniments esportius, especialista en la gestió d'activitats esportives, de la salut i del fitnes.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/4477-Ciencies-i-Tecnologies-Aplicades-a-lEsport-i-al-Fitnes",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Ciències i Tecnologies del Mar",
      "branca": "Ciències",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Agricultura de Barcelona, Campus Baix Llobregat Edifici D4, C. Esteve Terradas, 8 08860 - Castelldefels",
      "loc": "ESAB, Castelldefels",
      "nota": 6.117,
      "notes": [6.117, 5.0, null, null, null],
      "objectius":
          "Formar professionals per dur a terme feines de recerca i assessorament en els àmbits mediambiental i climàtic, i sobre els impactes de les actuacions econòmiques i socials en el medi marí i costaner (aprofitament ètic, responsable i sostenible dels recursos marins, caracterització de costes, canvi climàtic i el seu impacte sobre el medi marí i la zona costanera, etc.). A més a més, orientar per a la formació d'altres científics i tècnics i, en general, de la societat sobre totes les activitats relacionades amb les ciències i les tecnologies marines (bàsiques i aplicades), el seu desenvolupament i la seva divulgació.",
      "ambit":
          "Empreses del sector primari (pesca i aqüicultura, oceanografia), industrial i de serveis; a més a més, l'administració (conservació, impacte ambiental, bioindicadors, planificació i gestió del litoral i el món marí) i empreses que disposin de departaments de recerca.",
      "link": "http://www.esab.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Disseny i Desenvolupament de Videojocs",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre de la Imatge i la Tecnologia Multimèdia (CITM),C. de la Igualtat, 33 08222 - Terrassa / C. de Badajoz, 73-77 08005 - Barcelona ",
      "loc": "CITM, Terrassa",
      "nota": 5.018,
      "notes": [5.018, 7.55, 7.46, 7.25, 7.22],
      "objectius":
          "Formar professionals que siguin capaços de dissenyar i produir videojocs i continguts orientats a l'entreteniment interactiu.",
      "ambit":
          "Expert/a en desenvolupament de videojocs, expert/a en programació d'aplicacions gràfiques interactives en temps real, programador/a d'aplicacions, dissenyador/a de videojocs, productor/a de videojocs, artista tècnic/a, dissenyador/a 3D, animador/a 2D i 3D per a videojocs i continguts digitals, analista de dades de videojocs, control de qualitat, assaig i balanceig i consultor/a en l'àmbit de la ludificació.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/3116-Disseny-i-Desenvolupament-de-Videojocs-Campus-Terrassa",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Disseny i Desenvolupament de Videojocs (anglès)",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre de la Imatge i la Tecnologia Multimèdia (CITM),C. de la Igualtat, 33 08222 - Terrassa / C. de Badajoz, 73-77 08005 - Barcelona ",
      "loc": "CITM, Terrassa",
      "nota": 7.647,
      "notes": [7.647, 8.81, 8.6, 8.2, 6.66],
      "objectius":
          "Formar professionals que siguin capaços de dissenyar i produir videojocs i continguts orientats a l'entreteniment interactiu.",
      "ambit":
          "Expert/a en desenvolupament de videojocs, expert/a en programació d'aplicacions gràfiques interactives en temps real, programador/a d'aplicacions, dissenyador/a de videojocs, productor/a de videojocs, artista tècnic/a, dissenyador/a 3D, animador/a 2D i 3D per a videojocs i continguts digitals, analista de dades de videojocs, control de qualitat, assaig i balanceig i consultor/a en l'àmbit de la ludificació.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/3568-Disseny-i-Desenvolupament-de-Videojocs-Docencia-en-Angles-Campus-Barcelona",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Disseny, Animació i Art Digital",
      "branca": "Arts i humanitats",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre de la Imatge i la Tecnologia Multimèdia (CITM), C. de la Igualtat, 33 08222 - Terrassa",
      "loc": "CITM, Terrassa",
      "nota": 9.422,
      "notes": [9.422, 9.1, 7.59, null, null],
      "objectius":
          "Comprendre, abastar i executar tot el procés de disseny de contingut digital i animació, i intervenir en cadascuna de les etapes implicades. Identificar, analitzar i conèixer tots els possibles elements i els aspectes presents en una producció d'art digital, a més de portar a terme el disseny artístic i gràfic, el modelatge i l'animació 3D utilitzant les eines de disseny més avançades i actuals.",
      "ambit":
          "Animació, producció i postproducció audiovisual, disseny gràfic, art digital, fotografia, videojocs, tractament digital de la imatge (CGI), gamificació, comunicació audiovisual, publicitat.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/4220-Disseny-Animacio-i-Art-Digital",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Alimentària",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Agricultura de Barcelona, Campus Baix Llobregat Edifici D4, C. Esteve Terradas, 8 08860 - Castelldefels",
      "loc": "ESAB, Castelldefels",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Formar professionals amb els coneixements científics i tecnològics necessaris per projectar, planificar, dirigir i gestionar els recursos relacionats amb la tecnologia i el processament de productes agroalimentaris, i amb els coneixements sobre els mecanismes de control de qualitat i seguretat dels aliments i la viabilitat econòmica de les empreses alimentàries. Tot això, des de la perspectiva de la innovació i el desenvolupament tecnològic i del respecte al medi ambient.",
      "ambit":
          "Director/a tècnic/a d'empreses i indústries del sector alimentari, i tècnic/a de comercialització i màrqueting, especialista en recerca, disseny i desenvolupament tecnològic de nous productes alimentaris, especialista en modelització i optimització de processos, exercici lliure de la professió: consultoria, assessoria, peritatge i direcció d'obres en l'àmbit agroalimentari.",
      "link": "http://www.esab.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Ambiental",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Agricultura de Barcelona, Campus Baix Llobregat Edifici D4, C. Esteve Terradas, 8 08860 - Castelldefels / Escola Tècnica Superior d'Enginyeria de Camins, Canals i Ports de Barcelona, Campus Nord Edifici C2, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "ESAB, Castelldefels",
      "nota": null,
      "notes": [null, null, null, null, null],
      "objectius":
          "Formar professionals capaços de donar solucions tècniques a problemes mediambientals (consum no sostenible de recursos, generació de residus, contaminació d'aigües, aire i sòls, etc.) proporcionant-los coneixements sobre prevenció de danys ambientals, protecció de l'entorn i millora de la qualitat ambiental.",
      "ambit":
          "Indústria, enginyeries, administració i serveis, empreses i consultories ambientals.",
      "link": "http://www.esab.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Biomèdica",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Barcelona Est, Campus Diagonal Besós Edifici A, Av. d' Eduard Maristany, 16 08019 - Barcelona",
      "loc": "EEBE, Barcelona",
      "nota": 11.354,
      "notes": [11.354, 11.25, 11.27, 11.28, 11.13],
      "objectius":
          "Formar professionals capaços de projectar, dirigir i coordinar activitats relacionades amb els productes i serveis sociosanitaris pel que fa a concepció, disseny, fabricació, avaluació i certificació, entre altres.",
      "ambit":
          "Tècnic/a en diagnòstic in vitro, nefrologia, cirurgia cardiovascular, neurocirurgia i tractament del dolor, implants per a cirurgia ortopèdica i traumatologia, ortopèdia, productes sanitaris d'un sol ús, serveis sanitaris, tecnologia dental, òptica i oftalmologia. Especialista en adquisició d'equipament, utilització adequada d'equips, racionalització d'ús, actualització, augment d'eficàcia de processos, millora de la qualitat assistencial, telemedicina, monitorització remota, etc.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/1568-Enginyeria-Biomedica",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Civil",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria de Camins, Canals i Ports de Barcelona, Campus Nord Edifici C2, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "Camins, Barcelona",
      "nota": null,
      "notes": [null, null, null, null, null],
      "objectius":
          "Formar professionals amb una formació transversal i versàtil, ben preparats per comprendre, resoldre i gestionar problemes relacionats amb el territori i el medi ambient. Resoldre problemes d¿enginyeria relacionats amb la planificació, el disseny, la construcció i el manteniment d¿infraestructures eficients i sostenibles (autovies, carreteres, ponts, línies de ferrocarril, ports, canals, preses, xarxes d¿abastament, xarxes de sanejament, depuradores, etc.).",
      "ambit":
          "Planificació, gestió i explotació d'infraestructures en una administració pública o en un ens privat, gestió i/o execució en una empresa constructora, gestió en una concessionària, enginyeria i consultoria de projectes, direccions d'obra i gestió de projectes relacionada amb l'obra pública, recerca en temes relacionats amb les infraestructures i professional autònom o emprenedor.",
      "link": "http://www.camins.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Electrònica Industrial i Automàtica",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Barcelona Est, Campus Diagonal Besós Edifici A, Av. d' Eduard Maristany, 16 08019 - Barcelona",
      "loc": "EEBE, Barcelona",
      "nota": 7.412,
      "notes": [7.412, 8.78, 8.23, 9.0, 8.77],
      "objectius":
          "Formar professionals amb una visió clara de l'electrònica industrial com a element imprescindible en els sistemes productius actuals i en les instal·lacions de producció de béns de consum i de serveis en general. A les persones titulades no els ha de ser aliè el càlcul de circuits elèctrics i electrònics, a més de la informàtica, en especial, la informàtica industrial i els busos de camp, i el conjunt dels sistemes de comunicacions, la instrumentació i els sistemes automàtics, el seu monitoratge i control, juntament amb les tècniques electròniques analògiques, digitals i de potència necessàries per implementar solucions a problemes de naturalesa electrònica o automàtica.",
      "ambit":
          "Desenvolupament de l'activitat professional en diversos àmbits, treballant en projectes d'automatització i robòtica industrial, sistemes electrònics de control, potència i instrumentació, instal·lacions industrials, disseny de màquines automàtiques, desenvolupament de sistemes d'adquisició i tractament de dades, i sistemes d'informàtica industrial i de monitoratge de processos. Tasques d'implementació, producció i manteniment d'equips, instal·lacions i productes industrials, de promoció i comercialització d'equips especialitzats i de redacció d'informes tècnics d'assessorament o de viabilitat.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/1571-Enginyeria-Electronica-Industrial-i-Automatica",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Electrònica de Telecomunicació",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria de Telecomunicació de Barcelona, Campus Nord Edifici B3, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "ETSETB, Barcelona",
      "nota": 9.47,
      "notes": [9.47, 9.73, null, null, null],
      "objectius":
          "Formar professionals en l'àmbit de l'electrònica, amb capacitat per treballar en un entorn multidisciplinari. Proporcionar les bases matemàtiques, científiques i tecnològiques associades a l'electrònica.",
      "ambit":
          "Electrònica de consum, telecomunicació, microtecnologia i nanotecnologia, indústria de l'automòbil, automàtica i robòtica, multimèdia, imatge i so, energia i sostenibilitat, biomedicina i sanitat, fotònica i tecnologies de la llum, indústria aeronàutica i aeroespacial i centres d'R+D+I.",
      "link": "http://www.etsetb.upc.es/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Elèctrica",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Barcelona Est, Campus Diagonal Besós Edifici A, Av. d' Eduard Maristany, 16 08019 - Barcelona",
      "loc": "EEBE, Barcelona",
      "nota": 5.756,
      "notes": [5.756, 5.77, 5.0, 5.0, 6.91],
      "objectius":
          "Donar a conèixer en profunditat, a més de les disciplines comunes a l'enginyeria industrial, les màquines elèctriques, les instal·lacions d'alta, de mitjana i de baixa tensió, la regulació i el control de dispositius elèctrics, l'electrònica per a aquest control, tant si és per a baixa com per a alta potència, centrals elèctriques, energies renovables, sistemes hidràulics i tèrmics i electrotècnia.",
      "ambit":
          "Empreses dedicades a l'elaboració de projectes tècnics, mesuraments, taxacions, valoracions, peritatges, estudis i informes en l'àmbit de l'enginyeria elèctrica, la consultoria i els serveis, la construcció i les obres públiques, la distribució d'aigua, gas i electricitat, la instal·lació i el manteniment electromecànic, la fabricació de maquinària elèctrica, electrònica i mecànica, els productes químics, els automòbils i accessoris, la siderometal·lúrgia, la matriceria i la caldereria, disseny i direcció d'obra d'instal·lacions domèstiques i industrials, gestió energètica i mediambiental, manteniment de qualsevol tipus d'indústries, producció d'una gran varietat de productes industrials i centrals elèctriques.",
      "link": "http://universitats.gencat.cat/ca/detalls/oferta/1570-Enginyeria-Electrica",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Física",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria de Telecomunicació de Barcelona, Campus Nord Edifici B3, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "ETSETB, Barcelona",
      "nota": 12.77,
      "notes": [12.77, 12.73, 12.69, 12.21, 12.56],
      "objectius":
          "Preparar professionals amb una formació sòlida en els fonaments de l'enginyeria, i proporcionar-los flexibilitat i iniciativa davant nous reptes tecnològics. En concret, les persones graduades reben una preparació de perfil polivalent, amb una formació àmplia en física fonamental, matemàtiques i diverses branques de l'enginyeria —electrònica, comunicacions, informàtica—, complementada amb coneixements de química i biologia. Aportar a l'estudiantat els coneixements de les bases científiques i les aplicacions tecnològiques de diverses tecnologies emergents: nanotecnologies, biotecnologies, microelectrònica i nanoelectrònica, nous materials i fotònica, i la seva aplicació en diversos camps de l'enginyeria, incloent-hi les tecnologies espacials. La característica comuna d'aquestes tecnologies emergents és que són transversals als diversos sectors industrials, ja que proporcionen solucions a problemes d'enginyeria molt diversos. Capacitar per a la utilització dels coneixements teòrics i pràctics adquirits en la definició i el plantejament de problemes i en la recerca de les seves solucions tant en contextos acadèmics com professionals. Integrar aspectes econòmics i d'impacte social, i preparar les persones joves graduades per incorporar-se tant al mercat laboral més pròxim com al mercat global en expansió.",
      "ambit":
          "Empreses de telecomunicacions, incloent-hi les comunicacions per satèl·lit, empreses de biotecnologia, empreses de micro i nanotecnologia, microelectrònica i afins indústria d'alta tecnologia, incloent-hi la fotònica, indústria aeroespacial, docència no universitària, universitària i recerca.",
      "link": "http://www.etsetb.upc.es/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Informàtica",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Facultat d'Informàtica de Barcelona, Campus Nord Edifici B6, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "FIB, Barcelona",
      "nota": 9.255,
      "notes": [9.255, 9.41, 8.74, 8.35, 7.81],
      "objectius":
          "Oferir els coneixements necessaris vinculats al disseny, la construcció i el manteniment de sistemes informàtics, especialment en l'àmbit de les tecnologies de la informació. Formar l'estudiantat perquè pugui definir i seleccionar plataformes tant de maquinari (hardware) com de programari (software) per al desenvolupament d'aplicacions informàtiques. Capacitar per a l'aplicació dels conceptes d'economia i de gestió de recursos humans als projectes informàtics, i la comprensió de les necessitats tecnològiques d'una organització en tot allò que es refereix a les tecnologies de la informació i la comunicació.",
      "ambit":
          "Departaments d'informàtica, empreses del sector TIC, entitats financeres, empreses de telecomunicacions, d'electricitat, d'alta tecnologia i de seguretat, consultores informàtiques i recerca.",
      "link": "http://www.fib.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Informàtica",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Politècnica Superior d'Enginyeria de Vilanova i la Geltrú, Campus Vilanova i la Geltrú Edifici VG2, Av. de Víctor Balaguer, 1 08800 - Vilanova i la Geltrú",
      "loc": "EPSEVG, Vilanova i la Geltrú",
      "nota": 7.272,
      "notes": [7.272, 6.9, 6.14, 5.37, 5.0],
      "objectius":
          "Oferir els coneixements necessaris vinculats al disseny, la construcció i el manteniment de sistemes informàtics, especialment en l'àmbit de les tecnologies de la informació. Formar l'estudiantat perquè pugui definir i seleccionar plataformes tant de maquinari (hardware) com de programari (software) per al desenvolupament d'aplicacions informàtiques. Capacitar per a l'aplicació dels conceptes d'economia i de gestió de recursos humans als projectes informàtics, i la comprensió de les necessitats tecnològiques d'una organització en tot allò que es refereix a les tecnologies de la informació i la comunicació.",
      "ambit":
          "Departaments d'informàtica, empreses del sector TIC, entitats financeres, empreses de telecomunicacions, d'electricitat, d'alta tecnologia i de seguretat, consultores informàtiques i recerca.",
      "link": "http://www.epsevg.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Mecànica",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Barcelona Est, Campus Diagonal Besós Edifici A, Av. d' Eduard Maristany, 16 08019 - Barcelona",
      "loc": "EEBE, Barcelona",
      "nota": 7.766,
      "notes": [7.766, 7.78, 7.69, 7.48, 8.52],
      "objectius":
          "Formar professionals amb uns coneixements profunds en el disseny, desenvolupament i ús de maquinaria, processos i sistemes mecànics, criteris de selecció de materials i disseny estructural de sistemes i processos de producció. Proporcionar a l'estudiantat els coneixements necessaris per a l'anàlisi, el càlcul, el disseny i l'assaig de màquines, instal·lacions industrials, motors hidràulics i tèrmics, estructures i construccions industrials i sistemes productius. Aportar a l'estudiantat una formació multidisciplinària en els àmbits de la mecànica de fluids, la termotècnia, l'electricitat, l'automatització, el disseny i la construcció de sistemes de climatització i refrigeració industrial i les tècniques d'enginyeria gràfica.",
      "ambit":
          "Empreses dedicades a l'elaboració de projectes tècnics, mesures, taxacions, valoracions, peritatges, estudis i informes a l'àmbit de l'enginyeria mecànica, disseny i direcció d'obra d'instal·lacions domèstiques i industrials, gestió mediambiental, manteniment d'indústrial, construcció industrial, producció industrial a indústries de calor i fred industrial, climatització i refrigeració, tractament i transport de fluids.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/1040-Enginyeria-Mecanica",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Minera",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Politècnica Superior d'Enginyeria de Manresa, Av. de les Bases de Manresa, 61-73 08242 - Manresa",
      "loc": "EPSEM, Manresa",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Gestionar les etapes d'exploració, prospecció, explotació i restauració en qualsevol projecte destinat a l'obtenció de recursos minerals. ",
      "ambit":
          "Sector de la mineria: prospecció, explotació i restauració tant en mineria subterrània com en explotacions mineres a cel obert. Plantes de tractament d'àrids, fàbriques de ciment, empreses dedicades a les voladures en explotacions mineres i obra civil, i empreses dedicades a la fabricació de formigó i roques ornamentals i industrials. Sector de l'obra civil: empreses dedicades a l'obra pública (túnels, carreteres, urbanitzacions). Altres sectors: estudis sobre impacte ambiental, planificació territorial, geologia aplicada, seguretat laboral, organització i control de qualitat i administracions públiques.",
      "link": "http://www.epsem.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria Química",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Barcelona Est, Campus Diagonal Besós Edifici A, Av. d' Eduard Maristany, 16 08019 - Barcelona",
      "loc": "EEBE, Barcelona",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Formar professionals amb uns coneixements profunds dels fonaments dels processos de transformació de matèria i energia, amb i sense reacció química, de la concepció, el càlcul, el disseny, la construcció i l'operació d'instal·lacions o equips en els quals la matèria experimenta un canvi d'estat, de contingut d'energia o de composició. Aportar a l'estudiantat els coneixements tècnics i les competències necessàries per organitzar, dissenyar i controlar la producció de plantes químiques, i per gestionar i desenvolupar plans de control de qualitat i de gestió mediambiental, propis de la indústria química i sectors relacionats, com el farmacèutic, biotecnològic, alimentari o mediambiental.",
      "ambit":
          "Indústria farmacèutica, paperera, petroquímica, alimentària, metal·lúrgica i energètica, laboratoris d'anàlisi química, d'assajos i de control de qualitat, empreses consultores i assessories.",
      "link": "http://universitats.gencat.cat/ca/detalls/oferta/4091-Enginyeria-Quimica",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria d'Automoció",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Politècnica Superior d'Enginyeria de Manresa, Av. de les Bases de Manresa, 61-73 08242 - Manresa",
      "loc": "EPSEM, Manresa",
      "nota": 9.708,
      "notes": [9.708, 9.03, 8.86, null, null],
      "objectius":
          "Formar enginyers especialitzats amb una visió integral de la indústria de l'automoció i de tota la seva cadena de valor. Proporcionar els coneixements necessaris en disseny industrial, materials, propulsió, tecnologies mecàniques i de fabricació, aerodinàmica i noves TIC aplicades a l'automoció.",
      "ambit":
          "Indústria de l'automòbil. Indústria de components mecànics de l'automòbil. Indústria de components elèctrics i electrònics de l'automòbil. Indústria de transport pesat per carretera. Indústria de la motocicleta. Enginyeries d'homologacions de vehicles. Indústries de disseny industrial. Indústries de components auxiliars. Enginyeries de vehicles de competició.",
      "link": "http://www.epsem.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Ciències Agronòmiques",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Agricultura de Barcelona, Campus Baix Llobregat Edifici D4, C. Esteve Terradas, 8 08860 - Castelldefels / Escola Tècnica Superior d'Enginyeria de Camins, Canals i Ports de Barcelona, Campus Nord Edifici C2, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "ESAB, Castelldefels",
      "nota": 5.0,
      "notes": [5.0, 5.0, null, null, null],
      "objectius":
          "Adquirir els coneixements científics i tecnològics necessaris per projectar, planificar, dirigir i gestionar els processos relacionats amb la producció agrícola i ramadera; els mecanismes de control de qualitat i seguretat dels aliments; la viabilitat econòmica de les empreses agràries; les actuacions destinades a la preservació i la millora mediambiental i paisatgística de l'entorn; l'ordenació del territori, i la producció hortofructícola.",
      "ambit":
          "Direcció tècnica d'explotacions agrícoles i ramaderes i de planters, exercici lliure de la professió: projectes, consultoria, assessoria, peritatges, direcció d'obres, estudis ambientals, aplicacions topogràfiques, estudis de seguretat i salut laboral, etc., tècnic/a d'administracions públiques: desenvolupament rural, ordenació i gestió del territori en el medi rural, planificació i gestió d'espais verds i zones esportives, gestió i aprofitament de residus municipals, restauració i recuperació d'espais, tècnic/a d'empreses de serveis agraris: instal·lacions agrícoles i ramaderes, infraestructura rural, maquinària agrícola, llavors, fitosanitaris, adobs, regs, informàtica agrària, control de qualitat, etc., gestió i maneig de recursos hídrics per a ús agrícola i de recursos agroenergètics, i aprofitament de residus agrícoles, direcció i gestió d'empreses i cooperatives agràries i tècnic/a de comercialització i màrqueting, tècnic/a d'empreses de serveis mediambientals i paisatgístics: estudis d'impacte i restauració ambiental i disseny i projecció de jardins i àrees verdes, especialista en recerca i desenvolupament en empreses i organismes públics: biotecnologia agrària, desenvolupament rural, economia agrària, enginyeria alimentària, enginyeria rural, gestió del medi ambient, producció animal i producció vegetal. Aquest grau habilita per a l'exercici de la professió regulada d'enginyer/a tècnic/a agrícola.",
      "link": "http://www.esab.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Disseny Industrial i Desenvolupament del Producte",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Politècnica Superior d'Enginyeria de Vilanova i la Geltrú, Campus Vilanova i la Geltrú Edifici VG2, Av. de Víctor Balaguer, 1 08800 - Vilanova i la Geltrú",
      "loc": "EPSEVG, Vilanova i la Geltrú",
      "nota": 5.832,
      "notes": [5.832, 5.57, 5.0, 5.81, 5.0],
      "objectius":
          "Formar professionals que siguin capaços de crear nous productes, conceptes i serveis que aportin valor afegit al sistema productiu, portant la direcció i la gestió de tot el procés de vida d'un producte. Els graduats i les graduades hauran de conèixer amb profunditat, a més de les disciplines comunes a l'enginyeria industrial, el disseny i el desenvolupament de productes, l'anàlisi i la identificació d'oportunitats d'innovació en un mercat globalitzat, atenent a les necessitats socials i futures. Tot això, respectant els drets fonamentals, els drets humans i el medi ambient, i treballant en favor del progrés i del desenvolupament de l'entorn socioeconòmic més proper.",
      "ambit":
          "Empreses de consultoria i d'assessoria, empreses de fabricació i de disseny de màquines, factories d'automòbils i d'accessoris, empreses siderometal·lúrgiques i matriceres i docència.",
      "link": "http://www.epsevg.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Disseny Industrial i Desenvolupament del Producte",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Enginyeries Industrial, Aeroespacial i Audiovisual de Terrassa, C. de Colom, 1-11 08222 - Terrassa",
      "loc": "ESEIAAT, Terrassa",
      "nota": 10.094,
      "notes": [10.094, 10.38, 9.93, 10.16, 9.5],
      "objectius":
          "Formar professionals que siguin capaços de crear nous productes, conceptes i serveis que aportin valor afegit al sistema productiu, portant la direcció i la gestió de tot el procés de vida d'un producte. Els graduats i les graduades hauran de conèixer amb profunditat, a més de les disciplines comunes a l'enginyeria industrial, el disseny i el desenvolupament de productes, l'anàlisi i la identificació d'oportunitats d'innovació en un mercat globalitzat, atenent a les necessitats socials i futures. Tot això, respectant els drets fonamentals, els drets humans i el medi ambient, i treballant en favor del progrés i del desenvolupament de l'entorn socioeconòmic més proper.",
      "ambit":
          "Empreses de consultoria i d'assessoria, empreses de fabricació i de disseny de màquines, factories d'automòbils i d'accessoris, empreses siderometal·lúrgiques i matriceres i docència.",
      "link": "http://www.eseiaat.upc.edu/ca",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Materials",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Barcelona Est, Campus Diagonal Besós Edifici A, Av. d' Eduard Maristany, 16 08019 - Barcelona",
      "loc": "EEBE, Barcelona",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 7.59],
      "objectius":
          "Formar professionals amb una preparació científica i tècnica multidisciplinària amb capacitat per dissenyar, desenvolupar, implementar, gestionar i millorar la producció, la transformació, el processament, el control, el reciclatge i l'emmagatzematge de materials, la seguretat i la integritat de materials i components, ja siguin materials metàl·lics, ceràmics, polímers, compostos o biològics, etc. A més, aquest estudi dotarà els professionals d'una gran versatilitat per adaptar-se a noves situacions i assimilar els futurs avenços tecnològics que la indústria necessiti per millorar els seus productes i processos. Amb aquesta titulació s'adquiriran les capacitats necessàries per integrar-se en qualsevol professió dels àmbits relacionats amb el desenvolupament industrial, la recerca o la innovació.",
      "ambit":
          "Producció de materials, control de materials, gestió i serveis relacionats amb els materials, el medi ambient i l'ús sostenible dels materials i recerca.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/1447-Enginyeria-de-Materials",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Sistemes Aeroespacials",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Telecomunicació i Aeroespacial de Castelldefels, Campus Baix Llobregat Edifici C4, C. Esteve Terradas, 7 08860 - Castelldefels",
      "loc": "EETAC, Castelldefels",
      "nota": 9.744,
      "notes": [9.744, 9.19, 9.46, 9.44, 9.12],
      "objectius":
          "Aportar a l'estudiantat una formació pluridisciplinària amb un ampli coneixement en matèries bàsiques, científiques i tecnològiques perquè sigui capaç d'aprendre nous mètodes i teories, adaptar-se a les noves situacions i assimilar els futurs avenços tecnològics dins de l'enginyeria en sistemes aeroespacials. La menció aeronavegació pretén formar professionals que coneguin i comprenguin l'estructuració de l'espai aeri, l'aviònica i els sistemes per a la navegació i la circulació aèries. La menció en aeroports pretén formar professionals que coneguin i comprenguin el transport aeri i el manteniment de pistes d'enlairament, hangars, terminals, torres de control i accessos de viatgers i mercaderies, així com la construcció, el manteniment i l'administració d'aeroports.",
      "ambit":
          "Companyies aèries, indústria aeroespacial, organismes nacionals i internacionals de l'aviació civil, organitzacions o agències aeroespacials, centres d'investigació i/o desenvolupament.",
      "link": "http://www.eetac.upc.edu/ca",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Sistemes Audiovisuals",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Enginyeries Industrial, Aeroespacial i Audiovisual de Terrassa, C. de Colom, 1-11 08222 - Terrassa",
      "loc": "ESEIAAT, Terrassa",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Preparar professionals polivalents, amb una formació genèrica en enginyeria de telecomunicacions i amb capacitat per concebre, dissenyar, implementar i operar productes, sistemes i serveis en el camp de l'enginyeria de sistemes audiovisuals, inclosos els camps de l'acústica, la imatge, l'àudio, el vídeo i els entorns multimèdia.",
      "ambit":
          "Disseny, desenvolupament i gestió de sistemes per a la captació, el processament, la transmissió i la recepció de continguts d'àudio o vídeo, projecció i gestió de l'execució d'instal·lacions de telecomunicació públiques i privades, i de solucions d'acústica arquitectònica i acústica ambiental, empreses d'equips electrònics i informàtics per al sector audiovisual, disseny de continguts multimèdia en instal·lacions de gravació i difusió de ràdio i televisió.",
      "link": "http://www.eseiaat.upc.edu/ca",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Sistemes Biològics",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Agricultura de Barcelona, Campus Baix Llobregat Edifici D4, C. Esteve Terradas, 8 08860 - Castelldefels / Escola Tècnica Superior d'Enginyeria de Camins, Canals i Ports de Barcelona, Campus Nord Edifici C2, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "ESAB, Castelldefels",
      "nota": 6.402,
      "notes": [6.402, 5.4, 7.35, 6.93, 5.54],
      "objectius":
          "Oferir els coneixements científics i tecnològics necessaris per dissenyar, planificar, dirigir i gestionar processos orientats a la producció i la transformació de materials biològics per utilitzar-los a la indústria, la producció d'energia i la recuperació i la millora ambiental. Tot plegat, des de la perspectiva de la innovació i el desenvolupament tecnològic i el respecte al medi ambient.",
      "ambit":
          "Producció de biocombustibles i bioproductes industrials, tractament biològic i valorització de residus, bioremediació ambiental, tractament d'aigües residuals, bioinstrumentació, disseny i operació de bioreactors, disseny i maneig d'instal·lacionsper a la producció, l'emmagatzematge i la transformació de material vegetal i disseny i maneig d'instal·lacions aqüícoles.",
      "link": "http://www.esab.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Sistemes TIC",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Politècnica Superior d'Enginyeria de Manresa, Av. de les Bases de Manresa, 61-73 08242 - Manresa",
      "loc": "EPSEM, Manresa",
      "nota": 5.0,
      "notes": [5.0, 5.2, 5.22, 5.0, 5.0],
      "objectius":
          "Formar professionals capaços de donar resposta a problemes d'enginyeria que integren simultàniament aspectes dels àmbits de l'electrònica, la informàtica i les comunicacions. Les persones titulades, d'una banda, disposaran d'un ampli ventall de coneixements, atesa la formació generalista en els tres àmbits esmentats, i, d'altra banda, seran clau per atendre un sector emergent de gran impacte com el que se centra en els camps dels electrodomèstics, els automòbils, la maquinària de producció, els ginys electrònics portàtils, els sistemes de control de trànsit o l'equipament mèdic, entre d'altres.",
      "ambit":
          "Indústria de l'automòbil, incloent-hi l'auxiliar, empreses que desenvolupen maquinària de producció, equipaments d'assaig i/o de laboratori, indústria biomèdica, indústria electrònica, indústria domòtica o mediambiental, indústria de sistemes de control i empreses que desenvolupen sistemes integrats o sistemes complets dins un xip.",
      "link": "http://www.epsem.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de Tecnologies i Serveis de Telecomunicació",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria de Telecomunicació de Barcelona, Campus Nord Edifici B3, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "ETSETB, Barcelona",
      "nota": 6.058,
      "notes": [6.058, 6.92, 5.0, 5.53, 5.31],
      "objectius":
          "Formar professionals amb un perfil polivalent, amb una formació àmplia i profunda en enginyeria de telecomunicació i amb capacitat per concebre, dissenyar, implementar i operar productes, sistemes i serveis en els àmbits dels sistemes de telecomunicació, la telemàtica, l'electrònica i els sistemes audiovisuals. Aquest estudi segueix la iniciativa CDIO, que han incorporat les principals universitats del món per a la formació integral en enginyeria. La CDIO inclou el treball de les competències i habilitats que s'adapten al perfil que necessiten les empreses o institucions, perquè les persones titulades puguin esdevenir emprenedors i empresaris o puguin fer recerca.",
      "ambit":
          "Telecomunicacions, informàtica, consultoria de negoci, aeronàutica i aeroespacial, sanitat, indústria, transport, universitat i recerca.",
      "link": "http://www.etsetb.upc.es/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria de l'Energia",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola d'Enginyeria de Barcelona Est, Campus Diagonal Besós Edifici A, Av. d' Eduard Maristany, 16 08019 - Barcelona",
      "loc": "EEBE, Barcelona",
      "nota": 8.582,
      "notes": [8.582, 7.23, 8.21, 7.93, 8.75],
      "objectius":
          "Potenciar una visió clara de l'energia, l'eficiència, l'estalvi, la gestió, la generació, els elements i el mercat energètic. Aportar idees clares sobre sostenibilitat, eficiència global, ètica professional i tots els elements que permetin a particulars, empreses i institucions tenir polítiques energètiques d'estalvi, de sostenibilitat i de racionalitat en l'ús de l'energia. Facilitar l'aprofundiment en les energies convencionals i en les renovables com l'eòlica, la solar, la tèrmica, la fotovoltaica, la biomassa, la geotèrmica, la minihidràulica, el biogàs, els biocarburants, l'hidrogen, les cèl·lules de combustible, etc. Proporcionar una formació generalista com a enginyers i enginyeres.",
      "ambit":
          "Enginyeries, empreses amb utilització intensiva d'energia, empreses productores i revenedores d'energia, exercici d'activitats d'R+D+I a les empreses, centres i grups de recerca científica i tecnològica, tant públics com privats, administracions locals, autonòmiques i estatals i exercici de la docència, tant en ensenyament secundari com universitari.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/1569-Enginyeria-de-lEnergia",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria en Geoinformació i Geomàtica",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Politècnica Superior d'Edificació de Barcelona, Edifici P, Av. del Doctor Marañón, 44-50 08028 - Barcelona",
      "loc": "EPSEB, Barcelona",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Proporcionar una formació adequada de perfil europeu i de caràcter generalista sobre les bases teoricotècniques i les tecnologies pròpies del sector de la geomàtica i la geoinformació, i emmarcada en el desenvolupament de la capacitat de millora contínua i de transmissió del coneixement. Dotar l'estudiantat de les competències necessàries per a l'exercici de la professió d'enginyer tècnic en topografia, d'acord amb allò que disposa el marc jurídic.",
      "ambit":
          "Sistemes d'informació geogràfica, ús de geoinformació per a aplicacions mòbils i dades massives (big data), sistemes de posicionament global (GPS‐GNSS), ciutats intel·ligents (smart cities), control de flotes, fotogrametria (incloent-hi l'ús de vehicles no tripulats: drons i UAV), teledetecció, geodèsia i topografia.",
      "link": "http://www.epseb.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria en Sistemes i Tecnologia Naval",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Facultat de Nàutica de Barcelona, C. Pla de Palau, 18 08003 - Barcelona",
      "loc": "FNB, Barcelona",
      "nota": 5.142,
      "notes": [5.142, 5.0, 5.02, 5.97, 5.44],
      "objectius":
          "Proporcionar als futurs titulats i titulades els coneixements necessaris per exercir com a  expert en propulsió i sistemes del vaixell. Aportar a l'estudiantat una formació amb una marcada orientació professional cap a les activitats tecnològiques lligades a l'àmbit de l'enginyeria naval en camps com: vaixells i embarcacions de tot tipus; plataformes i artefactes flotants i fixos (dics flotants, estructures per a l'explotació i aprofitament de recursos marins o estructures marines per a la generació d'energia renovable); vivers marins i sistemes de pesca, i altres indústries marítimes. ",
      "ambit":
          "Optimització i manteniment en instal·lacions marítimes, manteniment industrial, seguretat i contaminació, drassanes, construcció naval, peritatges, administració marítima i disseny del sistema de propulsió.",
      "link": "http://www.fnb.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria en Tecnologies Aeroespacials",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Enginyeries Industrial, Aeroespacial i Audiovisual de Terrassa, C. de Colom, 1-11 08222 - Terrassa",
      "loc": "ESEIAAT, Terrassa",
      "nota": 12.194,
      "notes": [12.194, 12.39, 12.31, 12.23, 12.05],
      "objectius":
          "Aquesta titulació està orientada a proporcionar un ampli coneixement en matèries bàsiques i cientificotecnològiques que capacitin les persones titulades per aprendre nous mètodes i teories. A més, dotarà l'estudiantat d'una gran versatilitat per adaptar-se a noves situacions i assimilar els futurs avenços tecnològics d'aquesta indústria; ja que li proporcionarà un ampli coneixement de la ciència i les tecnologies aeroespacials i el capacitarà per desenvolupar i integrar-se en projectes aeroespacials i de consultoria.",
      "ambit":
          "Les àrees que comprenen el disseny, la fabricació, el manteniment i la posada en marxa d'avions, helicòpters, satèl·lits i altres obres d'enginyeria aeronàutica, així com els àmbits de la construcció, el control i la revisió d'instal·lacions de terra, terminals d'aeroports, pistes d'aterratge i de vol, senyalització i totes les estructures que serveixen de base per a la correcta navegació aèria.",
      "link": "http://www.eseiaat.upc.edu/ca",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria en Tecnologies Industrials",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria Industrial de Barcelona, Av. Diagonal, 647 08028 - Barcelona",
      "loc": "ETSEIB, Barcelona",
      "nota": 9.698,
      "notes": [9.698, 9.77, 9.21, 9.87, 9.62],
      "objectius":
          "Formar professionals amb una base científica i tècnica multidisciplinària que els capaciti per dissenyar, desenvolupar, posar en pràctica, gestionar i millorar productes, sistemes, instal·lacions i processos en tots els àmbits industrials: mecànica, química, elèctrica, electrònica, automàtica, construccions industrials, energia, materials, organització industrial i transport. Proporcionar a l'estudiantat la versatilitat necessària per adaptar-se a noves situacions i assimilar els futurs avenços tecnològics que la indústria necessiti incorporar per millorar els seus productes i processos.",
      "ambit":
          "Oficines tècniques, departaments d'R+D+I, departaments de producció i compres i consultories tecnològiques i de gestió.",
      "link": "http://www.etseib.upc.edu/ca",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria en Tecnologies Industrials",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Enginyeries Industrial, Aeroespacial i Audiovisual de Terrassa, C. de Colom, 1-11 08222 - Terrassa",
      "loc": "ESEIAAT, Terrassa",
      "nota": 5.172,
      "notes": [5.172, 5.0, 5.0, 6.05, 5.0],
      "objectius":
          "Formar professionals amb una base científica i tècnica multidisciplinària que els capaciti per dissenyar, desenvolupar, posar en pràctica, gestionar i millorar productes, sistemes, instal·lacions i processos en tots els àmbits industrials: mecànica, química, elèctrica, electrònica, automàtica, construccions industrials, energia, materials, organització industrial i transport. Proporcionar a l'estudiantat la versatilitat necessària per adaptar-se a noves situacions i assimilar els futurs avenços tecnològics que la indústria necessiti incorporar per millorar els seus productes i processos.",
      "ambit":
          "Oficines tècniques, departaments d'R+D+I, departaments de producció i compres i consultories tecnològiques i de gestió.",
      "link": "http://www.eseiaat.upc.edu/ca",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Enginyeria en Vehicles Aeroespacials",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Enginyeries Industrial, Aeroespacial i Audiovisual de Terrassa, C. de Colom, 1-11 08222 - Terrassa",
      "loc": "ESEIAAT, Terrassa",
      "nota": 11.338,
      "notes": [11.338, 11.82, 11.79, 11.62, 11.44],
      "objectius":
          "Formar professionals amb un ampli coneixement en matèries bàsiques i cientificotecnològiques perquè siguin capaços d'aprendre nous mètodes i teories. Aquest coneixement també els dotarà de versatilitat per adaptar-se a les noves situacions i assimilar els futurs avenços tecnològics d'aquesta indústria. Les persones titulades estaran dotades d'un ampli coneixement en la ciència i les tecnologies aeroespacials i amb capacitat per desenvolupar i integrar-se en projectes aeroespacials i de consultoria.",
      "ambit":
          "Dissenyador/a, constructor/a i tècnic/a de manteniment d'avions, helicòpters, satèl·lits i altres obres d'enginyeria aeronàutica. Constructor/a, controlador/a i revisor/a d'instal·lacions de terra, terminals d'aeroports, pistes d'aterratge i de vol, senyalització, i de totes les estructures que serveixen de base per a la correcta navegació aèria.",
      "link": "http://www.eseiaat.upc.edu/ca",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Estadística",
      "branca": "Ciències socials i jurídiques",
      "modalitat": "Presencial",
      "localitzacio":
          "Facultat de Matemàtiques i Estadística, Campus Diagonal Sud Edifici U, C, C. de Pau Gargallo, 5 08028 - Barcelona",
      "loc": "FME, Barcelona",
      "nota": 9.512,
      "notes": [9.512, 7.79, 8.33, 7.52, 6.68],
      "objectius":
          "Formar professionals de l'estadística, capacitats/ades per dur a terme les tasques específiques del procés d'anàlisi de la informació i la presa de decisions, incidint en: l'obtenció i el tractament de dades, la modelització, identificant i desenvolupant el model adequat en cada cas, l'anàlisi, manipulant computacionalment els models i fent-ne l'anàlisi crítica, la presa de decisions, percebent la natura dels problemes i interpretant les solucions proporcionades pels models corresponents.",
      "ambit":
          "Administracions públiques: activitats en instituts oficials d'estadística, projeccions demogràfiques, tendències socials, mercat de treball, assignació òptima de recursos, etc., salut i ciències naturals: serveis de sanitat, medicina, salut pública, indústria farmacèutica, assaigs clínics, sanitat animal, medi ambient, ciències de la vida, bioinformàtica, agricultura, etc., economia i finances: ciències actuarials, assegurances, banca, avaluació de riscos i concessió de crèdits, borsa, gestió de carteres de valors, anàlisi financera, investigació de mercats, anàlisi de la competència, polítiques de preus, etc., indústria i serveis: disseny d'experiments, control de qualitat, millora de processos i productes, logística, gestió d'inventaris, planificació de la producció, gestió òptima de recursos, etc., docència i investigació.",
      "link": "http://www.fme.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Matemàtiques",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Facultat de Matemàtiques i Estadística, Campus Diagonal Sud Edifici U, C, C. de Pau Gargallo, 5 08028 - Barcelona",
      "loc": "FME, Barcelona",
      "nota": 12.854,
      "notes": [12.854, 12.68, 12.54, 11.8, 11.89],
      "objectius":
          "Oferir una formació general en matemàtiques com a disciplina científica, orientada a la preparació per a l'exercici d'activitats de caràcter professional que impliquin la capacitat d'aplicar les habilitats adquirides en diferents àmbits, que inclouen tant la docència i la investigació de les matemàtiques, com les seves aplicacions a la indústria, l'empresa i l'Administració.",
      "ambit":
          "Docència universitària i recerca, empreses d'informàtica i telecomunicacions, empreses financeres i d'assegurances, docència no universitària, consultoria, indústria i administració pública.",
      "link": "http://www.fme.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Multimèdia",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre de la Imatge i la Tecnologia Multimèdia (CITM), C. de la Igualtat, 33 08222 - Terrassa",
      "loc": "CITM, Terrassa",
      "nota": 5.0,
      "notes": [5.0, 6.68, 7.84, 7.33, 6.12],
      "objectius":
          "Preparar professionals que siguin capaços de crear, realitzar i implementar productes multimèdia d'acord amb les tecnologies que tinguin al seu abast.",
      "ambit":
          "Àmbit artístic, àmbit de l'entreteniment, àmbits comercial i educatiu i empreses de tots els sectors productius i de serveis: cinema, televisió, publicitat, premsa, etc.",
      "link": "http://universitats.gencat.cat/ca/detalls/oferta/904-Multimedia",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Màrqueting i Comunicació Digital",
      "branca": "Ciències socials i jurídiques",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre Universitari EAE, C. de Tarragona, 110 planta soterranea 08015 - Barcelona",
      "loc": "EAE, Barcelona",
      "nota": 6.419,
      "notes": [6.419, 5.97, 5.37, null, null],
      "objectius":
          "Formar professionals innovadors en màrqueting i comunicació digital, com també, experts en el món en línia i les seves tendències.",
      "ambit":
          "Màrqueting, publicitat, relacions públiques, comunicació corporativa, comercial i vendes, fidelització de clients, desenvolupament de producte i investigació de mercats.",
      "link":
          "http://universitats.gencat.cat/ca/detalls/oferta/4206-Marqueting-i-Comunicacio-Digital-EAE",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Màrqueting i Comunicació Digital",
      "branca": "Ciències socials i jurídiques",
      "modalitat": "Presencial",
      "localitzacio":
          "Centre Universitari Euncet, Ctra. BV 1221 de Terrassa a Talamanca, km 3 08225 - Terrassa",
      "loc": "EUNCET, Terrassa",
      "nota": 5.755,
      "notes": [5.755, 5.0, 5.73, 5.0, 5.0],
      "objectius":
          "Formar professionals innovadors en màrqueting i comunicació digital, com també, experts en el món en línia i les seves tendències.",
      "ambit":
          "Màrqueting, publicitat, relacions públiques, comunicació corporativa, comercial i vendes, fidelització de clients, desenvolupament de producte i investigació de mercats.",
      "link": "http://www.euncet.es/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Màrqueting i Comunicació Digital (Semipresencial)",
      "branca": "Ciències socials i jurídiques",
      "modalitat": "Semipresencial",
      "localitzacio":
          "Centre Universitari Euncet, Ctra. BV 1221 de Terrassa a Talamanca, km 3 08225 - Terrassa",
      "loc": "EUNCET, Terrassa",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Formar professionals innovadors en màrqueting i comunicació digital, com també, experts en el món en línia i les seves tendències.",
      "ambit":
          "Màrqueting, publicitat, relacions públiques, comunicació corporativa, comercial i vendes, fidelització de clients, desenvolupament de producte i investigació de mercats.",
      "link": "http://www.euncet.es/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Nàutica i Transport Marítim",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Facultat de Nàutica de Barcelona, C. Pla de Palau, 18 08003 - Barcelona",
      "loc": "FNB, Barcelona",
      "nota": 6.174,
      "notes": [6.174, 6.47, 5.63, 6.36, 6.84],
      "objectius":
          "L'objectiu de la titulació proposada és formar l'estudiantat perquè pugui exercir la professió de pilot de segona de la marina mercant.",
      "ambit":
          "Marina mercant, inspecció marítima, administració marítima, empreses navilieres, empreses de negoci marítim, logística, nàutica d'esbarjo, servei de vigilància duanera i formació.",
      "link": "http://www.fnb.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Paisatgisme",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Superior d'Agricultura de Barcelona, Campus Baix Llobregat Edifici D4, C. Esteve Terradas, 8 08860 - Castelldefels / Escola Tècnica Superior d'Enginyeria de Camins, Canals i Ports de Barcelona, Campus Nord Edifici C2, C. de Jordi Girona, 1-3 08034 - Barcelona / Escola Tècnica Superior d'Arquitectura de Barcelonam, Campus Sud Edifici A, Av. Diagonal, 649 08028 - Barcelona",
      "loc": "ESAB, Castelldefels",
      "nota": 5.0,
      "notes": [5.0, null, null, null, null],
      "objectius":
          "Adquirir els coneixements científics i tecnològics necessaris per planificar i dissenyar paisatges i espais lliures per a projectes i per planificar-ne i controlar-ne la construcció, el manteniment i la rehabilitació.",
      "ambit":
          "Tècnic/a de: projectes i estudis d'espai públic urbà, integració d'infraestructures i equipaments en el paisatge, restauració i rehabilitació d'ecosistemes i patrimoni natural i planificació i gestió del paisatge.",
      "link": "http://www.esab.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Tecnologies Industrials i Anàlisi Econòmica (Anglès)",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria Industrial de Barcelona, Av. Diagonal, 647 08028 - Barcelona",
      "loc": "ETSEIB, Barcelona",
      "nota": 12.024,
      "notes": [12.024, 12.1, null, null, null],
      "objectius":
          "Proporcionar un ampli coneixement de matèries bàsiques i cientificotecnològiques, que capaciti els alumnes per a l'aprenentatge de nous mètodes i teories, a més de dotar-los d'una gran versatilitat per adaptar-se a noves situacions i assimilar els futurs progressos tecnològics que la indústria necessiti incorporar per a la millora de productes i processos. Proporcionar la formació adient per comprendre i interpretar els canvis que es produeixen en les organitzacions industrials i empresarials amb els nous escenaris econòmics, així com per anticipar-se al canvis futurs.",
      "ambit":
          "Empreses industrials, de serveis o de consultoria, administracions públiques i centres de recerca.",
      "link": "http://www.etseib.upc.edu/ca",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Tecnologies Marines",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Facultat de Nàutica de Barcelona, C. pla de Palau, 18 08003 - Barcelona",
      "loc": "FNB, Barcelona",
      "nota": 5.0,
      "notes": [5.0, 5.0, 5.0, 5.0, 5.0],
      "objectius":
          "Formar l'estudiantat perquè pugui exercir la professió de segon oficial de màquines de la marina mercant.",
      "ambit":
          "Marina mercant, centrals tèrmiques i nuclears, manteniment industrial, fred industrial i climatització, inspecció marítima, administració marítima, formació, empreses navilieres, servei de vigilància duanera i drassanes.",
      "link": "http://www.fnb.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Tecnologies de Camins, Canals i Ports",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Escola Tècnica Superior d'Enginyeria de Camins, Canals i Ports de Barcelona, Campus Nord Edifici C2, C. de Jordi Girona, 1-3 08034 - Barcelona",
      "loc": "Camins, Barcelona",
      "nota": null,
      "notes": [null, null, null, null, null],
      "objectius":
          "Formar professionals amb una visió transversal i versàtil, que tinguin una sòlida formació en ciències bàsiques (matemàtiques i física, principalment), i que disposin d'una gran capacitat analítica i instrumental, molt ben preparats per comprendre i resoldre problemes i per dominar instruments de coneixement i gestió dels sistemes complexos, en particular vinculats amb el territori i el medi ambient.",
      "ambit":
          "Empreses constructores, concessionàries, enginyeries i consultories de projectes i recerca.",
      "link": "http://www.camins.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    },
    {
      "nom": "Òptica i Optometria",
      "branca": "Enginyeria i arquitectura",
      "modalitat": "Presencial",
      "localitzacio":
          "Facultat d'Òptica i Optometria de Terrassa, C. del Violinista Vellsolà, 37 08222 - Terrassa",
      "loc": "FOOT, Terrassa",
      "nota": null,
      "notes": [null, null, null, null, null],
      "objectius":
          "Adquirir els coneixements necessaris per a la diagnosi, la prevenció i el tractament dels problemes de salut visual de la població i cursar matèries vinculades als àmbits sanitari i tècnic. Formar en òptica per comprendre la formació d¿imatges mitjançant les lents, els fonaments bàsics dels instruments òptics i les causes dels defectes visuals. D'altra banda, la formació en optometria permetrà aprofundir en l¿estudi i el tractament dels problemes visuals no mèdics.",
      "ambit":
          "Director/a tècnic d'establiments d'òptica, òptic/a optometrista en establiments d'òptica, centres sanitaris públics o privats, hospitals, director/a tècnic, o tècnic/a comercial i de gestió en empreses de la indústria òptica i personal docent i investigador en centres universitaris.",
      "link": "http://foot.upc.edu/",
      "foto":
          "https://www.upc.edu/ca/media/la-upc/galeriaimatges-1/biblioteca-campus-baix-llobregat.jpg/@@images/image.jpeg"
    }
  ];
  return result;
}

class Graus {
  String nom,
      branca,
      modalitat,
      localitzacio,
      loc,
      objectius,
      ambit,
      link,
      foto;
  double nota;
  List<double> notes;

  Graus(
      this.nom,
      this.branca,
      this.modalitat,
      this.localitzacio,
      this.loc,
      this.objectius,
      this.ambit,
      this.link,
      this.foto,
      this.nota,
      List<dynamic> notes) {
    this.notes = notes.cast<double>();
  }

  toDocument() {
    return {
      'nom': this.nom,
      'branca': this.branca,
      'modalitat': this.modalitat,
      'localitzacio': this.localitzacio,
      'loc': this.loc,
      'objectius': this.objectius,
      'ambit': this.ambit,
      'link': this.link,
      'foto': this.foto,
      'nota': this.nota,
      'notes': this.notes.cast<dynamic>(),
    };
  }

  toJson() => toDocument();

  toPrint() {
    print('Nom: ${this.nom}');
    print('Branca: ${this.branca}');
    print('Modalitat: ${this.modalitat}');
    print('Localitzacio: ${this.localitzacio}');
    print('Loc: ${this.loc}');
    print('Objectius: ${this.objectius}');
    print('Ambit: ${this.ambit}');
    print('Link: ${this.link}');
    print('Foto: ${this.foto}');
    print('Nota: ${this.nota}');
    print(
        'Notes: [${this.notes[0]},${this.notes[1]},${this.notes[2]},${this.notes[3]},${this.notes[4]}]');
  }

  factory Graus.fromJson(Map<String, dynamic> json) {
    //double nota = double.parse(json['nota']);
    return new Graus(
      json['nom'] as String,
      json['branca'] as String,
      json['modalitat'] as String,
      json['localitzacio'] as String,
      json['loc'] as String,
      json['objectius'] as String,
      json['ambit'] as String,
      json['link'] as String,
      json['foto'] as String,
      json['nota'] as double,
      json['notes'] as List<dynamic>,
    );
  }
  static Graus fromSnapshot(DocumentSnapshot snap) {
    return new Graus(
        snap['nom'] as String,
        snap['branca'] as String,
        snap['modalitat'] as String,
        snap['localitzacio'] as String,
        snap['loc'] as String,
        snap['objectius'] as String,
        snap['ambit'] as String,
        snap['link'] as String,
        snap['foto'] as String,
        snap['nota'] as double,
        snap['notes'] as List<dynamic>);
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

void main() => runApp(new Data());

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
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
