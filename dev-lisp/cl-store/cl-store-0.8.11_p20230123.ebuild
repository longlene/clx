# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="adb52a1f7d6d2ebb77e8fa3d9682dc5fd6fc896f"

DESCRIPTION="A Common Lisp library for serializing and deserializing Common Lisp objects"
HOMEPAGE="http://common-lisp.net/project/cl-store/"
SRC_URI="https://github.com/skypher/cl-store/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

DEPEND=""
