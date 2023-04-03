# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://github.com/ngty/sourcify"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby2ruby-1.2.5"
ruby_add_rdepend ">=dev-ruby/sexp_processor-3.0.5"
ruby_add_rdepend ">=dev-ruby/ruby_parser-2.0.5"
ruby_add_rdepend ">=dev-ruby/file-tail-1.0.5"
ruby_add_rdepend ">=dev-ruby/bacon-0"

