# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python bindings for the Wasmtime WebAssembly runtime"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime-py"
SRC_URI="https://github.com/bytecodealliance/wasmtime-py/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/wasmtime-py-${PV}"

LICENSE="Apache-2.0-with-LLVM-exceptions"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# wasmtime-py follows Wasmtime's own versioning: breaking changes only land on
# major-version bumps, so any dev-libs/wasmtime release sharing our major
# version is ABI-compatible (patch/minor releases of the two packages don't
# need to match exactly).
RDEPEND="=dev-libs/wasmtime-$(ver_cut 1)*"

src_prepare() {
	# Replace the custom build backend (which downloads libwasmtime.so from the
	# network at build time) with standard setuptools, using a static version.
	python3 -c "
import re
t = open('pyproject.toml').read()
t = re.sub(r'dynamic = \[[^\]]*\]', 'version = \"${PV}\"', t, flags=re.DOTALL)
t = re.sub(r'    \"setuptools-git-versioning[^\"]*\",\n', '', t)
t = t.replace('build-backend = \"backend\"', 'build-backend = \"setuptools.build_meta\"')
t = re.sub(r'backend-path = \[[^\]]*\]\n', '', t, flags=re.DOTALL)
open('pyproject.toml', 'w').write(t)
" || die "Failed to patch pyproject.toml"

	# Load libwasmtime.so from the system library path (provided by dev-libs/wasmtime)
	# instead of a bundled copy relative to the package directory.
	sed -i \
		-e 's|^filename = Path.*|# use system libwasmtime.so (Gentoo: provided by dev-libs/wasmtime)|' \
		-e 's|^dll = cdll.LoadLibrary(str(filename))|dll = cdll.LoadLibrary("libwasmtime.so")|' \
		wasmtime/_ffi.py || die

	distutils-r1_src_prepare
}
