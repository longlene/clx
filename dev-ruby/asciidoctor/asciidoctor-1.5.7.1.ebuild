# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A fast, open source text processor and publishing toolchain, written in Ruby, for converting AsciiDoc content to HTML5, DocBook 5 (or 4"
HOMEPAGE="http://asciidoctor.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/asciimath-1.0.0"
ruby_add_rdepend ">=dev-ruby/coderay-1.1.0"
ruby_add_rdepend ">=dev-ruby/cucumber-2.4.0"
ruby_add_rdepend ">=dev-ruby/erubis-2.7.0"
ruby_add_rdepend ">=dev-ruby/haml-5.0.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.8.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-2.14.0"
ruby_add_rdepend ">=dev-ruby/slim-3.0.0"
ruby_add_rdepend ">=dev-ruby/thread_safe-0.3.0"
ruby_add_rdepend ">=dev-ruby/tilt-2.0.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.3.0"

