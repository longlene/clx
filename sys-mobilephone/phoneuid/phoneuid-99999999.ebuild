# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git autotools

DESCRIPTION=""
HOMEPAGE=""

EGIT_REPO_URI="http://shr.bearstech.com/repo/${PN}.git"
EGIT_PROJECT="${PN}"

LICENSE="GPL-3"
SLOT="0"
EAPI="2"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"
SHR_SPECS_PATH="/usr/share/shr/xml"

RDEPEND="
	dev-libs/dbus-glib
	sys-apps/dbus
	sys-mobilephone/libphone-ui
	sys-mobilephone/shr-specs"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_compile() {
	emake SPECS_PATH=${SHR_SPECS_PATH} || die "compilation failed"
}

src_install() {
	emake DESTDIR="${D}" SPECS_PATH="${SHR_SPECS_PATH}" install || die "install failed"
}
