# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp bindings for the OpenAL audio library"
HOMEPAGE="https://github.com/sykopomp/cl-openal"
SRC_URI=""

EGIT_REPO_URI="https://github.com/zkat/cl-openal.git"

LICENSE="public-domain"
SLOT="0"
#KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/openal
	dev-lisp/cffi
"

