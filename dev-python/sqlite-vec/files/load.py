
import os as _os


def _find_vec0() -> str:
    for _d in ("/usr/lib64", "/usr/lib", "/usr/local/lib64", "/usr/local/lib"):
        _p = _os.path.join(_d, "vec0.so")
        if _os.path.exists(_p):
            return _p[:-3]
    raise RuntimeError(
        "sqlite-vec extension (vec0.so) not found; "
        "ensure dev-db/sqlite-vec is installed"
    )


def load(db) -> None:
    """Load the sqlite-vec extension into a sqlite3 connection."""
    db.enable_load_extension(True)
    try:
        db.load_extension(_find_vec0())
    finally:
        db.enable_load_extension(False)
