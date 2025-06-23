# 🚀 AI Coach Sportivo - Il Tuo Allenatore Virtuale Intelligente

Benvenuto nel repository dell'app "AI Coach Sportivo", il tuo compagno di allenamento personalizzato basato sull'intelligenza artificiale! Questa piattaforma mobile multi-piattaforma (iOS/Android), sviluppata in **Flutter** con un backend robusto basato su **Supabase**, è progettata per corridori amatoriali e semi-professionisti. Il suo obiettivo è fornire un coaching intelligente e adattivo, integrando i dati di salute dell'utente per offrire feedback e piani di allenamento ottimizzati, garantendo al contempo la persistenza, sincronizzazione e sicurezza di tutti i dati.

---

## 🎯 Obiettivo Generale del Progetto

Costruire una piattaforma mobile multi-piattaforma (iOS/Android) in Flutter con un backend robusto (Supabase), che funga da AI Coach Sportivo personalizzato per corridori amatoriali e semi-professionisti. L'obiettivo è garantire la persistenza, sincronizzazione e sicurezza di tutti i dati utente attraverso un'esperienza utente fluida e intuitiva. L'app offrirà un coaching intelligente e adattivo, integrando i dati di salute dell'utente per fornire feedback e piani di allenamento ottimizzati.

---

## ✨ Funzionalità Principali (User Stories)

L'app "AI Coach Sportivo" offre le seguenti funzionalità chiave, suddivise per aree tematiche:

### 1. Autenticazione & Profilo Utente

* **Registrazione e Login Sicuro**: Gli utenti possono registrarsi e accedere utilizzando email/password o tramite social login (Google, Apple).
* **Gestione Profilo**: Gli utenti autenticati possono gestire i propri dati personali (nome, altezza, peso, età, genere, livello sportivo, preferenze sportive, sistema di unità di misura, tema, lingua) per personalizzare l'esperienza e il coaching.

### 2. Integrazione Dati Salute

* **Accesso ai Dati HealthKit/Google Fit**: L'app richiede e utilizza i permessi per accedere ai dati di salute da HealthKit (iOS) o Google Fit (Android).
* **Importazione Automatica Sessioni**: Importazione automatica delle sessioni di corsa passate per mantenere una cronologia completa.
* **Sincronizzazione Dati nel Backend**: Tutte le sessioni importate vengono salvate e sincronizzate in modo sicuro con il backend.

### 3. Persistenza Workout & Feedback

* **Cronologia Allenamenti**: Gli utenti possono visualizzare un elenco di tutte le sessioni di allenamento (importate o tracciate).
* **Feedback Post-Allenamento**: Gli utenti possono aggiungere feedback dettagliato dopo ogni sessione (sensazioni, sforzo, note, aree di dolore) per informare l'AI.
* **Salvamento Sicuro dei Dati**: Dettagli dell'allenamento e feedback sono salvati in modo sicuro nel backend e persistono tra i dispositivi.

### 4. AI Coaching & Adattamento Piano

* **Generazione Piano Personalizzato**: L'AI genera piani di allenamento personalizzati basati sul profilo utente, obiettivi e performance storiche.
* **Suggerimenti Personalizzati**: L'AI analizza le sessioni completate e il feedback per fornire suggerimenti mirati per il miglioramento.
* **Adattamento Dinamico del Piano**: Il piano di allenamento si adatta dinamicamente in base alle performance, feedback e progressi dell'utente.
* **Visualizzazione Piano Settimanale**: Gli utenti possono visualizzare il loro piano di allenamento settimanale corrente.

### 5. Mobile UI/UX & Dashboard

