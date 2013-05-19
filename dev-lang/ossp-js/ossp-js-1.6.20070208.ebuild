# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI="4"

inherit autotools

SRC_URI="ftp://ftp.ossp.org/pkg/lib/js/js-${PV}.tar.gz -> ${P}.tar"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="A stand-alone distribution of the JavaScript (JS) programming language reference implementation from Mozilla."
HOMEPAGE="http://www.ossp.org/pkg/lib/js/"

LICENSE="LGPL-2.0"
SLOT="0"
IUSE="dso perl pic readline unicode"

RDEPEND="perl? ( dev-lang/perl )
	readline? ( sys-libs/readline )"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
	default
	mv js-* "${S}" || die
}

src_prepare() {
	:
}

src_configure() {
	econf \
		$(use_with dso dso) \
		$(use_with perl perl) \
		$(use_with pic pic) \
		$(use_with readline editline) \
		$(use_with unicode utf8)
}

src_install() {
	default
}
