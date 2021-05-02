# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://CooCoo.network/"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.14"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/yard-rspec-0"
ruby_add_rdepend ">=dev-ruby/pry-0.11.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/coderay-0"
ruby_add_rdepend ">=dev-ruby/nmatrix-0"
ruby_add_rdepend ">=dev-ruby/parallel-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-0"
ruby_add_rdepend ">=dev-ruby/chunky_png-0"
ruby_add_rdepend ">=dev-ruby/cairo-0"
ruby_add_rdepend ">=dev-ruby/colorize-0"
ruby_add_rdepend ">=dev-ruby/ffi-0"