* **Processo di Onboarding**: Un onboarding guidato per i nuovi utenti.
* **Dashboard Intuitiva**: Una dashboard chiara che mostra gli ultimi allenamenti, il piano di allenamento corrente e le metriche chiave.
* **Riepilogo Dettagliato Post-Allenamento**: Riepiloghi dettagliati dopo ogni allenamento, inclusi mappe, statistiche (distanza, ritmo, frequenza cardiaca) e grafici.
* **Feedback Facilitato**: Facile inserimento del feedback post-corsa tramite modale o schermata dedicata.
* **Vista Calendario**: Visualizzazione degli allenamenti passati e pianificati in una vista calendario.
* **Temi Dinamici**: Supporto per temi chiaro/scuro/sistema e opzione di modifica manuale.
* **Localizzazione**: L'app si adatta alla lingua preferita dell'utente (Italiano/Inglese).

### 6. Architettura & Infrastruttura

* **Struttura del Progetto Modulare**: Progetto Flutter con architettura modulare (feature-first, repository pattern) per riusabilità e manutenibilità.
* **Backend Robusto (Supabase)**: Utilizzo di Supabase per Auth, PostgreSQL e Edge Functions per gestione dati, autenticazione e logica AI.
* **Pipeline CI/CD**: Pipeline di integrazione continua/delivery continua configurate per build, test e deployment automatici.

### 7. Estendibilità Multi-Sport

* **Supporto Corsa Iniziale**: L'app supporta inizialmente gli allenamenti di "corsa" con analisi post-corsa.
* **Architettura Estendibile**: Progettazione per consentire l'aggiunta facile di nuovi sport (es. ciclismo, nuoto, palestra) in future release.

### 8. Notifiche & Sincronizzazione

* **Notifiche Push**: Gli utenti ricevono notifiche push per promemoria degli allenamenti e aggiornamenti importanti.
* **Sincronizzazione in Background**: Sincronizzazione dei dati con il backend in background per garantire dati sempre aggiornati, anche offline.

---

## 🗺️ Roadmap di Sviluppo

La roadmap è divisa in fasi, con l'obiettivo di rilasciare un MVP funzionale e poi costruire su di esso in modo iterativo e scalabile.

### Fase 1: MVP (Minimum Viable Product) - Il Core del Coach per la Corsa
*(Durata Stimata: 8-12 settimane)*

**Focus**: Autenticazione, gestione profilo essenziale, importazione base HealthKit/Google Fit per la corsa, visualizzazione workout, feedback post-run, generazione iniziale piano AI (semplice) e UI di base.

**Epiche Coperte**:
* **Architettura & Infrastruttura**: Setup Supabase (Auth, DB), progetto Flutter modulare (Riverpod, MVVM), base CI/CD.
* **Autenticazione & Profilo Utente**: Login/SignUp (email/password), schermata profilo essenziale (nome, peso, altezza, livello).
* **Integrazione Dati HealthKit/Google Fit**: Permessi, lettura dati base (distanza, durata, ritmo) per la corsa, salvataggio nel backend.
* **Persistenza Workout & Feedback**: Modelli e API per `workout_sessions` e `workout_feedback`. Modale feedback post-run.
* **AI Coaching & Adattamento Piano (Versione 1)**: Edge Function base per suggerimenti testuali semplici. Struttura `training_plans` semplice. Visualizzazione piano settimanale (solo testo).
* **Mobile UI/UX & Dashboard (Core)**: Onboarding, Homepage con riepilogo ultima corsa e accesso piano. Post-run summary con statistiche e mappe (solo traccia GPS, no grafici avanzati). Tema dinamico e localizzazione (UI essenziale).
* **Notifiche & Sincronizzazione (Base)**: Sync manuale o semi-automatica dopo l'apertura/chiusura app.

### Fase 2: Intelligenza e Raffinamento UI/UX
*(Durata Stimata: 6-8 settimane dopo MVP)*

**Focus**: Miglioramento dell'AI, dashboard avanzate, analisi dati più ricca, gestione notifiche.

