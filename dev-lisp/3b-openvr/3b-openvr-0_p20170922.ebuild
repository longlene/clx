# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="743c363244d1dd9dff451eb4522964ab24db31f9"

DESCRIPTION="Common Lisp bindings to OpenVR API"
HOMEPAGE="https://github.com/3b/3b-openvr"
SRC_URI="https://github.com/3b/3b-openvr/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/trivial-features
"
