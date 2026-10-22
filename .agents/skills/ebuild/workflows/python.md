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

### The one rule: the DEP's style picks the USE-dep form, not yours

Each Python package exposes exactly one flag interface:
- multi-impl dep → only `python_targets_*` → reached via `[${PYTHON_USEDEP}]`
- single-impl dep → only `python_single_target_*` → reached via `[${PYTHON_SINGLE_USEDEP}]`

Your own mode only decides *where* the line goes:

| you ↓ / dep → | dep is **single-impl** | dep is **multi-impl** |
|---|---|---|
| **multi-impl** | impossible — switch yourself to `DISTUTILS_SINGLE_IMPL=1` | top level, `foo[${PYTHON_USEDEP}]` |
| **single-impl** | top level, `foo[${PYTHON_SINGLE_USEDEP}]` | inside `$(python_gen_cond_dep '…')`, `foo[${PYTHON_USEDEP}]` |

`python_gen_cond_dep` is the bridge that turns your single target into the
matching `python_targets_*` flag on a multi-impl dep. It is NOT optional
there, and `${PYTHON_USEDEP}` outside it is not defined in single-impl ebuilds.

```ebuild
# single-impl package
RDEPEND="
    sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]        # pytorch is single-impl
    $(python_gen_cond_dep '
        dev-python/numpy[${PYTHON_USEDEP}]         # numpy is multi-impl
        sci-ml/tokenizers[${PYTHON_USEDEP}]        # multi-impl since 0.23.3-r1
        cuda? ( dev-python/cupy[${PYTHON_USEDEP}] )  # USE-conditionals go inside too
    ')
"
```

Never write a bare Python dep (`sci-ml/foo` with no USE dep) to dodge a style
mismatch — it resolves, but the dep may be built for a different Python.

### Determine the dep's style from the version that will be picked

Do this for EVERY Python dep — it's a structural decision, not an existence
check, and **it can change between versions** (gentoo `sci-ml/tokenizers`
was single-impl through 0.23.2 and is multi-impl from 0.23.3-r1; transformers
5.18.0 switched its tokenizers dep accordingly). Check the ebuild Portage
would actually select, not the overlay copy or a remembered list:

```bash
f=$(equery -q which sci-ml/tokenizers)
grep -qE '^DISTUTILS_SINGLE_IMPL|python-single-r1' "$f" && echo single || echo multi
```

Hints only (snapshot 2026-10, verify anyway). Single-impl: `sci-ml/pytorch`,
`torchvision`, `transformers`, `huggingface_hub`, `datasets`, `tensorboard`,
`accelerate`, `ultralytics(-thop)`, `cua-som`, `dev-python/gradio`.
Multi-impl: most `dev-python/*`, `sci-ml/tokenizers`, `sci-ml/safetensors`,
`sci-ml/sentencepiece`, `dev-python/litellm`, `media-libs/opencv`,
`sci-ml/torcheval`, `sci-ml/torchtnt`, `sci-ml/easyocr`, `sci-ml/supervision`.

### Reading the failure

- pkgcheck `NonsolvableDeps*` showing `foo[python_single_target_…]` → foo is
  multi-impl; move it into `python_gen_cond_dep` with `[${PYTHON_USEDEP}]`.
- showing `foo[python_targets_…]` → foo is single-impl; take it out of
  `python_gen_cond_dep` and use `[${PYTHON_SINGLE_USEDEP}]` (or, in a
  multi-impl package, go single-impl).
- emerge slot conflict where your package's dep can only be met by an
  *older* version or an overlay copy, while another installed package wants
  the newer one → your USE-dep style is wrong for the current version. Fix
  your ebuild. Don't conclude that upstream is inconsistent, and don't pin
  the old version.

### Overlay copies of gentoo Python packages

Many clx copies of gentoo packages exist only to add `~arm64`. When gentoo
changes a package's impl style, the clx copy goes stale and becomes a trap.
Bump it: copy the new gentoo ebuild, add `~arm64`, set
`PYTHON_COMPAT=( python3_{13..15} )`, digest. Then update the overlay
reverse-deps to the new style
(`grep -rl 'sci-ml/foo' --include='*.ebuild' /usr/local/portage`).

`python_gen_cond_dep` has exactly two uses: (1) a single-impl package
depending on multi-impl deps (above), (2) a dep restricted to a subset of
Python targets, e.g. `$(python_gen_cond_dep '…[${PYTHON_USEDEP}]' python3_13)`.

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
