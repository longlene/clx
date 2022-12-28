# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="a5e119a9dc9a0160211c4c54fdbe83ae5dabcc43"

DESCRIPTION="Plugins for the Lite XL editor"
HOMEPAGE="https://github.com/lite-xl/lite-xl-plugins"
SRC_URI="https://github.com/lite-xl/lite-xl-plugins/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	app-editors/lite-xl
"
BDEPEND=""

src_install() {
	insinto /usr/share/lite-xl/
	doins -r plugins
	einstalldocs
}
