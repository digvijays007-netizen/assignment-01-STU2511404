## Storage Systems

The architecture uses multiple specialized storage systems aligned with each requirement. For readmission prediction, a Data Lakehouse is used to store historical treatment records, admissions, and discharge data. This enables large-scale analytical queries and feature engineering for machine learning models.

For doctor-facing natural language queries, a Vector Database is used. Doctor notes and patient histories are embedded and stored for semantic retrieval. This allows accurate responses to queries like “Has this patient had a cardiac event before?” while linking back to the source EHR data for reliability.

For monthly reporting, the Data Lakehouse also serves as the analytical warehouse. It supports structured, aggregated queries on occupancy, billing, and departmental metrics, making it ideal for BI dashboards and scheduled reports.

For real-time ICU vitals, a Time-Series Database is used. It efficiently handles high-frequency streaming data and supports real-time monitoring and alerting. Recent data stays in hot storage, while older data is moved to the lakehouse.

## OLTP vs OLAP Boundary

The OLTP system consists of the hospital’s EHR and operational databases that handle real-time patient updates, admissions, and transactions. These systems are optimized for fast writes and consistency.

The OLAP boundary begins when data is ingested into the Data Lakehouse. Here, data is transformed and optimized for analytics, reporting, and machine learning. The separation ensures operational systems are not impacted by heavy analytical workloads while still enabling insights and predictions.

## Trade-offs

A key trade-off in this architecture is increased system complexity due to multiple storage technologies (relational DB, time-series DB, lakehouse, and vector DB). While this improves performance and scalability for each use case, it introduces challenges in integration, maintenance, and governance.

This can be mitigated by implementing centralized data governance, consistent data pipelines, and a unified metadata layer. Using managed services and automation tools can further reduce operational overhead while maintaining flexibility and scalability.
