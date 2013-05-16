# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

DESCRIPTION="a new Android development environment based on IntelliJ IDEA"
HOMEPAGE="https://developer.android.com/sdk/installing/studio.html"
SRC_URI="http://dl.google.com/android/studio/android-studio-bundle-${PV}-linux.tgz -> ${P}.tgz"

LICENSE="apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
virtual/jdk"

STUDIO_DIR="/opt/${PN}"

QA_FLAGS_IGNORED_x86="
${STUDIO_DIR/\/}/sdk/platform-tools/adb
${STUDIO_DIR/\/}/sdk/platform-tools/fastboot
${STUDIO_DIR/\/}/sdk/tools/sqlite3
"


S=${WORKDIR}/${PN}

pkg_setup() {
	enewgroup android
}

src_install() {
	local dest=/opt/${PN}

	insinto ${dest}
	doins -r lib license plugins sdk bin

	fowners root:android "${dest}"
	fperms 0775 "${dest}"/{bin/*,sdk/platform-tools/*}

	make_desktop_entry "${dest}/bin/studio.sh" " Android Studio" "${dest}/bin/idea.png"
}

