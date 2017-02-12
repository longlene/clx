# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Surus accelerates ActiveRecord with PostgreSQL specific types and
                    functionality"
HOMEPAGE="https://github.com/JackC/surus"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">dev-ruby/activerecord-4.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0.9.1"
ruby_add_rdepend ">=dev-ruby/oj-2.0.2"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/pry-0.9.11"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.2.0"
ruby_add_rdepend ">=dev-ruby/faker-1.4.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"

