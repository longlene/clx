# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit python-single-r1

MY_PV="${PV/_beta/b}"

DESCRIPTION="CoreAI high-level Python API"
HOMEPAGE="https://github.com/apple/coreai https://pypi.org/project/coreai-core/"
SRC_URI="
	https://files.pythonhosted.org/packages/be/1a/2ac5241f57bc06ccaa30ca430048122cfadc1e4819cc46648c3fc6370e51/coreai_core-${MY_PV}-cp311-cp311-manylinux1_x86_64.whl
		-> coreai_core-${MY_PV}-cp311.whl
	https://files.pythonhosted.org/packages/40/4c/a583066b77180a8e7e07f3d3efc906e5028b935a0cb0a4531bdc708065ef/coreai_core-${MY_PV}-cp312-cp312-manylinux_2_34_x86_64.whl
		-> coreai_core-${MY_PV}-cp312.whl
	https://files.pythonhosted.org/packages/cc/ea/8fcb40bde6efc8d9edd79407e4f65fe09535593e1c76f28c00419eeb3c37/coreai_core-${MY_PV}-cp313-cp313-manylinux_2_34_x86_64.whl
		-> coreai_core-${MY_PV}-cp313.whl
"
S="${WORKDIR}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="binchecks strip test"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/ml-dtypes[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/yuvio[${PYTHON_USEDEP}]
	')
"
BDEPEND="${PYTHON_DEPS} dev-python/installer"

QA_PREBUILT="usr/lib/python*/site-packages/coreai_core*"

src_unpack() { :; }

src_compile() { :; }

src_install() {
	local cpver="cp${EPYTHON#python}"
	cpver="${cpver/./}"
	"${EPYTHON}" -m installer --destdir="${ED}" \
		"${DISTDIR}/coreai_core-${MY_PV}-${cpver}.whl" || die
}
