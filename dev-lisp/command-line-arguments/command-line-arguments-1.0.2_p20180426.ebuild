# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="44cd50c3f95fbc94eac1277770fb3a1090f9ca5d"

DESCRIPTION="Trivial interface for getting and parsing command-line-arguments"
HOMEPAGE="https://github.com/GrammaTech/command-line-arguments"
SRC_URI="https://github.com/GrammaTech/command-line-arguments/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

