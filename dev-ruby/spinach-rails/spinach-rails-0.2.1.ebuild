# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="spinach-rails adds Rails support to spinach"
HOMEPAGE="http://github.com/codegram/spinach-rails"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/capybara-2.0.0"
ruby_add_rdepend ">=dev-ruby/spinach-0.4"
ruby_add_rdepend ">=dev-ruby/railties-3"
ruby_add_rdepend ">=dev-ruby/aruba-0"
ruby_add_rdepend ">=dev-ruby/rails-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

