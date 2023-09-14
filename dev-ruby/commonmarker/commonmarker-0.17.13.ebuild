# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A fast, safe, extensible parser for CommonMark"
HOMEPAGE="http://github.com/gjtorikian/commonmarker"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby-enum-0.5"
ruby_add_rdepend ">=dev-ruby/minitest-5.6"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.9"
ruby_add_rdepend ">=dev-ruby/bundler-1.2"
ruby_add_rdepend ">=dev-ruby/json-1.8.1"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/rdoc-5.1"

