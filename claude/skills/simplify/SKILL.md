---
name: simplify
description: Simplifies and refines code for clarity, consistency, and maintainability while preserving all functionality. Focuses on recently modified code unless instructed otherwise.
user-invocable: true
---

Review the recently modified code and apply refinements that improve clarity and consistency without altering behavior.

## Refinement rules

1. **Preserve functionality**: never change what the code does, only how it does it.

2. **Enhance clarity**:
   - Reduce unnecessary nesting (early returns, guard clauses)
   - Eliminate dead code and redundant abstractions
   - Improve variable and method naming
   - Remove comments that restate the code
   - Simplify conditionals
   - Prefer match expressions over switch when appropriate

3. **Don't over-simplify**:
   - Keep helpful abstractions that aid readability
   - Don't merge unrelated logic into one method
   - Don't sacrifice debuggability for brevity

4. **Scope**: only refine recently modified code unless told otherwise.

Language-specific conventions (Symfony/PHP, TypeScript/React) are inherited from AGENTS.md.
