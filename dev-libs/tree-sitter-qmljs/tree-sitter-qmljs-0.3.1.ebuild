# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar distutils-r1

DESCRIPTION="QML grammar for tree-sitter"
HOMEPAGE="https://github.com/yuja/tree-sitter-qmljs"
SRC_URI="https://github.com/yuja/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( README.md )

# Upstream ships a dev-only Makefile (node_modules example tooling, no
# build/install targets); use the canonical tree-sitter template instead.
PATCHES=(
	"${FILESDIR}"/0001-replace-Makefile-with-canonical-tree-sitter-template.patch
)

# gpep517 install-wheel leaves a venv-like layout in the install root;
# the eclass hook dies if the script dir already exists.
python_compile() {
	distutils-r1_python_compile
	rm -f "${BUILD_DIR}/install"/usr/bin/python* "${BUILD_DIR}/install"/pyvenv.cfg || die
	rm -rf "${BUILD_DIR}/install$(python_get_scriptdir)" || die
}
