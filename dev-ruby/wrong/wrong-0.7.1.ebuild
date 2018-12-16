# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Wrong provides a general assert method that takes a predicate block"
HOMEPAGE="http://github.com/sconover/wrong"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/predicated-0.2.6"
ruby_add_rdepend ">=dev-ruby/ruby_parser-3.0.1"
ruby_add_rdepend ">=dev-ruby/ruby2ruby-2.0.1"
ruby_add_rdepend ">=dev-ruby/sexp_processor-4.0"
ruby_add_rdepend ">=dev-ruby/diff-lcs-1.2.5"

