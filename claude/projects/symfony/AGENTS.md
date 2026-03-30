# Symfony Contribution

## Backward Compatibility Promise

All changes must respect the BC promise (https://symfony.com/doc/current/contributing/code/bc.html).

Never:
- Remove or rename public/protected methods, properties, or constants
- Change method signatures (parameter types, return types)
- Add required parameters to existing methods
- Add optional parameters to existing methods (except on the last minor branch, where adding an optional parameter with a default value at the last position is allowed)
- Make a class final or abstract after its initial release
- Reduce visibility of properties or methods
- Introduce a new class/interface/trait/method as deprecated

When deprecating:
- Use `trigger_deprecation('symfony/component-name', 'X.Y', '...')` at runtime
- Add `@deprecated since Symfony X.Y` PHPDoc with replacement hint (FQCN if different namespace)
- Update three files in the same PR: component `CHANGELOG.md`, `UPGRADE-X.Y.md`, `UPGRADE-X+1.0.md`
- Removal happens in the next major only

`@internal` classes/methods are exempt from BC; use them when the API is not ready for public use.

## Coding standards

- Use PHP CS Fixer with Symfony rules
- Yoda conditions for `==`, `!=`, `===`, `!==`
- Identical comparison (`===`/`!==`) unless type juggling is needed
- No `else`/`elseif`/`break` after `if`/`case` that returns or throws
- PHPDoc only when it adds information beyond name, types, and context
- Exception messages: `sprintf`, double quotes (no backticks), capital letter, trailing dot, `get_debug_type()` for class names
- Constructor promotion parameters each on its own line with trailing comma
- Properties before methods; public first, then protected, then private

## Naming

- Prefix abstract classes with `Abstract`; suffix interfaces with `Interface`, traits with `Trait`, exceptions with `Exception`
- PHP attributes for services: prefix with `As` (e.g. `#[AsCommand]`); for controller args: prefix with `Map` (e.g. `#[MapEntity]`)
- Collection methods: `get()`, `set()`, `has()`, `all()`, `remove()`, `clear()`, `add()`, `count()`; suffix with thing name for non-main relations

## Testing

```bash
./phpunit src/Symfony/Component/<NAME>
./phpunit src/Symfony/Bridge/<NAME>
./phpunit src/Symfony/Bundle/<NAME>
```

## Commit messages

Format: `[Component] Verb phrase` (imperative mood, no trailing period).

When asked, propose a commit message based on the current diff.

## Pull requests

When asked, propose a PR body following Symfony's contribution format:

| Q             | A
|-------------- |---
| Branch?       | x.y
| Bug fix?      | yes/no
| New feature?  | yes/no
| Deprecations? | yes/no
| Issues        | Fix #...
| License       | MIT

Followed by a concise description: state the problem, then the solution. Use inline code formatting for class/method names.
