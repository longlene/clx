# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Tell test/unit exactly which tests you want run"
HOMEPAGE="http://github.com/mynyml/watchr"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nanotest-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/thoughtbot-shoulda-0"
ruby_add_rdepend ">=dev-ruby/citrusbyte-contest-0"
ruby_add_rdepend ">=dev-ruby/jeremymcanally-context-0"

