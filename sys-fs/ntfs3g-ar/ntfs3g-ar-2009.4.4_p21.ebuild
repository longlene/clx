# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/ntfs3g/ntfs3g-2009.4.4-r1.ebuild,v 1.1 2009/10/28 22:32:19 eva Exp $

EAPI=2

MY_PN="${PN/3g-ar/-3g}"
MY_P="${MY_PN}-${PV/_p/AR.}"

DESCRIPTION="Open source read-write NTFS driver that runs under FUSE, advanced community edition"
HOMEPAGE="http://www.tuxera.com/community/ntfs-3g-advanced/"
SRC_URI="http://pagesperso-orange.fr/b.andre/${MY_P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="debug hal suid +external-fuse"

RDEPEND=">=sys-fs/fuse-2.6.0
	hal? ( sys-apps/hal )
	!sys-fs/ntfs3g"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_configure() {
	econf \
		--docdir="/usr/share/doc/${PF}" \
		--enable-ldscript \
		--disable-ldconfig \
		--with-fuse=$(use external-fuse && echo external || echo internal) \
		$(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	prepalldocs || die "prepalldocs failed"
	dodoc AUTHORS ChangeLog CREDITS

	use suid && fperms u+s "/bin/${MY_PN}"

	if use hal; then
		insinto /etc/hal/fdi/policy/
		newins "${FILESDIR}/10-ntfs3g.fdi.2009-r1" "10-ntfs3g.fdi"
	fi
}

pkg_postinst() {
	ewarn "This is an advanced features release of the ntfs-3g package. It"
	ewarn "passes standard tests on i386 and x86_64 CPUs but users should"
	ewarn "still backup their data.  More info at:"
	ewarn ${HOMEPAGE}

	if use suid; then
		ewarn
		ewarn "You have chosen to install ${PN} with the binary setuid root. This"
		ewarn "means that if there any undetected vulnerabilities in the binary,"
		ewarn "then local users may be able to gain root access on your machine."
		ewarn
	fi
}
