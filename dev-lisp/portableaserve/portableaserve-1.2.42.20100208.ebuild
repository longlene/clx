# Distributed under the terms of the GNU General Public License v2 EAPI=4
inherit common-lisp-3

MY_PV=${PV:0:6}
CVS_PV=${PV:7:4}.${PV:11:2}.${PV:13}

DESCRIPTION="A portable version of AllegroServe which is a web application server for Common Lisp programs."
HOMEPAGE="http://portableaserve.sourceforge.net/
http://packages.debian.org/untable/web/cl-aserve.html"
SRC_URI="https://mydebian.googlecode.com/files/cl-portable-aserve_${MY_PV}+cvs.${CVS_PV}.orig.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
=dev-lsip/htmlgen-${PV}
=dev-lsip/acl-compat-${PV}"

S=${WORKDIR}/cl-portable-aserve-${MY_PV}+cvs.${CVS_PV}.orig
#src_unpack() {
#	unpack ${A}
#	cd ${S}; epatch ${FILESDIR}/${PV}-clisp-gentoo.patch
#}

src_install() {
	common-lisp-install aserve/*.cl aserve/*.asd
	common-lisp-system-symlink
	dodoc ChangeLog README README.cmucl INSTALL.lisp logical-hostnames.lisp
	insinto /usr/share/doc/${PF}/contrib
	doins contrib/*.lisp
	insinto /usr/share/doc/${PF}/examples
	doins aserve/examples/*
	insinto /usr/share/doc/${PF}/doc
	doins aserve/doc/*
}
