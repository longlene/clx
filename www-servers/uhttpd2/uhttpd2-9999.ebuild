# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="Tiny single-threaded httpd"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI=""

EGIT_REPO_URI="git://nbd.name/uhttpd2.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tls ubus lua"

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/libubox[json]
ubus? ( sys-apps/ubus )
tls? ( dev-libs/ustream-ssl )
!www-servers/uhttpd"

#src_prepare() {
#	sed -i 's|\<json/json.h\>|json-c/json.h|' uhttpd-ubus.c
#}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use ubus UBUS_SUPPORT)
		$(cmake-utils_use lua LUA_SUPPORT)
		$(cmake-utils_use tls TLS_SUPPORT)
		)
	cmake-utils_src_configure

}
