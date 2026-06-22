# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit java-pkg-2 distutils-r1

DESCRIPTION="Framework for elegantly configuring complex applications"
HOMEPAGE="https://github.com/facebookresearch/hydra"
SRC_URI="https://github.com/facebookresearch/hydra/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/hydra-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
# test deps include pytest-snail, not packaged in Gentoo
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/omegaconf-2.2[${PYTHON_USEDEP}]
	=dev-python/antlr4-python3-runtime-4.13*[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
')"
BDEPEND="
	dev-java/antlr-tool:4
	>=virtual/jdk-1.8:*
"

src_prepare() {
	distutils-r1_src_prepare

	local antlr_cp=$(java-pkg_getjars --with-dependencies antlr-tool-4)
	sed -i \
		-e 's|"-jar",|"-cp",|' \
		-e "s|join(root_dir, \"bin/antlr-4.9.3-complete.jar\"),|\"${antlr_cp}\", \"org.antlr.v4.Tool\",|" \
		build_helpers/build_helpers.py || die
	rm build_helpers/bin/antlr-4.9.3-complete.jar || die
	sed -i 's/antlr4-python3-runtime==4\.9\.\*/antlr4-python3-runtime==4.13.*/' \
		requirements/requirements.txt || die
}
