#!/usr/bin/python3
"""
Quickly get the absolute path of a given file
"""
import os
from pathlib import Path


def get_absolute(file: str, check_exists: bool, get_parent: bool) -> int:
    proper_path = Path(file).resolve().absolute()
    if get_parent:
        proper_path = proper_path.parent
    if check_exists and not proper_path.exists():
        print(f"Error: File does not exists\n\t🤷  {proper_path}")
        return 1
    print(proper_path)
    return 0


if __name__ == "__main__":
    import sys
    from argparse import ArgumentParser

    parser = ArgumentParser()
    parser.add_argument("file", help="File to get the absolute path")
    parser.add_argument(
        "-e", "--exists", help="Ensures the file exists", action="store_true"
    )
    parser.add_argument(
        "-p", "--parent", help="Get the parent directory instead", action="store_true"
    )
    args = parser.parse_args()
    sys.exit(get_absolute(args.file, args.exists, args.parent))
