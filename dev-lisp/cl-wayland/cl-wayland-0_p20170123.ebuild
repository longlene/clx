# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3045c2365db85c9b44395a3c94f4a0210d721e0a"

DESCRIPTION="Common Lisp bindings for libwayland"
HOMEPAGE="https://github.com/malcolmstill/cl-wayland"
SRC_URI="https://github.com/malcolmstill/cl-wayland/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/closer-mop
	dev-libs/wayland
"
