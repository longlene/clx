# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit webapp versionator eutils

DESCRIPTION="A user activity blocker"
HOMEPAGE="http://jquery.malsup.com/block/"
SRC_URI="https://raw.github.com/malsup/${PN}/5b40212f917f5e8c6d0e54bc0569f2724901d306/jquery.blockUI.js"

LICENSE="|| ( MIT GPL-2 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/jquery.blockUI.js" "${S}/"
}

src_install() {
	webapp_src_preinst
	webapp_src_install
	insinto "${MY_HTDOCSDIR}"
	doins "jquery.blockUI.js"
}

pkg_setup() {
	webapp_pkg_setup
}

pkg_postinst() {
	webapp_pkg_postinst
}
