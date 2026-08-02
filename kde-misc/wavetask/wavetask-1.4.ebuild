# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.0.0
QTMIN=6.4.0
inherit ecm

DESCRIPTION="KDE Plasma task manager panel applet with OSX-style icon zoom"
HOMEPAGE="https://github.com/vickoc911/org.vicko.wavetask"
SRC_URI="https://github.com/vickoc911/org.vicko.wavetask/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/org.vicko.wavetask-${PV}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kbookmarks-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	>=kde-plasma/kwin-6.0.0:6
	>=kde-plasma/libksysguard-6.0.0:6
	>=kde-plasma/libplasma-6.0.0:6=
	>=kde-plasma/plasma-activities-6.0.0:6=
	>=kde-plasma/plasma-activities-stats-6.0.0:6=
	>=kde-plasma/plasma-workspace-6.0.0:6=
"
RDEPEND="${DEPEND}"
