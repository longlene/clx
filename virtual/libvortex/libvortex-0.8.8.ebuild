# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A BEEP implementation for af-arch (RFC 3080/RFC 3081 compliant)"
HOMEPAGE="http://www.aspl.es/fact/files/af-arch/vortex/html/"
SRC_URI="mirror://sourceforge/vortexlibrary/vortex-${PV}.b1834.g1834.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# static	= also build a static library
# doc		= include documentation
IUSE="static doc ssl sasl"

RDEPEND="
	>=dev-libs/glib-2.6.0
	>=dev-libs/libxml2-2.6.0"

DEPEND="${RDEPEND}
	sys-libs/libtermcap-compat
	>=dev-util/pkgconfig-0.9.0
	sasl? ( >=virtual/gsasl-0.2.5 )
	ssl? ( dev-libs/openssl )
	doc? ( app-doc/doxygen )"

src_unpack() {
	unpack ${A}
	mv ${WORKDIR}/vortex-${PV}.b1834.g1834 ${WORKDIR}/${P}
}

src_compile() {
	econf \
		$(use_enable static) \
		$(use_enable doc vortex-doc) \
		$(use_enable sasl sasl-support) \
		$(use_enable ssl tls-support) \
		|| die "configure failed"

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR=${D} install || die
	dodoc README AUTHORS ChangeLog
	use doc && dohtml doc/html/*
}

