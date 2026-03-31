# Liferay Engineering & Refactoring Standards

## SQL Migration to DSLQuery
Identify legacy SQL query strings in `default.xml` files and **entirely substitute** them with **DSLQuery** technology within the corresponding **`*LocalServiceImpl`** classes.

*   **Substitution Rule**: Remove the SQL entry from the `default.xml` and the `_customSQL` reference/dependency in the Java class. The logic must be fully encapsulated in the service method using the DSL.
*   **Placement**: DSL queries must be implemented directly within the service method in `*LocalServiceImpl`, not in `*FinderImpl`.
*   **Execution Pattern**:
    *   Use the `dslQuery()` or `dslQueryCount()` methods available in the service (inherited from the base class).
    *   Example: `List<MyEntity> results = dslQuery(DSLQueryFactoryUtil.select(...).from(...).where(...));`
    *   Example for count: `int count = dslQueryCount(DSLQueryFactoryUtil.count().from(...).where(...));`
*   **Factory Utils**: 
    *   Use `DSLQueryFactoryUtil` for `select()`, `selectDistinct()`, `count()`, `countDistinct()`.
    *   Use `DSLFunctionFactoryUtil` for SQL functions like `lower()`, `upper()`, `sum()`, etc.
*   **Table References**: Use the generated `*Table.INSTANCE` (e.g., `AssetTagTable.INSTANCE`) to access columns.
*   **Fluent Query Building**:
    *   **Joins**: 
        *   `innerJoinON(JoinedTable.INSTANCE, JoinedTable.INSTANCE.col.eq(Table.INSTANCE.col))`
        *   `leftJoinOn(JoinedTable.INSTANCE, JoinedTable.INSTANCE.col.eq(Table.INSTANCE.col))`
    *   **Conditions**: 
        *   Simple: `where(Table.INSTANCE.col.eq(value))`
        *   Complex/Dynamic: `where(() -> { Predicate predicate = ...; return predicate; })`
        *   Logical: `Predicate.and(p1, p2)`, `Predicate.or(p1, p2)`.
    *   **Ordering & Pagination**: `orderBy(Table.INSTANCE.col.ascending())` or `orderBy(Table.INSTANCE.col.descending())`.

## General Java Standards
*   **Signature Integrity**: **NEVER change public or protected method signatures**. Internal refactoring must be transparent to the external API.
*   **Testing Requirement**: No code change is complete without a corresponding **Integration Test**. Use `LiferayIntegrationTestRule` and `AggregateTestRule`.
*   **Code Quality**: 
    *   Adhere to **SOLID principles** and Liferay's internal style guides.
    *   Use **Dependency Injection** (`@Reference`, `@Inject`) and **Mockito** for mocking.
    *   **Comments**: Never include informative comments (e.g., explaining trivial logic or adding redundant documentation), as per Liferay guidelines.
    *   **Author Tags**: Add `@author` tags **ONLY** to new files created from scratch. For modified files, do not add or update the author tags.
    *   Apply proper **Copyright Headers** (SPDX-FileCopyrightText).
    *   Utilize `StringPool` (e.g., `StringPool.BLANK`, `StringPool.COMMA`) and `Validator` (`Validator.isNotNull`).
    *   Logging: `private static final Log _log = LogFactoryUtil.getLog(ClassName.class);`.
*   **Deterministic Output**: Maintain low temperature (0.0) for code generation to ensure syntactic precision and idiomatic consistency.
