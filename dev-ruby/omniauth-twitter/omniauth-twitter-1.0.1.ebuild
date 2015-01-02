# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="OmniAuth strategy for Twitter"
HOMEPAGE="https://github.com/arunagw/omniauth-twitter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/multi_json-1.3"
ruby_add_rdepend ">=dev-ruby/omniauth-oauth-1.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
