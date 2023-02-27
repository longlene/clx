# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="libinfinity collaborative editing library"
HOMEPAGE="https://github.com/gobby/libinfinity"
SRC_URI="https://github.com/gobby/libinfinity/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk"

DEPEND="
	dev-libs/glib
	dev-libs/libxml2
	net-libs/gnutls
	net-misc/gsasl
	gtk? ( x11-libs/gtk+:3 )

"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/gtk-doc"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf --with-gtk=$(usex gtk)
}
