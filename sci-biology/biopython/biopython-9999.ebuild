# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/biopython/biopython-1.53.ebuild,v 1.5 2010/02/13 19:10:21 armin76 Exp $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit base distutils eutils

if [[ ${PV} == "9999" ]] ; then
	inherit git
	EGIT_REPO_URI="git://github.com/biopython/biopython.git"
	SRC_URI=""
else
	SRC_URI="http://www.biopython.org/DIST/${P}.tar.gz"
fi


DESCRIPTION="Biopython - Python modules for computational molecular biology"
HOMEPAGE="http://www.biopython.org http://pypi.python.org/pypi/biopython"

LICENSE="as-is"
SLOT="0"
KEYWORDS="alpha amd64 ppc sparc x86"
IUSE="mysql postgres"

RDEPEND="dev-python/numpy
	>=dev-python/reportlab-2.0
	mysql? ( dev-python/mysql-python )
	postgres? ( dev-python/psycopg )"
DEPEND="${RDEPEND}
	sys-devel/flex"
RESTRICT_PYTHON_ABIS="3.*"

PATCHES=(
	"${FILESDIR}/${PN}-1.51-flex.patch"
)

DISTUTILS_USE_SEPARATE_SOURCE_DIRECTORIES="1"
DOCS="CONTRIB DEPRECATED NEWS README"
PYTHON_MODNAME="Bio BioSQL"


src_unpack() {
	git_src_unpack
	cd "${S}"/..
	ln -s "${S}" "${S}"-2.6
	cd "${S}"

}

src_compile() {
	distutils_src_compile
}

src_test() {
	testing() {
		cd Tests
		PYTHONPATH="$(ls -d ../build/lib.*)" "$(PYTHON)" run_tests.py
	}
	python_execute_function -s testing
}

src_install() {
	distutils_src_install

	dodir "/usr/share/doc/${PF}"
	cp -r Doc/* "${D}/usr/share/doc/${PF}/" || \
			die "Failed to install documentation."
	dodir "/usr/share/${PN}"
	rm -f Tests/*.pyc || \
			die "Failed to remove precompiled test files."
	cp -r --preserve=mode Scripts Tests "${D}/usr/share/${PN}/" || \
			die "Failed to install shared files."
}
