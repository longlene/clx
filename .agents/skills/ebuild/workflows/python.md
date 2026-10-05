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

**Rule: if ANY runtime dep (including one behind a USE flag) is single-impl,
the package MUST be `DISTUTILS_SINGLE_IMPL=1`.** Single-impl is contagious up
the dependency chain: `sci-ml/pytorch` → `sci-ml/ultralytics-thop` →
`sci-ml/ultralytics` → `sci-ml/cua-som` → `sci-ml/cua-agent[omni]` are all
single-impl for that reason. Otherwise default to multi-impl.

Never write `sci-ml/pytorch[${PYTHON_USEDEP}]` in a multi-impl package: a
single-impl package has no `PYTHON_TARGETS`, so the dep is unsatisfiable
(pkgcheck `NonsolvableDeps*` with `sci-ml/pytorch[python_targets_…(-)]`).
A bare dep resolves but leaves the torch target unaligned — also wrong.

Known **single-impl** (PYTHON_SINGLE_TARGET): `sci-ml/pytorch`,
`sci-ml/torchvision`, `sci-ml/transformers`, `sci-ml/huggingface_hub`,
`sci-ml/tokenizers`, `sci-ml/tensorboard`, `sci-ml/accelerate`,
`sci-ml/ultralytics`, `sci-ml/ultralytics-thop`, `sci-ml/cua-som`,
`dev-python/litellm`, `dev-python/gradio`.
Known **multi-impl** (PYTHON_TARGETS): most `dev-python/*`,
`media-libs/opencv`, `sci-ml/safetensors`, `sci-ml/torcheval`,
`sci-ml/torchtnt`, `sci-ml/easyocr`, `sci-ml/supervision`.

For an unfamiliar dep, check its ebuild (do this for EVERY dep before choosing
the impl mode — it is a structural decision, not an existence check):
`grep -lE 'DISTUTILS_SINGLE_IMPL|python-single-r1' <its ebuild>` → single-impl.

**Dep placement — multi-impl package (no single-impl deps at all):**
- All deps → top level with `[${PYTHON_USEDEP}]`, no `python_gen_cond_dep`.

**Dep placement — single-impl package (`DISTUTILS_SINGLE_IMPL=1`):**
- Single-impl deps → top level with `[${PYTHON_SINGLE_USEDEP}]` (never bare).
- Multi-impl deps → inside `python_gen_cond_dep` (no target filter), including
  USE-conditional ones (`foo? ( ... )` goes inside the quoted block):
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

`EPYTEST_PLUGINS` lists pytest **plugins** only (e.g. `( pytest-asyncio )`
when tests use `@pytest.mark.asyncio`); never put `pytest` itself in it. No
plugins → `EPYTEST_PLUGINS=()`. Set it before `distutils_enable_tests`.

## Step F: PyPI vs GitHub/GitLab source

**Prefer GitHub/GitLab over PyPI** — the VCS archive includes tests and the
full tree. route already picks GitHub when PyPI metadata points there, but
PyPI metadata is often incomplete: after scaffold, check `python.urls` for a
`Homepage`/`Repository` GitHub URL. If one exists and route chose pypi,
consider switching SRC_URI to the GitHub archive (tagged releases only).

Suffix rule (also Key rule 5): GitHub archives → `-> ${P}.gh.tar.gz`,
GitLab → `-> ${P}.gl.tar.gz`, always — avoids PyPI sdist collisions and
pkgcheck `PythonGHDistfileSuffix`.

**Exception — monorepos (several PyPI packages in one repo, e.g. trycua/cua
`libs/python/<lib>`):** use `inherit pypi` sdists instead.
- The package version comes from **PyPI** (`https://pypi.org/pypi/NAME/json`),
  never from the repo's newest tag. Monorepos tag per component
  (`core-v0.3.1`, `agent-v0.8.4`) and route will pick an unrelated tag
  (e.g. `sandbox-v0.8.0`) or an old repo-wide tag; if every sibling ends up
  "version 0.1.0" or the version doesn't match PyPI, the route is wrong.
- The GitHub tarball is the whole monorepo (cua: ~130 MB per tag, once per
  package) while the sdist is KB-sized.
- Sibling packages from the same monorepo depend on each other with normal
  atoms: `>=sci-ml/cua-core-0.3.0[${PYTHON_USEDEP}]` (plus an upper bound if
  upstream has one) — never `:=` (Python packages have no subslots) and
  never without the USE dep.
- Check the license per component (`License-Expression` in the sdist's
  `PKG-INFO`); monorepo components can differ from the repo LICENSE
  (cua is MIT, cua-som is AGPL-3+).
