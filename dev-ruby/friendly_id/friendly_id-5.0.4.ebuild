# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="FriendlyId is the \"Swiss Army bulldozer\" of slugging and permalink plugins for
Active Record"
HOMEPAGE="http://github.com/norman/friendly_id"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.0.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/railties-4.0"
ruby_add_rdepend ">=dev-ruby/minitest-4.4.0"
ruby_add_rdepend ">=dev-ruby/mocha-0.13.3"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/ffaker-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

