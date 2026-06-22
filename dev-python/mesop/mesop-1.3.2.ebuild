# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Rapidly build AI apps in Python"
HOMEPAGE="
	https://github.com/mesop-dev/mesop
	https://pypi.org/project/mesop/
"
# PyPI only ships a pre-built wheel (no sdist); the Angular web assets
# are compiled via Bazel and not present in the GitHub source archive.
SRC_URI="https://files.pythonhosted.org/packages/70/aa/fdf27ca46f32324f1d10ef900d21fd19298dfb5511d02035f664230aabc6/mesop-${PV}-py3-none-any.whl"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="binchecks test"

RDEPEND="$(python_gen_cond_dep '
	dev-python/absl-py[${PYTHON_USEDEP}]
	>=dev-python/deepdiff-8.6.1[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/watchdog[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-3.0.6[${PYTHON_USEDEP}]
')"
BDEPEND="$(python_gen_cond_dep '
	dev-python/installer[${PYTHON_USEDEP}]
')"

src_prepare() {
	distutils-r1_src_prepare
}

src_configure() { :; }
src_compile() { :; }

python_install() {
	"${EPYTHON}" -m installer \
		--destdir="${D}" \
		"${DISTDIR}/${P}-py3-none-any.whl" || die
}
