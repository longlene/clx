# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Write specs for your Rails 3+ generators"
HOMEPAGE="https://github.com/alexrothenberg/ammeter"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.2"
ruby_add_rdepend ">=dev-ruby/rails-3.1"
ruby_add_rdepend ">=dev-ruby/uglifier-1.2.4"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2.2"
ruby_add_rdepend ">=dev-ruby/coffee-rails-3.2.2"
ruby_add_rdepend ">=dev-ruby/sass-rails-3.2.5"
ruby_add_rdepend ">=dev-ruby/jquery-rails-2.0.2"
ruby_add_rdepend ">=dev-ruby/haml-rails-0.4"
ruby_add_rdepend ">=dev-ruby/cucumber-0.10"
ruby_add_rdepend ">=dev-ruby/aruba-0.3"
ruby_add_rdepend ">=dev-ruby/sqlite3-1"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
