# /// script
# requires-python = ">=3.11"
# dependencies = []
# ///
import argparse
import logging
import os
import shutil
import tomllib
from pathlib import Path
from typing import Literal, TypedDict

logging.basicConfig()

log = logging.getLogger("Install Dotfiles")
log.setLevel(logging.DEBUG)


DeployType = Literal["copy", "symlink", "symlink-children", "hardlink"]


class Data(TypedDict):
    source: str
    target: str
    type: DeployType


LinkError = None | str


def delete_destination(dst: Path):
    if dst.exists() or dst.is_symlink():
        if dst.is_dir() and not dst.is_symlink():
            shutil.rmtree(dst)
        else:
            dst.unlink()


def link(src: Path, dst: Path) -> LinkError:
    delete_destination(dst)
    os.symlink(src, dst, src.is_dir())
    return None


def run(dry_run: bool = False):
    profile_path = Path(__file__).parent / "profiles"

    profile = profile_path / "linux.toml"

    profile_data: dict[str, Data] = tomllib.loads(profile.read_text())

    for dotfile, data in profile_data.items():
        source = Path(__file__).parent / "dotfiles" / data["source"]
        destination = Path(data["target"]).expanduser()
        deploy_type = data.get("type", "copy")

        destination.parent.mkdir(parents=True, exist_ok=True)

        try:
            match deploy_type:
                case "copy":
                    log.info(f"Soft Linking {source} -> {destination}")
                    if not dry_run:
                        raise NotImplementedError("Copying files is not implemented")
                case "symlink":
                    log.info(f"Soft Linking {source} -> {destination}")
                    if not dry_run:
                        link(source, destination)
                case "symlink-children":
                    log.info(f"Soft Linking Children {source} -> {destination}")
                    for child_src in source.iterdir():
                        child_dst = destination / child_src.name
                        log.info(f"\tSoft Linking {child_src} -> {child_dst}")
                        if not dry_run:
                            link(child_src, child_dst)
                case "hardlink":
                    log.info(f"Hard Linking {source} -> {destination}")
                    if not dry_run:
                        os.link(source, destination)
        except BaseException as err:
            log.error(f"Failed because: {err}")


def main():
    parser = argparse.ArgumentParser(description="Install dotfiles")
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Simulate installation without modifying files",
    )
    args = parser.parse_args()
    dry_run = args.dry_run

    if dry_run:
        global log
        log = logging.getLogger("Install Dotfiles -- DRY")
        log.setLevel(logging.DEBUG)

    run(dry_run)


if __name__ == "__main__":
    main()
