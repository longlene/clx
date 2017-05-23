# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Breaks up states, actions, and contexts into seperate classes"
HOMEPAGE="http://github.com/moonmaster9000/yasm"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/i18n-0.5.0"
ruby_add_rdepend ">=dev-ruby/symbolism-0.0.1"
ruby_add_rdepend ">=dev-ruby/couchrest_model-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0.10.0"

