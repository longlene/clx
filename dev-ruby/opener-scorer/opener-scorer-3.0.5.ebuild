# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Component for calculating scores of KAF documents"
HOMEPAGE="http://opener-project.github.com/"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/slop-3.5"
ruby_add_rdepend ">=dev-ruby/jdbc-mysql-0"
ruby_add_rdepend ">=dev-ruby/activerecord-jdbcmysql-adapter-0"
ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_rdepend ">=dev-ruby/opener-daemons-2.2"
ruby_add_rdepend ">=dev-ruby/opener-webservice-2.1"
ruby_add_rdepend ">=dev-ruby/opener-core-2.2"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

