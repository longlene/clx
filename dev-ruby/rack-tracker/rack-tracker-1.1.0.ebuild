# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Don’t fool around with adding tracking partials to your app and concentrate on the things that matter"
HOMEPAGE="https://github.com/railslove/rack-tracker"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.4"
ruby_add_rdepend ">=dev-ruby/tilt-1.4"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/actionpack-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/capybara-2.4"
ruby_add_rdepend ">=dev-ruby/pry-0"

