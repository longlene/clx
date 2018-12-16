# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Efficient, convenient, non-intrusive JSONAPI framework for Rails"
HOMEPAGE="https://github.com/jsonapi-rb/jsonapi-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jsonapi-rb-0.5.0"
ruby_add_rdepend ">=dev-ruby/jsonapi-parser-0.1.0"
ruby_add_rdepend ">=dev-ruby/rails-5.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/rake-11.3"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.5"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

