# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="An OCI-based ASDF system distribution and management tool for Common Lisp"
HOMEPAGE="https://github.com/ocicl/ocicl"
SRC_URI="https://github.com/ocicl/ocicl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/with-user-abort 
	dev-lisp/unix-opts 
	dev-lisp/dexador 
	dev-lisp/cl-json 
	dev-lisp/cl-interpol 
	dev-lisp/tar 
	dev-lisp/copy-directory 
"
BDEPEND="dev-lisp/sbcl"

#QA_PRESTRIPPED="/usr/bin/ocicl"

src_install() {
	common-lisp-3_src_install
	#dobin ocicl
}
