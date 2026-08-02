"""Minimal TOML shim using stdlib tomllib (Python 3.11+)."""
import tomllib as _tomllib


def load(f):
    content = f.read()
    if isinstance(content, bytes):
        return _tomllib.loads(content.decode())
    return _tomllib.loads(content)


def dump(data, f):
    f.write(_dumps(data, []))


def _toml_key(k):
    if k and all(c.isalnum() or c in '-_' for c in k):
        return k
    return '"' + k.replace('\\', '\\\\').replace('"', '\\"') + '"'


def _toml_val(v):
    if isinstance(v, bool):
        return 'true' if v else 'false'
    if isinstance(v, int):
        return str(v)
    if isinstance(v, float):
        return str(v)
    if isinstance(v, str):
        escaped = (v.replace('\\', '\\\\')
                    .replace('"', '\\"')
                    .replace('\n', '\\n')
                    .replace('\r', '\\r'))
        return f'"{escaped}"'
    if isinstance(v, list):
        if not v:
            return '[]'
        if all(isinstance(i, dict) for i in v):
            parts = [
                '{' + ', '.join(f'{_toml_key(k)} = {_toml_val(val)}' for k, val in i.items()) + '}'
                for i in v
            ]
            return '[' + ', '.join(parts) + ']'
        return '[' + ', '.join(_toml_val(i) for i in v) + ']'
    if isinstance(v, dict):
        inner = ', '.join(f'{_toml_key(k)} = {_toml_val(val)}' for k, val in v.items())
        return '{' + inner + '}'
    raise TypeError(f'Unsupported TOML type: {type(v).__name__}')


def _dumps(data, path):
    scalars = [(k, v) for k, v in data.items() if not isinstance(v, dict)]
    subtables = [(k, v) for k, v in data.items() if isinstance(v, dict)]
    parts = []
    for k, v in scalars:
        parts.append(f'{_toml_key(k)} = {_toml_val(v)}\n')
    for k, v in subtables:
        new_path = path + [k]
        header = '.'.join(_toml_key(p) for p in new_path)
        parts.append(f'\n[{header}]\n')
        parts.append(_dumps(v, new_path))
    return ''.join(parts)