**Epiche Coperte**:
* **Autenticazione & Profilo Utente**: Integrazione social login (Google, Apple). Gestione completa dati profilo (età, genere, preferenze, obiettivi).
* **Integrazione Dati HealthKit/Google Fit**: Lettura di dati più avanzati (battito cardiaco, calorie).
* **Persistenza Workout & Feedback**: Miglioramento dei campi di feedback (es. aree di dolore).
* **AI Coaching & Adattamento Piano (Versione 2)**: Logica AI più sofisticata per adattamento del piano e suggerimenti specifici. Analisi performance basata su HR. Generazione di piani a lungo termine.
* **Mobile UI/UX & Dashboard (Avanzata)**: Grafici dettagliati nel post-run summary (passo, HR). Calendario con storico e pianificati. Dashboard personalizzabile.
* **Notifiche & Sincronizzazione (Avanzata)**: Push Notification per reminder allenamenti e feedback AI. Sincronizzazione in background (offline-first, retry).

### Fase 3: Estendibilità e Nuovi Orizzonti
*(Durata Stimata: 4-6 settimane dopo Fase 2)*

**Focus**: Aggiunta di nuovi sport, funzionalità premium (se previste), miglioramenti performance.

**Epiche Coperte**:
* **Estendibilità Multi-Sport**: Implementazione del primo modulo per un nuovo sport (es. "palestra" o "bici"). Adattamento `WorkoutSession` e `TrainingPlan` per supportare la nuova tipologia. Implementazione di interfacce e classi polimorfiche in Flutter.
* **Architettura & Infrastruttura**: Ottimizzazione delle Edge Functions per la scalabilità.
* **Potenziali Nuove Epiche**: (Es. Sfide con amici, Community, Funzionalità Premium)

### Fase 4: Ottimizzazione e Oltre
*(Continua Evoluzione)*

**Focus**: Performance, analytics, A/B testing, integrazioni aggiuntive, nuove funzionalità AI.
Monitoraggio, feedback utenti, introduzione di nuove iterazioni AI, espansione a più sport e dispositivi wearable.

---

## 🗄️ Architettura Database (Supabase PostgreSQL)

Il backend dell'applicazione è gestito tramite **Supabase**, utilizzando un database PostgreSQL robusto, scalabile e sicuro.

### 🎯 Obiettivi Specifici del Database

* **Definizione Chiara dello Schema**: Struttura ben definita per tutte le tabelle, inclusi tipi di dati, vincoli e relazioni.
* **Sicurezza dei Dati (RLS)**: Implementazione di politiche di Row Level Security (RLS) su tutte le tabelle sensibili per garantire che gli utenti accedano e modifichino solo i propri dati.
* **Integrità Referenziale**: Utilizzo di chiavi primarie e chiavi esterne per mantenere l'integrità dei dati.
* **Automazione e Coerenza**: Implementazione di trigger e funzioni SQL per automatizzare processi (es. `updated_at`, creazione profilo utente).
* **Scalabilità e Performance**: Progettazione dello schema con un occhio alla scalabilità futura e aggiunta di indici per ottimizzare le query.

### 📋 Dettaglio Tabelle e Campi

Ecco una descrizione dettagliata delle tabelle e dei loro campi:

#### 1. Tabella: `users`

Contiene i dati del profilo utente specifici per l'app, estendendo le informazioni gestite da Supabase Auth.

