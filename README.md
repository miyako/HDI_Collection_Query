![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_Collection_Query

Filtering a 4D **Collection** with `.query()` -- positional `:1`/`:2` placeholders, raw query strings, formula-built expressions, wildcard (`@`) matching, and the `=` vs `===` string operators. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v16 R6**; converted from the binary `.4DB` to the `.4DProject` architecture so it runs on current 4D releases.

## What it demonstrates

- Loading `Employees.csv` into an in-memory `Collection` with `Split string` and `.map()`, converting each raw CSV row into a structured employee object (`EmployeeObj`).
- Filtering that collection with `.query()` using several different call shapes side by side: a query string with `:1`/`:2` placeholders and trailing parameters, a fully composed literal string, and a formula method that returns the query text at runtime.
- The `@` wildcard operator for "begins with"/"contains" string matching, combined with `or`/`and` to join multiple conditions.
- The difference between the default `=` (case- and diacritic-insensitive) and `===` (strict) string comparison operators, queried against the same email address.
- Building a query's comparison operator from a live popup menu (`>`, `>=`, `<`, `<=`, `=`, `#`) and composing the resulting query string dynamically (`CreateQueryOnNumeric`).
- Projecting a filtered collection into parallel 4D arrays for a listbox with a single `COLLECTION TO ARRAY` call.
- Echoing the exact query expression back to the user in a styled-text preview, HTML-escaping `<` so it renders correctly.

## Key commands

| Command | Used for |
|---|---|
| `.query()` (Collection method) | Filtering a Collection in place, with placeholder parameters, a literal string, or a formula/method result |
| `.map()` | Converting every raw CSV row in the collection into a structured employee object |
| `Split string` | Splitting the CSV text into rows, and each row into columns |
| `COLLECTION TO ARRAY` | Projecting a Collection's properties into parallel 4D arrays for a listbox |
| `New object` / `New collection` | Building each employee record and demonstrating an object-based query parameters container |
| `Document to text` | Reading `Employees.csv` from the project's resources folder |
| `QUERY` / `ORDER BY` / `SELECTION TO ARRAY` | Classic-language reading of the project's own `INFO` table to drive tab titles and description text |
| `ST SET ATTRIBUTES` | Styling the on-screen query-string preview on Windows |

## How it works

`00_Start` opens the `HDI` splash window; `BtnDemo` closes it and opens `HDI2`, the demo form. On `On Load`, `HDI2/method.4dm` calls `Init` (reads `Employees.csv`, splits it into rows, and maps each row through `EmployeeObj` into the `AllEmployees` collection) and `InitLabels` (queries the project's own `INFO` table for the tab titles, description text, and query-code templates). On `On Page Change`, `InitTab` resets each tab's demo variables and pre-computes the dynamic query previews shown via `DisplayDynamicQuery`.

Each tab's "Query" button runs a different `.query()` expression against `AllEmployees` and hands the (sub)collection result to `EmployeeToArrays`, which spreads it into the shared `FirstNames`/`LastNames`/`salaries`/`Employers`/`Emails`/`Messages` arrays feeding that page's listbox:

- **Salary greater than / last name begins with / salary between** -- `Button2`/`Button3`/`Button5` -- numeric comparison with a placeholder parameter, wildcard `or`, and a two-parameter `and` range.
- **Free-form query selection** -- `Button14` plus three radio buttons -- runs whichever of `vQuery1`/`vQuery2`/`vQuery3` is selected as a raw query string; `Button19` (Reset) restores their default text.
- **Numeric comparator popup** -- `Button4` -- builds `"salary "+operator+" "+value` from the selected popup item via `CreateQueryOnNumeric`, then queries with the resulting formula text.
- **Wildcard vs. strict string match** -- `Button8`/`Button9` -- the same email address queried once with `=` and once with `===`.

"View all" buttons (`Button1`/`Button6`/`Button7`/`Button11`) re-run `EmployeeToArrays(AllEmployees)` unfiltered.

## Points of interest

- `.query()` is exercised with three distinct call shapes on purpose: `"salary>:1"` plus a trailing parameter, a plain literal string typed by the user, and a method call (`CreateQueryOnNumeric`) whose return value is used directly as the query text.
- The `@` wildcard is 4D's "starts with"/"contains" operator, not a regular expression; comparing it against `=` and `===` on the same value (`Button8`/`Button9`) makes the case/diacritic-insensitive-vs-strict distinction concrete.
- The popup-menu comparator (`>`, `>=`, `<`, `<=`, `=`, `#`) is bound to the `ComparatorOperator` array via 4D's scalar-plus-array-of-the-same-name popup idiom -- the scalar holds the selected index into the array.
- All five query pages share one set of arrays and one listbox layout per page; only the expression passed to `.query()` changes between them.
- The demo's own explanatory copy per tab is pulled from records in the project's own `INFO` table (via classic-language `QUERY`/`ORDER BY`/`SELECTION TO ARRAY`), separate from the UI's button/label strings, which are now XLIFF-localised.

## Modernisation notes

Converted from the original binary `.4DB` to a 4D project.

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-create-worktree`](../../tree/miyako-create-worktree) | Full modernisation on top of `main`: method visibility, XLIFF localisation (EN/JA), `var`/`#DECLARE` syntax, standard menu actions, a rebuilt startup dialog (window reuse, `CALL WORKER`, `BtnDemo` object method), `truncateMode`/`resizingMode` listbox defaults, and dark mode/Liquid Glass CSS. | [method.visibility.instructions.md](.github/instructions/method.visibility.instructions.md), [localisation.instructions.md](.github/instructions/localisation.instructions.md), [variable.declarations.instructions.md](.github/instructions/variable.declarations.instructions.md), [menu.instructions.md](.github/instructions/menu.instructions.md), [startup.instructions.md](.github/instructions/startup.instructions.md), [listbox.instructions.md](.github/instructions/listbox.instructions.md), [css.instructions.md](.github/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/instructions/tahoe.css.instructions.md) |

## References

- [4D blog: Retrieve items from a collection](https://blog.4d.com/retrieve-items-from-a-collection/)
- [4D documentation: Collection.query()](https://developer.4d.com/docs/API/CollectionClass#query)
- [4D documentation: Collection.map()](https://developer.4d.com/docs/API/CollectionClass#map)
- [4D documentation: COLLECTION TO ARRAY](https://developer.4d.com/docs/commands/collection-to-array)
- Original download: [HDI_Collection_Query.zip](https://download.4d.com/Demos/4D_v16_R6/HDI_Collection_Query.zip)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)
