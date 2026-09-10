---
name: python-usesdep-mapping
description: Determine correct PYTHON_USEDEP vs PYTHON_SINGLE_USEDEP usage in Gentoo Python ebuild dependencies
source: auto-skill
extracted_at: '2026-07-02T16:46:43.846Z'
---

When writing or fixing a Python ebuild in Gentoo, the choice between `[${PYTHON_USEDEP}]` and `[${PYTHON_SINGLE_USEDEP}]` in dependencies depends on whether the **target package** uses `PYTHON_TARGETS` or `PYTHON_SINGLE_TARGET` in its own ebuild.

## The Core Rule

Use `eix` to inspect each dependency:

```bash
eix "CATEGORY/PACKAGE"
```

Look for:
- **`PYTHON_TARGETS="..."`** in eix output → the package is **multi-impl** → use `[${PYTHON_USEDEP}]`
- **`PYTHON_SINGLE_TARGET="..."`** in eix output → the package is **single-impl** → use `[${PYTHON_SINGLE_USEDEP}]`

## When to Use `DISTUTILS_SINGLE_IMPL=1`

Set `DISTUTILS_SINGLE_IMPL=1` when the consumer package depends primarily on single-impl packages (e.g., `sci-ml/pytorch`, `sci-ml/transformers`, `sci-ml/huggingface_hub`, `sci-ml/accelerate`). This means:

- **Other single-impl deps** → top-level in RDEPEND with `[${PYTHON_SINGLE_USEDEP}]`
- **Multi-impl Python deps** → wrapped in `$(python_gen_cond_dep '...[${PYTHON_USEDEP}]')`

If the consumer is **not** single-impl (no `DISTUTILS_SINGLE_IMPL=1`):
- **Multi-impl Python deps** → top-level with `[${PYTHON_USEDEP}]` (no `python_gen_cond_dep`)
- **Single-impl deps** → top-level without Python USE constraints

## Decision Flow

1. `eix "CATEGORY/PKG"` → check for `PYTHON_TARGETS` or `PYTHON_SINGLE_TARGET`
2. `PYTHON_TARGETS` found → dep is multi-impl → use `[${PYTHON_USEDEP}]` (if consumer is multi-impl) or `$(python_gen_cond_dep '...[${PYTHON_USEDEP}]')` (if consumer is single-impl)
3. `PYTHON_SINGLE_TARGET` found → dep is single-impl → use `[${PYTHON_SINGLE_USEDEP}]`
4. Package not in any known repo → assume single-impl as safe default (uses `[${PYTHON_SINGLE_USEDEP}]`)

## Common Single-impl Packages (in this overlay)

These have `PYTHON_SINGLE_TARGET` — always use `[${PYTHON_SINGLE_USEDEP}]`:
- `sci-ml/pytorch`, `sci-ml/transformers`, `sci-ml/huggingface_hub`, `sci-ml/tokenizers`
- `sci-ml/tensorboard`, `sci-ml/accelerate`, `sci-ml/bitsandbytes`, `sci-ml/datasets`
- `sci-ml/lm-eval`, `sci-ml/peft`, `sci-ml/safetensors`

## Common Multi-impl Packages

These have `PYTHON_TARGETS` — use `[${PYTHON_USEDEP}]`:
- All `dev-python/*`
- `sci-ml/safetensors` (in some overlays), `sci-ml/torcheval`, `sci-ml/torchtnt`

## BDEPEND Note

`DISTUTILS_USE_PEP517` takes the build-backend module name from `pyproject.toml` (e.g., `uv-build` for `uv_build` backend). The BDEPEND entry for the build backend tool (like `dev-python/uv-build`) is NOT needed since distutils-r1 eclass added it already.
