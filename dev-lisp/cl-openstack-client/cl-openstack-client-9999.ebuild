# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp OpenStack client"
HOMEPAGE="https://github.com/stackforge/cl-openstack-client"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stackforge/cl-openstack-client.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
	dev-lisp/drakma
	dev-lisp/local-time
	dev-lisp/alexandria
	dev-lisp/uri-template
"

src_prepare() {
	use test || rm -rf tests ${PN}-test.asd run-tests.lisp update-deps.lisp
}
