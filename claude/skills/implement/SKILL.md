---
name: implement
description: Structured workflow to implement a feature or fix. Understands the scope, proposes a plan, waits for approval, implements, tests, and self-reviews until clean.
user-invocable: true
argument-hint: <issue URL, number, or description>
---

Follow this workflow strictly. Do not skip steps or combine them.

## 1. Understand

If a GitHub issue URL or number is provided, fetch it with `gh issue view`. Otherwise, use the description as-is. Read related code and existing tests to understand the scope and testing patterns. Summarize: what needs to change and why.

## 2. Plan

Propose a step-by-step implementation plan with verification for each step. Wait for user approval before proceeding.

## 3. Implement

Execute the approved plan one step at a time. Write tests alongside the implementation. Run relevant tests after each step to catch regressions early.

## 4. Verify

Run the full test suite relevant to the changes. All tests must pass. If any fail, fix and re-run.

## 5. Simplify

Use the `simplify` skill on changed code. Re-run tests to ensure nothing broke.

## 6. Review

Use the `review` agent to self-review the changes. Address all findings, then re-review. Repeat until the review comes back clean.

## 7. Report

Summarize what was done and propose a commit message. Do not stage or commit.
