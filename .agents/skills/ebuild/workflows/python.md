# Python Ebuild Workflow

Scaffold's `python` JSON object already contains the pyproject.toml facts:
`build_backend`, `pep517`, `requires_python`, `urls`, `dependencies`,
`optional_dependencies`, `needs_setuptools_scm`. Work from it — no grepping
needed. Final-shape examples: `templates/python-pypi.ebuild`,
`templates/python-github.ebuild`.

## Step A: DISTUTILS_USE_PEP517

Use the `pep517` value directly (PyPI-source skeletons already have it set).
If it is `null`, the backend is exotic — check the `distutils-r1` eclass docs
for the supported value; do not guess. `setup.py`-only projects →
`setuptools`.

If `needs_setuptools_scm` is true AND the source is a GitHub archive (no
`.git` dir), both of these are required (pkgcheck: `PythonMissingSCMDependency`):

```ebuild
BDEPEND="dev-python/setuptools-scm"

src_prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
    distutils-r1_src_prepare
}
```

## Step B: PYTHON_COMPAT

Default: `PYTHON_COMPAT=( python3_{13..15} )`. Constrain using
`requires_python` and the intersection of what the deps' ebuilds support.

## Step C: Map dependencies to Gentoo atoms

Declare **all** of `dependencies` (and relevant `optional_dependencies`) in
RDEPEND — do not pre-check availability; validate is the judge (main
SKILL.md Step 6).

Default mapping is `dev-python/PKGNAME`. Known exceptions:

| PyPI name | Gentoo atom |
|---|---|
| `torch` | `sci-ml/pytorch` |
| `faiss-cpu` / `faiss-gpu` | `sci-libs/faiss` |
| `transformers` | `sci-ml/transformers` |
| `datasets` | `sci-ml/datasets` |
| `huggingface-hub` | `sci-ml/huggingface_hub` |
| `tokenizers` | `sci-ml/tokenizers` |
| `safetensors` | `sci-ml/safetensors` |
| `lightning` / `pytorch-lightning` | `sci-ml/lightning` |
| `torchmetrics` | `sci-ml/torchmetrics` |
| `bitsandbytes` | `sci-ml/bitsandbytes` |
| `tensorboard` | `sci-ml/tensorboard` |
| `sentencepiece` | `sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]` |
| `pydantic-core` | `dev-python/pydantic` |

## Step D: Single-impl vs multi-impl

Use `DISTUTILS_SINGLE_IMPL=1` when the package is part of a tightly-coupled
single-impl stack (directly wraps/extends a single-impl package like
`sci-ml/pytorch` as a framework layer). Pure Python utilities that merely
*use* pytorch at runtime are multi-impl (the default).

In this overlay, **single-impl** (PYTHON_SINGLE_TARGET): `sci-ml/pytorch`,
`sci-ml/transformers`, `sci-ml/huggingface_hub`, `sci-ml/tokenizers`,
`sci-ml/tensorboard`, `sci-ml/accelerate`.
**Multi-impl** (PYTHON_TARGETS): `dev-python/*`, `sci-ml/safetensors`,
`sci-ml/torcheval`, `sci-ml/torchtnt`.

For an unfamiliar dep: `eix -e PKGNAME` — `PYTHON_SINGLE_TARGET` in the
output → single-impl; `PYTHON_TARGETS` → multi-impl.

**Dep placement — multi-impl package (default):**
- Multi-impl deps (`dev-python/*`) → top level with `[${PYTHON_USEDEP}]`.
  Do NOT wrap in `python_gen_cond_dep`.
- Single-impl deps (like pytorch) → top level WITHOUT Python USE constraints:
  ```ebuild
  RDEPEND="
      >=sci-ml/pytorch-2.3.0
      dev-python/numpy[${PYTHON_USEDEP}]
  "
  ```

**Dep placement — single-impl package (`DISTUTILS_SINGLE_IMPL=1`):**
- Other single-impl deps → top level with `[${PYTHON_SINGLE_USEDEP}]`
- Multi-impl deps → inside `python_gen_cond_dep` (no target filter):
  ```ebuild
  RDEPEND="
      sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
      $(python_gen_cond_dep '
          dev-python/numpy[${PYTHON_USEDEP}]
      ')
  "
  ```

`python_gen_cond_dep` is ONLY for: (1) single-impl package needing
multi-impl deps, (2) a dep restricted to a subset of Python targets, e.g.
`$(python_gen_cond_dep '...[${PYTHON_USEDEP}]' python3_13)`.

## Step E: Tests

If tests need GPU, distributed setup, or external services →
`RESTRICT="test"`. Otherwise:

```ebuild
distutils_enable_tests pytest
```

Never set up IUSE/RESTRICT/pytest-BDEPEND manually — the helper does all of
it and actually runs the tests.

## Step F: PyPI vs GitHub/GitLab source

**Prefer GitHub/GitLab over PyPI** — the VCS archive includes tests and the
full tree. route already picks GitHub when PyPI metadata points there, but
PyPI metadata is often incomplete: after scaffold, check `python.urls` for a
`Homepage`/`Repository` GitHub URL. If one exists and route chose pypi,
consider switching SRC_URI to the GitHub archive (tagged releases only).

Suffix rule (also Key rule 5): GitHub archives → `-> ${P}.gh.tar.gz`,
GitLab → `-> ${P}.gl.tar.gz`, always — avoids PyPI sdist collisions and
pkgcheck `PythonGHDistfileSuffix`.
