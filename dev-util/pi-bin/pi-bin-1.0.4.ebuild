# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Coding agent CLI with read, bash, edit, write tools and session management"
HOMEPAGE="
	https://github.com/earendil-works/pi/
	https://pi.dev/
"
MY_URI="https://github.com/earendil-works/pi/releases/download/v${PV}"
SRC_URI="
	amd64? (
		${MY_URI}/pi-linux-x64.tar.gz -> pi-linux-x64-${PV}.tar.gz
	)
	arm64? (
		${MY_URI}/pi-linux-arm64.tar.gz -> pi-linux-arm64-${PV}.tar.gz
	)
"

S="${WORKDIR}"/pi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RESTRICT="mirror strip"

QA_PREBUILT="
	opt/${PN}/pi
	opt/${PN}/native/linux/prebuilds/linux-x64/linux-platform-x11.node
	opt/${PN}/native/linux/prebuilds/linux-arm64/linux-platform-x11.node
"

RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	# pi resolves its own docs/README.md/CHANGELOG.md as siblings of the
	# running binary (getPackageDir() -> dirname(process.execPath)), so
	# these must also land under /opt/${PN}/ verbatim -- dodoc's copy here
	# is only for the standard /usr/share/doc location, not a replacement.
	dodoc -r docs README.md CHANGELOG.md

	insinto /opt/${PN}/
	doins -r ./*
	fperms a+x /opt/${PN}/pi

	dodir /opt/bin
	dosym "../${PN}/pi" /opt/bin/pi
}
