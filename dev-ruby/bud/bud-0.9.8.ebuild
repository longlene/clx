# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A prototype of the Bloom distributed programming language as a Ruby DSL"
HOMEPAGE="http://www.bloom-lang.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "=dev-ruby/backports-3.8.0"
ruby_add_rdepend "=dev-ruby/eventmachine-1.2.5"
ruby_add_rdepend "=dev-ruby/fastercsv-1.5.5"
ruby_add_rdepend "=dev-ruby/getopt-1.4.3"
ruby_add_rdepend "=dev-ruby/msgpack-1.1.0"
ruby_add_rdepend "=dev-ruby/ruby-graphviz-1.2.3"
ruby_add_rdepend "=dev-ruby/ruby2ruby-2.4.0"
ruby_add_rdepend "=dev-ruby/ruby_parser-3.10.1"
ruby_add_rdepend "=dev-ruby/superators19-0.9.3"
ruby_add_rdepend "=dev-ruby/syntax-1.2.2"
ruby_add_rdepend "=dev-ruby/uuid-2.3.8"
ruby_add_rdepend "=dev-ruby/minitest-2.5.1"

