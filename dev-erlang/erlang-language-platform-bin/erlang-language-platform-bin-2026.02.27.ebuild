# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="${PV//./-}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Erlang Language Platform"
HOMEPAGE="https://github.com/WhatsApp/erlang-language-platform/"
SRC_URI="
	amd64? (
		https://github.com/WhatsApp/erlang-language-platform/releases/download/${MY_PV}/elp-linux-x86_64-unknown-linux-gnu-otp-28.tar.gz -> ${P}-x86_64.tar.gz
	)
	arm64? (
		https://github.com/WhatsApp/erlang-language-platform/releases/download/${MY_PV}/elp-linux-aarch64-unknown-linux-gnu-otp-28.tar.gz -> ${P}-aarch64.tar.gz
	)
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_compile() {
	:
}

src_install() {
	dobin elp
}
