# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Add Gemnasium support for Gitlab as a Project Service"
HOMEPAGE="https://gemnasium.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rugged-0.19"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
