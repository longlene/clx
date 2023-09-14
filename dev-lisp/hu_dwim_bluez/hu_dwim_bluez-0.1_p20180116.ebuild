# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="552fc8e8f6c34d76a2231cd23057d5e75e257fa1"

DESCRIPTION="Common Lisp FFI for libbluetooth"
HOMEPAGE="https://github.com/hu-dwim/hu.dwim.bluez"
SRC_URI="https://github.com/hu-dwim/hu.dwim.bluez/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	net-wireless/bluez
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all c2ffi-spec
}
