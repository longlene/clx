# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides a semantic DSL to construct a fluent interface for test execution libraries"
HOMEPAGE="https://github.com/jnyman/fluent"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/require_all-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"
ruby_add_rdepend "=dev-ruby/watir-webdriver-0.6.4"
ruby_add_rdepend "=dev-ruby/selenium-webdriver-2.39.0"
ruby_add_rdepend ">=dev-ruby/mechanize-2.7.3"

