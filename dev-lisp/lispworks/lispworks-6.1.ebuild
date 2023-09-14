# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib

DESCRIPTION="LispWorks installer"
HOMEPAGE="http://www.lispworks.com"
SRC_URI="amd64? ( lwper61-x86-linux.tar.gz lwdoc61-x86-linux.tar.gz )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+doc"

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="strip"

MY_A="lwper61-x86-linux.tar.gz"
MY_DOC="lwdoc61-x86-linux.tar.gz"
MY_PREFIX="/usr/lib/LispWorks"

S=${WORKDIR}

pkg_nofetch() {
	eerror "Please go to"
	eerror " ${HOMEPAGE%/*}"
	eerror " and download the LispWorks Personal Edition"
	eerror " ${SRC_URI} "

	eerror "After downloading these files, put them in:"
	eerror "	${DISTDIR}/"
}

src_unpack() {
	unpack ${MY_A}
	if use doc; then
		unpack ${MY_DOC}
	fi
}

src_install() {
	local dest=${MY_PREFIX}
	insinto ${dest}
	doins -r lib
	exeinto ${dest}
	doexe lispworks-personal-6-1-1-x86-linux
	dodoc readme-6-1.txt
	dosym ${dest}/lispworks-personal-6-1-1-x86-linux /usr/bin/${PN}
}
