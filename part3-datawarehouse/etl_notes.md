## ETL Decisions

### Decision 1 — Date Standardization
Problem:
Dates were inconsistent in format.
Resolution:
Converted all dates to YYYY-MM-DD format.

### Decision 2 — Category Normalization
Problem:
Categories had inconsistent casing (electronics, ELECTRONICS).
Resolution:
Standardized all categories to uppercase.

### Decision 3 — Handling NULL Values
Problem:
Some store/product fields were missing.
Resolution:
Removed NULLs and ensured all records have valid references.
