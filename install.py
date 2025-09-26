# /// script
# requires-python = ">=3.11"
# dependencies = []
# ///

import logging
import os
import shutil
import tomllib
from pathlib import Path
from typing import Literal, TypedDict, assert_never

logging.basicConfig()

log = logging.getLogger("Install Dotfiles")
log.setLevel(logging.DEBUG)


class Data(TypedDict):
    source: str
    target: str
    type: Literal["copy", "symlink", "hardlink"]



profile_path = Path(__file__).parent / "profiles"

profile = profile_path / "windows.toml"

profile_data: dict[str, Data] = tomllib.loads(profile.read_text())

for dotfile, data in profile_data.items():
    source = Path(__file__).parent / "dotfiles" / data["source"]
    destination = Path(data["target"]).expanduser()
    deploy_type = data.get("type", "copy")

    is_dir = source.is_dir()

    if destination.exists():
        if destination.is_dir():
            if os.path.islink(destination):
                log.info(f"Deleting link: {destination}")
                destination.rmdir()
            else:
                log.info(f"Deleting directory: {destination}")
                shutil.rmtree(destination)
        else:
            log.info(f"Deleting file: {destination}")
            destination.unlink()

    destination.parent.mkdir(parents=True, exist_ok=True)

    try:
        match deploy_type:
            case "copy":
                log.info(f"Copying {source} -> {destination}")
            case "symlink":
                log.info(f"Soft Linking {source} -> {destination}")
                os.symlink(source, destination, is_dir)
            case "hardlink":
                log.info(f"Hard Linking {source} -> {destination}")
                os.link(source, destination)
            case _:
                assert_never(deploy_type)
    except BaseException as err:
        log.error(f"Failed because: {err}")
