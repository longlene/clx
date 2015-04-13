# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp OpenStack client"
HOMEPAGE="https://github.com/stackforge/cl-openstack-client"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stackforge/cl-openstack-client.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/drakma
dev-lisp/cl-json"

