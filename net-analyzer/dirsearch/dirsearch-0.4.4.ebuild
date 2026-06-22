# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit python-single-r1

DESCRIPTION="Advanced web path scanner"
HOMEPAGE="https://github.com/maurosoria/dirsearch"
SRC_URI="https://github.com/maurosoria/dirsearch/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/colorama[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/psycopg[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pysocks[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-ntlm[${PYTHON_USEDEP}]
		dev-python/requests-toolbelt[${PYTHON_USEDEP}]
		dev-python/defusedcsv[${PYTHON_USEDEP}]
		dev-python/httpx-ntlm[${PYTHON_USEDEP}]
		dev-python/ntlm-auth[${PYTHON_USEDEP}]
		dev-python/mysql-connector-python[${PYTHON_USEDEP}]
	')
"
BDEPEND="${PYTHON_DEPS}"

RESTRICT="test"

src_install() {
	python_moduleinto dirsearch
	python_domodule __init__.py dirsearch.py lib db static config.ini

	python_newscript - dirsearch <<-EOF
		#!${EPREFIX}/usr/bin/${EPYTHON}
		from dirsearch.dirsearch import main
		main()
	EOF
}
