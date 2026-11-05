#!/usr/bin/env python3
"""Create a simple Markdown report from manually supplied assessment notes.

This script deliberately does not parse database output automatically. Populate
the JSON input with reviewed, sanitized findings only.
"""
import argparse
import json
from pathlib import Path
from datetime import date

TEMPLATE = """# Oracle Database Migration Assessment

> Draft assessment. Validate findings and provider support before approving a migration.

- Assessment date: {assessment_date}
- Source platform: {source_platform}
- Target platform: {target_platform}
- Source Oracle version: {source_version}
- Target Oracle version/service: {target_version}

## Executive summary

{summary}

## Inventory and sizing

{inventory}

## Compatibility and prerequisites

{compatibility}

## Risks and mitigations

{risks}

## Recommended migration approach

{approach}

## Validation and cutover

{validation}

## Open items

{open_items}

## Data handling

This report should contain no credentials, customer identifiers, hostnames, IPs,
DBIDs, service names, private paths, or unapproved production extracts.
"""

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input_json", help="Reviewed sanitized JSON input")
    parser.add_argument("-o", "--output", default="migration-assessment.md")
    args = parser.parse_args()

    data = json.loads(Path(args.input_json).read_text(encoding="utf-8"))
    data.setdefault("assessment_date", date.today().isoformat())
    fields = [
        "assessment_date", "source_platform", "target_platform",
        "source_version", "target_version", "summary", "inventory",
        "compatibility", "risks", "approach", "validation", "open_items"
    ]
    for field in fields:
        data.setdefault(field, "Not assessed")
    Path(args.output).write_text(TEMPLATE.format(**data), encoding="utf-8")
    print(f"Report written to {args.output}")

if __name__ == "__main__":
    main()
