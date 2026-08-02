# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp bindings for libpam (Pluggable Authentication Modules)"
HOMEPAGE="https://github.com/calsys456/cl-pam"
SRC_URI="https://github.com/calsys456/cl-pam/archive/ab15544333c00b3a359928de760a7f902d56be83.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-ab15544333c00b3a359928de760a7f902d56be83"

LICENSE="0BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-lisp/cffi
	dev-lisp/closer-mop
	dev-lisp/split-sequence
	sys-libs/pam
"

DOCS=( README.rst )
