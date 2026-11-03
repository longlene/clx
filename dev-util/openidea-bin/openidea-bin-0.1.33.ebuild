# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg-utils

DESCRIPTION="Open-source IDE inspired by IntelliJ IDEA"
HOMEPAGE="https://github.com/l0ng-ai/openidea"
# Release bundles built by upstream CI; building from source would additionally
# need a Node.js and pnpm toolchain for the Tauri frontend.
SRC_URI="
	amd64? (
		https://github.com/l0ng-ai/openidea/releases/download/v${PV}/OpenIDEA_${PV}_amd64.deb
			-> ${PN}-amd64-${PV}.deb
		https://github.com/l0ng-ai/openidea/releases/download/v${PV}/openidea-server-linux-x86_64.gz
			-> ${PN}-server-x86_64.gz
	)
	arm64? (
		https://github.com/l0ng-ai/openidea/releases/download/v${PV}/OpenIDEA_${PV}_arm64.deb
			-> ${PN}-arm64-${PV}.deb
		https://github.com/l0ng-ai/openidea/releases/download/v${PV}/openidea-server-linux-aarch64.gz
			-> ${PN}-server-aarch64.gz
	)
"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

# Libraries directly linked by the bundled binary besides libc; it also runs
# xdg-open and reads /usr/share/zoneinfo.
RDEPEND="
	dev-libs/glib:2
	net-libs/libsoup:3.0
	net-libs/webkit-gtk:4.1
	sys-apps/dbus
	sys-libs/timezone-data
	x11-misc/xdg-utils
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
"
IDEPEND="
	dev-util/desktop-file-utils
	dev-util/gtk-update-icon-cache
"

QA_PREBUILT="usr/bin/openidea"

src_install() {
	dobin usr/bin/openidea

	# Remote development backend: the app uses one found next to its own
	# executable (local_server_binary in src-tauri/src/remote_dev.rs) instead of
	# downloading it at runtime.
	newbin "${PN}-server-$(usex arm64 aarch64 x86_64)" openidea-server

	domenu usr/share/applications/OpenIDEA.desktop

	local x
	for x in 32 128; do
		doicon -s ${x} usr/share/icons/hicolor/${x}x${x}/apps/openidea.png
	done
	# doicon knows no @2 scale factor
	insinto /usr/share/icons/hicolor/256x256@2/apps
	doins usr/share/icons/hicolor/256x256@2/apps/openidea.png
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
