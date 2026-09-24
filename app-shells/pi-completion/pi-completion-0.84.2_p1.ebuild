# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit shell-completion

MY_PV="0.84.2-post1"

DESCRIPTION="Shell completion (zsh, bash, pwsh) for the pi coding agent"
HOMEPAGE="
	https://github.com/ttimasdf/pi-completion
	https://www.npmjs.com/package/pi-completion
"
SRC_URI="https://registry.npmjs.org/pi-completion/-/pi-completion-${MY_PV}.tgz -> ${P}.tar.gz"
S="${WORKDIR}/package"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=net-libs/nodejs-22.19.0"

DOCS=( README.md README.zh-CN.md )

src_compile() {
	:
}

src_install() {
	local libdir="/usr/lib/${PN}"

	insinto "${libdir}"
	doins -r dist

	fperms a+x "${libdir}/dist/cli.js"
	dodir /usr/bin
	dosym "../lib/${PN}/dist/cli.js" "/usr/bin/${PN}"

	dozshcomp dist/completions/_pi
	newbashcomp dist/completions/pi.bash pi

	einstalldocs
}
