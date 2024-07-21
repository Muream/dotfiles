import os
import tomllib
from pathlib import Path
from typing import Literal, TypedDict, assert_never
import shutil


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
                destination.rmdir()
            else:
                shutil.rmtree(destination)
        else:
            destination.unlink()

    destination.parent.mkdir(parents=True, exist_ok=True)

    match deploy_type:
        case "copy":
            print(f"Copying {source} -> {destination}")
        case "symlink":
            print(f"Soft Linking {source} -> {destination}")
            os.symlink(source, destination, is_dir)
        case "hardlink":
            print(f"Hard Linking {source} -> {destination}")
            os.link(source, destination)
        case _:
            assert_never(deploy_type)
