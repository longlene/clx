# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools fcaps git-r3 user

DESCRIPTION="Online is a server service"
HOMEPAGE="https://www.libreoffice.org/download/libreoffice-online/"
EGIT_REPO_URI="https://git.libreoffice.org/online"

EGIT_BRANCH="libreoffice-$(ver_rs 1- - $(ver_cut 1-2))"
EGIT_COMMIT="libreoffice-${PV}"

SRC_URI="https://dev-builds.libreoffice.org/pre-releases/src/libreoffice-${PV}.tar.xz
	https://download.documentfoundation.org/libreoffice/src/$(ver_cut 1-3)/libreoffice-${PV}.tar.xz
	https://downloadarchive.documentfoundation.org/libreoffice/old/${PV}/src/libreoffice-${PV}.tar.xz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="
	>=app-office/libreoffice-$(ver_cut 1)
	dev-libs/poco
	app-arch/cpio
	"

RDEPEND="${DEPEND}"
BDEPEND="dev-python/polib
	net-libs/nodejs
	dev-util/cppunit
	"

PATCHES=("${FILESDIR}/loolwsd-config.patch" "${FILESDIR}/disable-fc-cache.patch")

pkg_setup() {
	enewgroup lool
	enewuser lool -1 /bin/bash /var/lib/libreoffice-online lool
}

src_unpack() {
	unpack libreoffice-${PV}.tar.xz
	git-r3_src_unpack
}

src_prepare() {
	default
	eautoreconf
	./autogen.sh
}

src_configure() {
	econf \
		--with-lokit-path="../libreoffice-${PV}/include" \
		--with-logfile="$EPREFIX/var/log/libreoffice-online/loolwsd.log" \
		--disable-setcap \
		--disable-werror \
		--enable-anonymize-usernames \
		--enable-anonymize-filenames
}

src_install() {
	default

	newinitd "${FILESDIR}/loolwsd.initd" loolwsd

	diropts -m0750 -o lool -g lool
	keepdir {/var/log,/var/lib,/var/lib/cache}/libreoffice-online
}

pkg_postinst() {
	fcaps cap_fowner,cap_mknod,cap_sys_chroot+ep "${EROOT}/usr/bin/loolforkit"
}
