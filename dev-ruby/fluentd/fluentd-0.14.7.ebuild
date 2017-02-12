# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Fluentd is an open source data collector designed to scale and simplify log management"
HOMEPAGE="http://fluentd.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/msgpack-0.7.0"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/cool_io-1.4.5"
ruby_add_rdepend ">=dev-ruby/serverengine-2.0"
ruby_add_rdepend ">=dev-ruby/http_parser_rb-0.5.1"
ruby_add_rdepend ">=dev-ruby/sigdump-0.2.2"
ruby_add_rdepend ">=dev-ruby/tzinfo-1.0"
ruby_add_rdepend ">=dev-ruby/tzinfo-data-1.0"
ruby_add_rdepend ">=dev-ruby/strptime-0.1.7"
ruby_add_rdepend ">=dev-ruby/rake-11.0"
ruby_add_rdepend ">=dev-ruby/flexmock-2.0"
ruby_add_rdepend ">=dev-ruby/parallel_tests-0.15.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0.7"
ruby_add_rdepend ">=dev-ruby/rr-1.0"
ruby_add_rdepend ">=dev-ruby/timecop-0.3"
ruby_add_rdepend ">=dev-ruby/test-unit-3.2"
ruby_add_rdepend ">=dev-ruby/test-unit-rr-1.0"
ruby_add_rdepend ">=dev-ruby/oj-2.14"