| Campo                 | Tipo di Dato                   | Descrizione                                                                 | Vincoli/Note                                       |
| :-------------------- | :----------------------------- | :-------------------------------------------------------------------------- | :------------------------------------------------- |
| `id`                  | `uuid`                         | Identificativo univoco dell'utente.                                         | **Primary Key**, **Foreign Key** (`auth.users.id`) |
| `email`               | `text`                         | L'indirizzo email dell'utente.                                              | `Unique`, `Not Null`                               |
| `name`                | `text`                         | Il nome di battesimo dell'utente.                                           | `Not Null`                                         |
| `surname`             | `text`                         | Il cognome dell'utente.                                                     |                                                    |
| `height_cm`           | `integer`                      | Altezza dell'utente in centimetri.                                          |                                                    |
| `weight_kg`           | `numeric`                      | Peso dell'utente in chilogrammi.                                            |                                                    |
| `date_of_birth`       | `date`                         | Data di nascita dell'utente.                                                |                                                    |
| `gender`              | `text`                         | Genere dell'utente (es. 'male', 'female', 'other').                         |                                                    |
| `sporting_level`      | `text`                         | Livello di esperienza sportiva (es. 'beginner', 'intermediate').            |                                                    |
| `sport_preferences`   | `text[]` (Array di stringhe)   | Elenco dei sport preferiti (es. `['running', 'cycling']`).                 |                                                    |
| `target_goals`        | `jsonb`                        | Obiettivi specifici per sport (es. `{"running": {"target_distance": "10k"}}`). |                                                    |
| `preferred_unit_system` | `text`                       | Sistema di unità di misura (es. 'metric', 'imperial').                      |                                                    |
| `ui_theme`            | `text`                         | Preferenza del tema UI (es. 'system', 'light', 'dark').                     |                                                    |
| `preferred_language`  | `text`                         | Lingua preferita per l'app (es. 'en', 'it').                                |                                                    |
| `created_at`          | `timestamp with time zone`     | Data e ora di creazione del record.                                         | `Default: now()`                                   |
| `updated_at`          | `timestamp with time zone`     | Data e ora dell'ultima modifica del record.                                 | `Default: now()`, aggiornato da trigger            |

#### 2. Tabella: `workout_sessions`

Registra i dati dettagliati di ogni singola sessione di allenamento completata dall'utente.

| Campo                          | Tipo di Dato                   | Descrizione                                                     | Vincoli/Note                                       |
| :----------------------------- | :----------------------------- | :-------------------------------------------------------------- | :------------------------------------------------- |
| `id`                           | `uuid`                         | Identificativo univoco della sessione.                          | **Primary Key**, `Default: gen_random_uuid()`      |
| `user_id`                      | `uuid`                         | L'ID dell'utente che ha eseguito l'allenamento.                 | **Foreign Key** (`users.id`), `Not Null`           |
| `sport_type`                   | `text`                         | Il tipo di sport della sessione (es. 'running').                | `Not Null`                                         |
| `start_time`                   | `timestamp with time zone`     | L'ora di inizio dell'allenamento.                               | `Not Null`                                         |
| `end_time`                     | `timestamp with time zone`     | L'ora di fine dell'allenamento.                                 | `Not Null`                                         |
| `duration_seconds`             | `integer`                      | Durata totale in secondi.                                       | `Not Null`                                         |
| `distance_meters`              | `numeric`                      | Distanza percorsa in metri.                                     | `Not Null`                                         |
| `average_pace_seconds_per_km`  | `numeric`                      | Passo medio (secondi per chilometro/miglio).                    |                                                    |
| `max_pace_seconds_per_km`      | `numeric`                      | Passo massimo raggiunto.                                        |                                                    |
| `average_heart_rate_bpm`       | `integer`                      | Frequenza cardiaca media.                                       |                                                    |
| `max_heart_rate_bpm`           | `integer`                      | Frequenza cardiaca massima.                                     |                                                    |
| `calories_burned`              | `integer`                      | Calorie stimate bruciate.                                       |                                                    |
| `path_coordinates`             | `jsonb`                        | Array di oggetti JSON per le coordinate GPS (lat, lon, ts).     |                                                    |
| `laps_data`                    | `jsonb`                        | Array di oggetti JSON per i dati dei lap.                       |                                                    |
| `source`                       | `text`                         | Fonte dei dati (es. 'healthkit', 'google_fit').                 |                                                    |
| `is_live_tracking`             | `boolean`                      | Indica se la sessione è stata tracciata in tempo reale.         | `Default: false`                                   |
| `created_at`                   | `timestamp with time zone`     | Data e ora di creazione.                                        | `Default: now()`                                   |
| `updated_at`                   | `timestamp with time zone`     | Data e ora dell'ultima modifica.                                | `Default: now()`, aggiornato da trigger            |

#### 3. Tabella: `workout_feedback`

