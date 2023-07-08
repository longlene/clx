# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="e1d758a292e5b0070812fea55577248e7b95f5d7"

DESCRIPTION="An OCI-based ASDF system distribution and management tool for Common Lisp"
HOMEPAGE="https://github.com/ocicl/ocicl"
SRC_URI="https://github.com/ocicl/ocicl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-lisp/sbcl"

QA_PRESTRIPPED="/usr/bin/ocicl"

src_compile() {
	emake
}

src_install() {
	dobin ocicl
	einstalldocs
}
