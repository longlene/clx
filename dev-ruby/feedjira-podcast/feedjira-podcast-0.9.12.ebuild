# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Podcast feed parsing with Feedjira"
HOMEPAGE="https://github.com/scour/feedjira-podcast"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.8"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.5"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"
ruby_add_rdepend ">=dev-ruby/feedjira-2.0"
ruby_add_rdepend ">=dev-ruby/addressable-2.3"

