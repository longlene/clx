DESCRIPTION="CLIPS is a productive development and delivery expert system tool"
HOMEPAGE="http://www.ghg.net/clips/CLIPS.html"
SRC_URI="http://www.ghg.net/clips/download/source/clipssrc.tar.Z
	http://www.ghg.net/clips/download/source/x-prjct.tar.Z
	http://www.ghg.net/clips/download/source/makefile
	http://www.ghg.net/clips/download/source/clips.hlp
	http://www.ghg.net/clips/download/documentation/bpg.pdf
	http://www.ghg.net/clips/download/documentation/apg.pdf
	http://www.ghg.net/clips/download/documentation/ig.pdf
	http://www.ghg.net/clips/download/documentation/usrguide.pdf
	http://www.ghg.net/clips/download/documentation/arch5-1.pdf
	http://www.ghg.net/clips/download/documentation/3CCP.pdf
	http://www.ghg.net/clips/download/documentation/abstract.pdf"

SLOT="0"
LICENSE="BSD style"
KEYWORDS="~x86"

IUSE=""

DEPEND="virtual/x11
	sys-libs/libtermcap-compat"

S=${WORKDIR}/clipssrc

src_unpack() {
	unpack ${A}
	cp -p ${DISTDIR}/makefile ${S}/
	mv -vi ${WORKDIR}/x-prjct/makefile/makefile.x ${S}/ || die
	mv -vi ${WORKDIR}/x-prjct/xinterface/* ${S}/ || die
	epatch ${FILESDIR}/${PN}-setup.patch || die
	epatch ${FILESDIR}/${P}-lib64.patch || die
}

src_compile() {
	cd ${S}
	make || die
	make -f makefile.x || die
}

src_install() {
	dobin clips xclips
	insinto /usr/share/${PN}
	doins ${DISTDIR}/clips.hlp
	dodoc ${DISTDIR}/bpg.pdf
	dodoc ${DISTDIR}/apg.pdf
	dodoc ${DISTDIR}/ig.pdf
	dodoc ${DISTDIR}/usrguide.pdf
	dodoc ${DISTDIR}/arch5-1.pdf
	dodoc ${DISTDIR}/3CCP.pdf
	dodoc ${DISTDIR}/abstract.pdf
}
