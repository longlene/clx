# Distributed under the terms of the GNU General Public License v2 EAPI=7
EAPI=7

inherit common-lisp-3 eutils

MY_PV=${PV:0:6}
CVS_PV=${PV:7:4}.${PV:11:2}.${PV:13}

DESCRIPTION="A portable version of AllegroServe which is a web application server for Common Lisp programs."
HOMEPAGE="http://portableaserve.sourceforge.net/
http://packages.debian.org/untable/web/cl-aserve.html"
SRC_URI="https://mydebian.googlecode.com/files/cl-portable-aserve_${MY_PV}+cvs.${CVS_PV}.orig.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
=dev-lisp/htmlgen-${PV}
=dev-lisp/webactions-${PV}
=dev-lisp/acl-compat-${PV}"

S=${WORKDIR}/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}-dfsg/aserve
#src_unpack() {
#	unpack ${A}
#	cd ${S}; epatch ${FILESDIR}/${PV}-clisp-gentoo.patch
#}

src_install() {
	cd ${PN}
	rm -rf htmlgen
	rm -rf webactions
	common-lisp-3_src_install
	#common-lisp-install aserve/*.{cl,asd,system}
	#common-lisp-system-symlink
	dodoc ChangeLog ../README ../README.cmucl ../INSTALL.lisp ../logical-hostnames.lisp
	insinto /usr/share/doc/${PF}/contrib
	doins ../contrib/*.lisp
	insinto /usr/share/doc/${PF}/examples
	doins examples/*
	insinto /usr/share/doc/${PF}/doc
	dohtml doc/*.html
}
