DESCRIPTION="Macfly is a tool allowing to run one or more programs with a
shifted clock compared to system clock. The programs have the same shift and are
synchronized at the same time."
HOMEPAGE="http://software.inl.fr/trac/trac.cgi/wiki/Macfly"
SRC_URI="http://software.inl.fr/releases/macfly/${P}.tar.gz"

inherit eutils python

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/python-2.4"
DEPEND="${RDEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	python_version
	dodir /usr/lib/python${PYVER}/site-packages/macfly/
	cp $S/delorean/macfly/*.py ${D}/usr/lib/python${PYVER}/site-packages/macfly/

	insinto /usr
	dobin $S/delorean/build/scripts-${PYVER}/deloreand
	dobin $S/delorean/build/scripts-${PYVER}/docbrown
	dobin $S/macfly/macfly

#FIXME:
#On AMD64, libmacfly.so should be installed in /usr/lib64 and not /usr/lib. Check macfly/Makefile and edit LIBDIR directory. If macfly doesn't work, try to move libmacfly.so to /usr/lib or /usr/lib64.
	dolib $S/macfly/libmacfly.so

	dodoc AUTHORS README NEWS doc/documentation_fr.odt || die "dodoc failed"
}
