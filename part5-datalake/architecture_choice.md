## Architecture Recommendation

I would recommend a Data Lakehouse for this startup.

A traditional data warehouse is excellent for structured analytics, but it is a poor fit for raw GPS logs, free-form text reviews, and restaurant menu images. A pure data lake can store all of those formats cheaply, but it often becomes difficult to manage, govern, and query consistently as the business scales. A lakehouse combines the strengths of both.

First, the startup is collecting multi-format data: semi-structured payment events, unstructured text reviews, image files, and high-volume location logs. A lakehouse can store all of these in one platform without forcing early transformation or losing raw fidelity.

Second, the company will need both operational flexibility and fast analytics. Product teams may want to run SQL on payment and order behavior, while data science teams may want to build models from text reviews, delivery routes, and menu images. A lakehouse supports SQL-style analytics while still working well with ML and AI workflows.

Third, a fast-growing startup needs cost-efficient scaling with governance. Data lakes are economical for large raw data volumes, and lakehouse table layers add schema enforcement, ACID-style reliability, and better data quality controls than a plain lake.

Finally, a lakehouse helps avoid maintaining separate systems too early. It gives the startup one architecture that can support BI dashboards, experimentation, and machine learning as data complexity grows.
