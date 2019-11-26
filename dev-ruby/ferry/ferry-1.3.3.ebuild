# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ferry is a data migration and visualization command line tool rubygem that seeks to simplify the increasingly prevalent big data problems for developers"
HOMEPAGE="https://cmu-is-projects.github.io/ferry"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.1.7"
ruby_add_rdepend ">=dev-ruby/arel-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.5.0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/minitest-5.4.1"
ruby_add_rdepend ">=dev-ruby/mysql2-0.3.16"
ruby_add_rdepend ">=dev-ruby/pg-0.17.1"
ruby_add_rdepend ">=dev-ruby/rake-10.3.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.10"
ruby_add_rdepend ">=dev-ruby/progressbar-0.21.0"
ruby_add_rdepend ">=dev-ruby/highline-1.6.21"

