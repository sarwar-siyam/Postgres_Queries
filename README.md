# Introduction

Tauche ein in den Daten-Arbeitsmarkt! Mit Fokus auf Datenanalystenrollen erkundet dieses Projekt die 💰 Top-verdienenden Jobs, 🔥 gefragten Fähigkeiten und 📈 wo hohe Nachfrage auf hohe Gehälter im Bereich Datenanalytik trifft.

🔍 SQL queries? Findest du hier: [beginner](/beginner/) und hier [advance](/advance/)

# Backround

Getrieben von dem Wunsch, den Datenanalysten-Arbeitsmarkt effektiver zu durchqueren, entstand dieses Projekt aus dem Verlangen, Top-verdienende und gefragte Fähigkeiten zu identifizieren und die Arbeit anderer zu optimieren, um optimale Jobs zu finden.

Er ist randvoll mit Einblicken in Stellentitel, Gehälter, Standorte und wesentliche Fähigkeiten.

Die Fragen, die ich durch meine SQL-Abfragen beantworten wollte, waren:

1. Welche sind die am besten bezahlten Datenanalysten-Jobs?
2. Welche Fähigkeiten werden für diese Top-verdienenden Jobs benötigt?
3. Welche Fähigkeiten sind am gefragtesten für Datenanalysten?
4. Welche Fähigkeiten sind mit höheren Gehältern verbunden?
5. Welche sind die optimalsten Fähigkeiten zum Lernen?

# Tools I Used
Für meine intensive Untersuchung des Datenanalysten-Arbeitsmarktes habe ich folgende Werkzeuge genutzt:

- SQL: Das Rückgrat meiner Analyse, das es mir ermöglicht, die Datenbank abzufragen und wichtige Erkenntnisse zu gewinnen.
- PostgreSQL: Das ausgewählte Datenbankmanagementsystem, ideal für die Verarbeitung der Stellenangebotsdaten.
- Visual Studio Code: Mein Favorit für das Datenbankmanagement und die Ausführung von SQL-Abfragen.
- Git & GitHub: Unverzichtbar für die Versionskontrolle und das Teilen meiner SQL-Skripte und Analysen, um Zusammenarbeit und Projektverfolgung sicherzustellen.
# The Analysis

Jede Abfrage für dieses Projekt hatte das Ziel, spezifische Aspekte des Datenanalysten-Arbeitsmarktes zu untersuchen. Hier ist, wie ich jede Frage angegangen bin:

## 1. Top-verdienende Datenanalysten-Jobs
Um die am besten bezahlten Rollen zu identifizieren, habe ich Datenanalystenpositionen nach durchschnittlichem Jahresgehalt und Standort gefiltert, wobei ich mich auf Remote-Jobs konzentrierte. Diese Abfrage hebt die hoch bezahlten Möglichkeiten im Bereich hervor.

```sql
SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```


Hier ist die Aufschlüsselung der Top-Datenanalysten-Jobs im Jahr 2023:

- Weites Gehaltsspektrum: Die Top 10 bezahlten Datenanalysten-Jobs reichen von $184.000 bis $650.000, was auf ein erhebliches Gehaltspotenzial in diesem Bereich hinweist.

- Vielfältige Arbeitgeber: Unternehmen wie SmartAsset, Meta und AT&T gehören zu denen, die hohe Gehälter anbieten, was ein breites Interesse über verschiedene Branchen hinweg zeigt.

- Vielfalt an Jobtiteln: Es gibt eine hohe Vielfalt an Jobtiteln, von Datenanalyst bis zum Leiter der Analytik, was die vielfältigen Rollen und Spezialisierungen innerhalb der Datenanalytik widerspiegelt

![Alt top](/assets/Bildschirmfoto%202024-03-27%20um%2013.06.44.png)


### 2 Fähigkeiten für die bestbezahlten Jobs
Um zu verstehen, welche Fähigkeiten für die am besten bezahlten Jobs erforderlich sind, habe ich die Stellenanzeigen mit den Fähigkeitsdaten verbunden, um Einblicke darüber zu erhalten, was Arbeitgeber für hochbezahlte Positionen wertschätzen.

```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

```
Hier ist die Aufschlüsselung der am meisten nachgefragten Fähigkeiten für die 10 bestbezahlten Datenanalysten-Jobs im Jahr 2023:

- SQL führt mit einer deutlichen Anzahl von 8.
- Python folgt dicht dahinter mit einer deutlichen Anzahl von 7.
- Tableau ist ebenfalls sehr gefragt, mit einer deutlichen Anzahl von 6. Andere Fähigkeiten wie R, Snowflake, Pandas und Excel zeigen unterschiedliche Grade der Nachfrage.

![Fähigkeiten für die am besten bezahlten Jobs](/assets/Bildschirmfoto%202024-03-27%20um%2013.28.08.png)


### 3 Gefragte Fähigkeiten für Datenanalysten

Diese Abfrage half dabei, die am häufigsten angeforderten Fähigkeiten in Stellenanzeigen zu identifizieren und lenkte den Fokus auf Bereiche mit hoher Nachfrage.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

