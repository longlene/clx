# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Because you would rather spend your time building stuff than fighting provisioning"
HOMEPAGE="https://fastlane.tools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fastlane_core-0.52.1"
ruby_add_rdepend ">=dev-ruby/plist-3.1"
ruby_add_rdepend ">=dev-ruby/spaceship-0.34.2"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/rspec_junit_formatter-0.2.3"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7.4"
ruby_add_rdepend ">=dev-ruby/webmock-1.19.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/fastlane-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.38.0"

