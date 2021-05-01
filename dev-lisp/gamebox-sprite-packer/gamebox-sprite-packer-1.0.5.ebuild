# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A spritesheet packer for games"
HOMEPAGE="https://github.com/mfiano/gamebox-sprite-packer"
SRC_URI="https://github.com/mfiano/gamebox-sprite-packer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/pngload
	dev-lisp/opticl
"
