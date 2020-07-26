# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="89278f88513ef328d290aa8b2baa06d63b44a9b1"

DESCRIPTION="Rucksack: a flexible, light weight, open source persistence library for common lisp."
HOMEPAGE="http://common-lisp.net/project/rucksack"
SRC_URI="https://github.com/arieltan/rucksack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="doc"

DEPEND=""

