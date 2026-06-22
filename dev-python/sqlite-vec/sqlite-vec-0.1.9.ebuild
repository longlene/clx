# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python bindings for the sqlite-vec SQLite vector search extension"
HOMEPAGE="https://github.com/asg017/sqlite-vec https://pypi.org/project/sqlite-vec/"
SRC_URI="https://github.com/asg017/sqlite-vec/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/sqlite-vec-${PV}"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND=">=dev-db/sqlite-vec-${PV}"

src_prepare() {
	default
	mkdir -p sqlite_vec || die
	cat bindings/python/extra_init.py "${FILESDIR}/load.py" \
		> sqlite_vec/__init__.py || die
	cp "${FILESDIR}/pyproject.toml" . || die
}
