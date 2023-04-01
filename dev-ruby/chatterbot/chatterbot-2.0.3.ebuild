# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A ruby framework for writing bots that run on Twitter"
HOMEPAGE="http://github.com/muffinista/chatterbot"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/oauth-0.4.7"
ruby_add_rdepend ">=dev-ruby/twitter-5.16.0"
ruby_add_rdepend ">=dev-ruby/launchy-2.4.2"
ruby_add_rdepend ">=dev-ruby/colorize-0.7.3"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/shoulda-0"
ruby_add_rdepend "<dev-ruby/rake-11"
ruby_add_rdepend ">=dev-ruby/rspec-3.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.0.2"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/observr-0"

