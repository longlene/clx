# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="e3395cd90bed9b7b9fc319e79528fedcc0d947fe"

DESCRIPTION="Tiny HTTP httpd"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/uhttpd.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lua ssl ubus"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libubox
	lua? ( dev-lang/lua )
	ubus? ( sys-apps/ubus )
	ssl? ( dev-libs/ustream-ssl )
"

src_prepare() {
	default
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		-DTLS_SUPPORT=$(usex ssl)
		-DLUA_SUPPORT=$(usex lua)
		-DUBUS_SUPPORT=$(usex ubus)
	)
	cmake_src_configure
}