Memorizza il feedback fornito dall'utente dopo aver completato una sessione di allenamento.

| Campo                     | Tipo di Dato                   | Descrizione                                                     | Vincoli/Note                                   |
| :------------------------ | :----------------------------- | :-------------------------------------------------------------- | :--------------------------------------------- |
| `id`                      | `uuid`                         | Identificativo univoco del feedback.                            | **Primary Key**, `Default: gen_random_uuid()`  |
| `session_id`              | `uuid`                         | L'ID della sessione a cui si riferisce il feedback.             | `Unique`, `Not Null`, **Foreign Key** (`workout_sessions.id`) |
| `user_id`                 | `uuid`                         | L'ID dell'utente che ha lasciato il feedback.                   | `Not Null`, **Foreign Key** (`users.id`)       |
| `feeling_rating`          | `integer`                      | Punteggio su come l'utente si è sentito (es. 1-5).              |                                                |
| `effort_rating`           | `integer`                      | Punteggio sul livello di sforzo percepito (es. 1-5).            |                                                |
| `notes`                   | `text`                         | Campo di testo libero per commenti aggiuntivi.                  |                                                |
| `pain_areas`              | `text[]` (Array di stringhe)   | Elenco di aree del corpo dove l'utente ha percepito dolore.     |                                                |
| `is_completed_plan`       | `boolean`                      | Indica se l'allenamento faceva parte di un piano e completato.  |                                                |
| `satisfaction_score`      | `integer`                      | Punteggio di soddisfazione generale per l'allenamento.          |                                                |
| `created_at`              | `timestamp with time zone`     | Data e ora di creazione del record.                             | `Default: now()`                               |

#### 4. Tabella: `training_plans`

Contiene la struttura dei piani di allenamento generati dall'AI e assegnati agli utenti.

| Campo                 | Tipo di Dato                   | Descrizione                                                                 | Vincoli/Note                                       |
| :-------------------- | :----------------------------- | :-------------------------------------------------------------------------- | :------------------------------------------------- |
| `id`                  | `uuid`                         | Identificativo univoco del piano.                                           | **Primary Key**, `Default: gen_random_uuid()`      |
| `user_id`             | `uuid`                         | L'ID dell'utente a cui è assegnato il piano.                                | `Not Null`, **Foreign Key** (`users.id`)           |
| `plan_name`           | `text`                         | Nome descrittivo per il piano (es. 'Preparazione Maratona').                | `Not Null`                                         |
| `sport_type`          | `text`                         | Tipo di sport a cui si riferisce il piano (es. 'running').                  | `Not Null`                                         |
| `start_date`          | `date`                         | Data di inizio del piano.                                                   | `Not Null`                                         |
| `end_date`            | `date`                         | Data di fine prevista del piano.                                            |                                                    |
| `status`              | `text`                         | Stato attuale del piano (es. 'active', 'completed').                        | `Default: 'active'`                                |
| `plan_details`        | `jsonb`                        | Struttura dettagliata del piano (settimane, giorni, allenamenti).           | `Not Null` (Esempio fornito nel testo originale)   |
| `ai_model_version`    | `text`                         | Versione del modello AI utilizzata per generare/adattare il piano.          |                                                    |
| `created_at`          | `timestamp with time zone`     | Data e ora di creazione del record.                                         | `Default: now()`                                   |
| `updated_at`          | `timestamp with time zone`     | Data e ora dell'ultima modifica del record.                                 | `Default: now()`, aggiornato da trigger            |

---

## 🛠️ Tecnologie Utilizzate

* **Frontend**: Flutter (per iOS e Android)
    * **State Management**: Riverpod
    * **Architettura**: MVVVM (Model-View-ViewModel) con Repository Pattern
* **Backend**: Supabase
    * **Database**: PostgreSQL
    * **Autenticazione**: Supabase Auth
    * **Logica AI**: Supabase Edge Functions
* **Integrazione Salute**: HealthKit (iOS) / Google Fit (Android)
* **CI/CD**: (Configurazione da definire)

---
