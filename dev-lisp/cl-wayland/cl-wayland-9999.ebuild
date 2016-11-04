# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp bindings for libwayland"
HOMEPAGE="https://github.com/malcolmstill/cl-wayland"
SRC_URI=""

EGIT_REPO_URI="https://github.com/malcolmstill/cl-wayland.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-libs/wayland
"
