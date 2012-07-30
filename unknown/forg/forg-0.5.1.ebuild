# Copyright 2008 Arvid Norlander
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils python

DESCRIPTION="Graphical Gopher Browser"
HOMEPAGE="gopher://gopher.quux.org/1/Software/Gopher/Downloads/Clients"
SRC_URI="http://quux.org:70/devel/gopher/Downloads/forg-${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/python-1.5.2"
RDEPEND="${DEPEND}
	>=dev-python/pmw-0.8.5"

DOCS="BUGS README TODO"

pkg_setup() {
	python_tkinter_exists
}

src_unpack() {
	unpack "${A}"
	cd "${S}"
	# This fixes a issue with calling tkinter with "col" instead of "column"
	epatch "${FILESDIR}/${P}-fix-column.patch" || die "Patching with fix-column patch failed."

	# If we don't do this, emerge will try to run the program (very stupid makefile)
	rm "Makefile" || die "Getting rid of broken Makefile failed."
}

src_install() {
	dodoc ${DOCS} || die "dodoc failed."
	python_version
	dodir /usr/lib/python${PYVER}/site-packages/forg || die "dodir /usr/share/forg failed."
	insinto /usr/lib/python${PYVER}/site-packages/forg || die "insnto /usr/share/forg failed."
	doins "${S}"/*.py "${D}"/usr/lib/python${PYVER}/site-packages/forg || die "doins failed."
	# We don't want mini-forg.py however. It is just an example of how to embedd.
	rm "${D}"/usr/lib/python${PYVER}/site-packages/forg/mini-forg.py || die "Removing mini-forg.py failed."
	# We need to symlink forg to bin because other modules import it so it needs to be
	# in share too for stuff to work.
	fperms 755 /usr/lib/python${PYVER}/site-packages/forg/forg.py || die "fperms failed."
	dosym ../lib/python${PYVER}/site-packages/forg/forg.py /usr/bin/forg || die "dosym failed."
}

pkg_postinst() {
	python_version
	python_mod_optimize /usr/lib/python${PYVER}/site-packages/forg
}

pkg_postrm() {
	python_version
	python_mod_cleanup /usr/lib/python${PYVER}/site-packages/forg
}
