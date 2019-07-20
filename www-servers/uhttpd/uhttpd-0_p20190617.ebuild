# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="91fcac34ac014a565fdd6312de088d312b5ba7ec"

DESCRIPTION="Tiny single-threaded httpd"
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
	ssl? ( net-libs/ustream-ssl )
"

src_prepare() {
	default
	sed -i 's|\<json/json.h\>|json-c/json.h|' uhttpd-ubus.c
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		-DTLS_SUPPORT=$(usex ssl)
		-DLUA_SUPPORT=$(usex lua)
		-DUBUS_SUPPORT=$(usex ubus)
	)
	cmake-utils_src_configure
}
