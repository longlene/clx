# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="WebGPU for Python"
HOMEPAGE="https://github.com/pygfx/wgpu-py"
SRC_URI="https://github.com/pygfx/wgpu-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-py-${PV}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/cffi-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/rendercanvas-2.4[${PYTHON_USEDEP}]
	~dev-libs/wgpu-native-27.0.4.0
"

src_prepare() {
	# Gentoo amd64 installs libraries to lib64; add fallback lookup path
	python3 -c "
f = 'wgpu/_coreutils.py'
c = open(f).read()
old = '    path = Path(sys.exec_prefix) / \"Library\" / \"bin\" / name'
new = '    path = Path(sys.exec_prefix) / \"lib64\" / name\n    if path.exists():\n        return str(path)\n\n' + old
assert old in c, 'patch target not found'
open(f, 'w').write(c.replace(old, new, 1))
" || die "failed to patch _coreutils.py"
	distutils-r1_src_prepare
}
