# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8d125ad7ceb1393c678f9c2238ec86870fcd2393"

DESCRIPTION="Bindings to libflac, a simple library to decode FLAC files"
HOMEPAGE="https://github.com/Shirakumo/cl-flac"
SRC_URI="https://github.com/Shirakumo/cl-flac/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/documentation-utils
	media-libs/flac
"
