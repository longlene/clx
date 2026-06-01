# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp OpenStack client"
HOMEPAGE="https://github.com/stackforge/cl-openstack-client"

EGIT_REPO_URI="https://github.com/stackforge/cl-openstack-client.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE="test"
RESTRICT="!test? ( test )"

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
