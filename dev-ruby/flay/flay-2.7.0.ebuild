# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Flay analyzes code for structural similarities"
HOMEPAGE="http://ruby.sadi.st/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sexp_processor-4.0"
ruby_add_rdepend ">=dev-ruby/ruby_parser-3.0"
ruby_add_rdepend ">=dev-ruby/erubis-2.7.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.8"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.14"

