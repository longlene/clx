# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-util/android-sdk-update-manager
dev-util/android-ndk"

COCOS2D_DIR="/opt/${PN}"
ENVD="${T}/80${PN}"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {

	echo "NDK_ROOT=\"${EPREFIX}/${COCOS2D_DIR}\"" > "${ENVD}"

	#printf '%s' \
	#	"NDK_ROOT=\"${EPREFIX}/${COCOS2D_DIR}" \
	#	$'\n' \
	#	> "${T}/80${PN}" || die
	doenvd "${ENVD}"



}|