Hier ist die Aufschlüsselung der am meisten nachgefragten Fähigkeiten für Datenanalysten im Jahr 2023:

SQL und Excel bleiben grundlegend, was die Notwendigkeit starker Grundlagenkenntnisse in der Datenverarbeitung und Tabellenkalkulation hervorhebt.

Programmier- und Visualisierungswerkzeuge wie Python, Tableau und Power BI sind unverzichtbar und weisen auf die zunehmende Bedeutung technischer Fähigkeiten in der Datenvisualisierung und Entscheidungsunterstützung hin.

![](/assets/Bildschirmfoto%202024-03-27%20um%2013.32.51.png)


#### 4 Die optimalsten Fähigkeiten zum Lernen

Durch die Kombination von Erkenntnissen aus Nachfrage- und Gehaltsdaten hatte diese Abfrage zum Ziel, Fähigkeiten zu identifizieren, die sowohl eine hohe Nachfrage als auch hohe Gehälter aufweisen. Dadurch wird ein strategischer Fokus für die Weiterentwicklung von Fähigkeiten geboten.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

![](/assets/Bildschirmfoto%202024-03-27%20um%2013.36.38.png)



Hier ist eine Aufschlüsselung der optimalsten Fähigkeiten für Datenanalysten im Jahr 2023:

- Programmiersprachen mit hoher Nachfrage: Python und R zeichnen sich durch ihre hohe Nachfrage aus, mit Nachfragezahlen von 236 bzw. 148. Trotz ihrer hohen Nachfrage liegen ihre durchschnittlichen Gehälter bei etwa $101,397 für Python und $100,499 für R, was darauf hindeutet, dass die Beherrschung dieser Sprachen zwar sehr geschätzt wird, aber auch weit verbreitet ist.

- Cloud-Tools und -Technologien: Fähigkeiten in spezialisierten Technologien wie Snowflake, Azure, AWS und BigQuery zeigen eine signifikante Nachfrage mit relativ hohen Durchschnittsgehältern, was auf die wachsende Bedeutung von Cloud-Plattformen und Big-Data-Technologien in der Datenanalyse hinweist.

- Business-Intelligence- und Visualisierungstools: Tableau und Looker mit Nachfragezahlen von 230 bzw. 49 und durchschnittlichen Gehältern von rund $99,288 bzw. $103,795 betonen die entscheidende Rolle der Datenvisualisierung und Business Intelligence bei der Ableitung handlungsorientierter Erkenntnisse aus Daten.

- Datenbanktechnologien: Die Nachfrage nach Fähigkeiten in traditionellen und NoSQL-Datenbanken (Oracle, SQL Server, NoSQL) mit durchschnittlichen Gehältern von $97,786 bis $104,534 reflektiert den anhaltenden Bedarf an Fachwissen für Daten speicherung, abruf und management

# What I Learned

Während dieses Abenteuers habe ich meine SQL-Toolbox mit ernsthafter Schlagkraft aufgeladen:

🧩 Komplexe Abfragen gestalten: Meisterte die Kunst fortgeschrittener SQL-Abfragen, indem ich Tabellen wie ein Profi zusammenführte und WITH-Klauseln für temporeiche Tabellenmanöver einsetzte.

📊 Datenaggregation: Wurde vertraut mit GROUP BY und verwandelte aggregierte Funktionen wie COUNT() und AVG() in meine datenzusammenfassenden Helferlein.

💡 Analytische Zauberkunst: Habe meine Fähigkeiten im Lösen realer Probleme aufgewertet, indem ich Fragen in handlungsorientierte, aufschlussreiche SQL-Abfragen umwandelte.

# Conclusions
Aus der Analyse ergaben sich mehrere allgemeine Erkenntnisse:

Top-bezahlte Datenanalysten-Jobs: Die bestbezahlten Jobs für Datenanalysten, die Remote-Arbeit ermöglichen, bieten eine breite Palette von Gehältern, das höchste bei $650.000!

Fähigkeiten für Top-bezahlte Jobs: Hoch bezahlte Datenanalysten-Jobs erfordern fortgeschrittene Kenntnisse in SQL, was darauf hindeutet, dass es eine entscheidende Fähigkeit ist, um ein Top-Gehalt zu verdienen.

Am meisten nachgefragte Fähigkeiten: SQL ist auch die am meisten nachgefragte Fähigkeit auf dem Datenanalysten-Arbeitsmarkt, was es für Jobsuchende unverzichtbar macht.

Fähigkeiten mit höheren Gehältern: Spezialisierte Fähigkeiten wie SVN und Solidity sind mit den höchsten durchschnittlichen Gehältern verbunden, was auf einen Premium für Fachkenntnisse hinweist.

Optimale Fähigkeiten für den Marktwert: SQL führt in der Nachfrage und bietet ein hohes Durchschnittsgehalt, was es zu einer der optimalsten Fähigkeiten für Datenanalysten macht, um ihren Marktwert zu maximieren.