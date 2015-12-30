# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Brakeman detects security vulnerabilities in Ruby on Rails applications via static analysis"
HOMEPAGE="http://brakemanscanner.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby_parser-3.5.0"
ruby_add_rdepend ">=dev-ruby/ruby2ruby-2.0.5"
ruby_add_rdepend ">=dev-ruby/terminal-table-1.4"
ruby_add_rdepend ">=dev-ruby/fastercsv-1.5"
ruby_add_rdepend ">=dev-ruby/highline-1.6.20"
ruby_add_rdepend ">=dev-ruby/erubis-2.6"
ruby_add_rdepend ">=dev-ruby/haml-3.0"
ruby_add_rdepend ">=dev-ruby/sass-3.0"
ruby_add_rdepend ">=dev-ruby/slim-1.3.6"
ruby_add_rdepend ">=dev-ruby/multi_json-1.2"

