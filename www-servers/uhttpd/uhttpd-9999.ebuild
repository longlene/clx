# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="Tiny single-threaded httpd"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI=""

EGIT_REPO_URI="git://nbd.name/uhttpd.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tls cgi ubus lua"

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/libubox
ubus? ( sys-apps/ubus )
tls? ( dev-libs/openssl )"

src_prepare() {
	sed -i 's|\<json/json.h\>|json-c/json.h|' uhttpd-ubus.c
}

src_configure() {
	local mycmakeargs

	if use tls ; then
		mycmakeargs=(
		$(cmake-utils_use cgi CGI_SUPPORT)
		$(cmake-utils_use ubus UBUS_SUPPORT)
		$(cmake-utils_use lua LUA_SUPPORT)
		-DTLS_SUPPORT="openssl"
		)
	else
		mycmakeargs=(
		$(cmake-utils_use cgi CGI_SUPPORT)
		$(cmake-utils_use ubus UBUS_SUPPORT)
		$(cmake-utils_use lua LUA_SUPPORT)
		-DTLS_SUPPORT="none"
		)
	fi
	cmake-utils_src_configure

}
