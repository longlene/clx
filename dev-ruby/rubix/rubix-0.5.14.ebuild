# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rubix provides abstractions for connecting to Zabbix's API, an ORM for wrapping Zabbix resources, a set of scripts for writing data to Zabbix, and a collection of Monitor classes for building periodic monitors"
HOMEPAGE="http://github.com/dhruvbansal/rubix"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/oj-0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/configliere-0.4.16"
ruby_add_rdepend ">=dev-ruby/multipart-post-0"

